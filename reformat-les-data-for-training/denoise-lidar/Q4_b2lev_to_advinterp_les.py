'''
Given b2-level lidar data and corresponding met mast data,
  run the advection-interpolation of Beck and Kuhn (2019).
  Produce lidar "measurements" that have been upsampled
  to a frequency of ~1 second.
This file is based off of the real-world processing file.
  The only changes: I deleted references to the outflow
  lidar and the metmast.
  TODO: Tweak the real-world processing file so I can
    directly apply it to LES data, without having to
    make a duplicate file
'''

from datetime import datetime
import numpy as np
import matplotlib.pyplot as plt
import scipy.interpolate as interpolate
import xarray as xr

class halo_interp:
    def __init__(self, inflow_lidar_file, D, dx_sim, gappy_inflow=False, mean_yaw=90.0, wdir_inf=180.0):
        '''
        Inputs:
        - inflow_lidar_file: b2-level inflow Halo data
        - D: rotor diameter [m]
        - dx_sim: grid resolution of associated LES simulations [m]; for cartesian interpolation
        - mean_yaw & wdir_inf: carried these over from the real script;
            To get reasonable U values, use mean_yaw=90 amd wdir_inf=180
        '''

        ## Grab basic observations
        ds_in = xr.open_dataset(inflow_lidar_file)
        self.ds_in = ds_in  # TODO: Delete this
#         uinf = obs.inflow_statistics.WS_infty.values

        ## Common params
        self.D = D
        self.dx_sim = dx_sim

        # Inflow lidar - get time, X, Y
        nrep_in = len(ds_in['rep'])
        coords_beam_in = ds_in['beam']
        coords_range_in = ds_in['range']
        data_X_in = ds_in['X'].values  # 'X' has coordinates (range, beam)
        data_Y_in = ds_in['Y'].values

        time1D_in = self.calc_time1D(ds_in['time'], nrep_in)
        self.time1D_in = time1D_in   # TODO: Delete this
        common_coords_in = {'beam': coords_beam_in,
                        'range': coords_range_in,
                        'time': time1D_in}
        
        self.mean_yaw = mean_yaw
        self.wdir_inf = wdir_inf
        
        # Inflow lidar - calculate radius & u-component of velocity
        ds_in['radius'] = self._XY_to_R(ds_in['X'], ds_in['Y'])
        ds_in['U'] = self._rws_to_streamwise(ds_in['azimuth'], ds_in['rws'])

        ### Do interpolation on the lidar data
        ## Inflow lidar
        if gappy_inflow:  # If inflow lidar has very gappy data, fill in gaps using nearest neighbor
            in_u_var = 'U_nearest'
            u_nearest_data_in = self.calc_u_nearest(ds_in['U'],
                                               data_X_in,
                                               data_Y_in,
                                               nrep_in)
            ds_in[in_u_var] = (('range', 'beam', 'rep'), u_nearest_data_in)
        else:
            in_u_var = 'U'

        u_f_in = self.calc_advect(ds_in[in_u_var],
                                   data_X_in,
                                   data_Y_in,
                                   common_coords_in,
                                   ds_in['beam'],
                                   ds_in['rep'],
                                   ds_in['time'],
                                   'forward')
        self.u_f_in = u_f_in
        u_b_in = self.calc_advect(ds_in[in_u_var], 
                                   data_X_in, 
                                   data_Y_in, 
                                   common_coords_in,
                                   ds_in['beam'],
                                   ds_in['rep'],
                                   ds_in['time'],
                                   'backward')
        self.u_b_in = u_b_in
        
        # Merge
        time_frac_in = self.calc_timestep_betw_scans(time1D_in, ds_in['time'])
        self.time_frac_in = time_frac_in  # TODO: Delete this line
        weighting_in = self.calc_weighting_fcn(time_frac_in, len(time1D_in), len(ds_in['beam']))

        ds_merged_in = xr.Dataset(coords=common_coords_in)
        ds_merged_in['t_since_scan_frac'] = (('time', 'beam'), weighting_in)
        u_merged_in = self.merge_forward_backward(u_f_in, u_b_in, ds_merged_in['t_since_scan_frac'])
        ds_merged_in['U'] = u_merged_in
        self.ds_merged_in = ds_merged_in

        # Interpolate to x=-3D, -2.5D, -2D
        ds_in_3D = self.cartesian_interp(-3*self.D, 
                                         ds_in['X'], 
                                         ds_in['Y'], 
                                         ds_in['azimuth'], 
                                         ds_merged_in['U'], 
                                         common_coords_in['time'])
        self.ds_in_3D = ds_in_3D

    def _XY_to_R(self, X, Y):
        '''
        Compute radius from X and Y
        '''
        radius = np.sqrt(X**2 + Y**2)
        return radius

    # def _rws_to_U(self, X, Y, radius, rws):
    #     '''
    #     Project radial wind speed to the U-component (aligned with turbine, I think) of velocity
    #       Initially written by Paula, and accidentally butchered by Alex
    #     '''
    #     yaw_offset = self.mean_yaw-self.wdir_inf
    #     left  = X/radius*np.cos(np.deg2rad(yaw_offset))
    #     right = Y/radius*np.sin(np.deg2rad(yaw_offset))
    #     uvel = rws / (left+right)
    #     return uvel
    
    def _rws_to_streamwise(self, azimuth, rws):
        '''
        Project radial wind speed to the streamwise velocity,
          with reference to the mean turbine yaw
        Inputs:
        - A DataArray of azimuth
        - A DataArray of rws
        Note: In the real world, you should treat yaw_offset as 0 degrees,
           because we're in the turbine coordinate system. But in LES, I
           am keeping a non-zero yaw offset to allow for simple
           coordinate rotations
        '''
        yaw_offset = self.mean_yaw - self.wdir_inf
        rotated_azimuth =  azimuth * xr.ones_like(rws) + yaw_offset  # TODO: Triple check that it should be "+ yaw_offset", not "- yaw_offset"
        # streamwise = rws / np.cos(np.deg2rad(rotated_azimuth - self.wdir_inf))
        streamwise = rws / np.cos(np.deg2rad(rotated_azimuth - 90))
        return streamwise
        
        
    def calc_time1D(self, time2D, nrep_tot, rep_offset_start=1, rep_offset_end=2):
        '''
        Calculates a 1D time array that will act as the time coordinate
          for the forward/backward/merged advected wind fields
        Inputs:
        - time2D: A DataArray of timesteps
        - nrep_tot: Total number of reps in the input ds
        - rep_offset*: The number of reps to offset when calculating
            common time. These ensure only full scans are used + a
            buffer zone for calculations
        '''

        self.last_rep = nrep_tot-rep_offset_end
        
        first_full_scan = np.array([time2D.isel(rep=0, beam=-1).values])
        middle_scans = time2D.isel(rep=slice(rep_offset_start,self.last_rep)).values.flatten(order='F')
        last_scan = np.array([time2D.isel(rep=self.last_rep, beam=0).values])  # Timestep of the last... full scan ?

        time1D = np.concatenate((first_full_scan, middle_scans, last_scan))
        time1D = np.unique(time1D)  # Sometimes the measurements give output two beams of measurements in one timestamp

        return time1D

    def calc_u_nearest(self, gappy_u, x_fullgrid, y_fullgrid, nrep_in):
        '''
        Calculate `U_nearest`, which fills in NaN's in the U data
          for each scan. This variable helps remove problematic
          artifacts in the upsampling process

        Output: filled in U data; numpy array shaped like gappy_u
        '''
        u_nearest_data = np.zeros_like(gappy_u.data)
        x_fullgrid_flat, y_fullgrid_flat = x_fullgrid.flatten(), y_fullgrid.flatten()

        for repiter in range(nrep_in):
            gappy_u_flat = np.array(gappy_u.sel(rep=repiter)).flatten()

            nonnan_curr_u_scan = gappy_u_flat[~np.isnan(gappy_u_flat)]
            nonnan_curr_x_scan = x_fullgrid_flat[~np.isnan(gappy_u_flat)]
            nonnan_curr_y_scan = y_fullgrid_flat[~np.isnan(gappy_u_flat)]
            
            u_nearest_flat = interpolate.griddata(
                                            np.vstack((nonnan_curr_x_scan, nonnan_curr_y_scan)).T,
                                            nonnan_curr_u_scan,
                                            np.vstack((x_fullgrid_flat, y_fullgrid_flat)).T,
                                            method='nearest')
            u_nearest_data[:,:,repiter] = np.reshape(u_nearest_flat, x_fullgrid.shape).copy()

        return u_nearest_data

    def calc_advect(self, U_raw, x_grid, y_grid, coords,
                    beam_da, rep_da, time2D, adv_dir='forward'):
        '''
        Do either forward-in-time or
          backward-in-time advection interpolation
        Inputs:
        - U_raw: A DataArray with the u-component of velocity from the input ds;
                  This is NOT line-of-sight velocity
        - x/y_grid: the x/y grid associated with radial measurements
        - coords: the coordinates used to define the saved ds
        - adv_dir: The direction of advection; either 'forward' or 'backward'
        '''

        ## Calculate basic parameters
        ntime = len(coords['time'])
        nrange = len(coords['range'])
        nbeam = len(coords['beam'])

        time = coords['time']
        coords_beam = coords['beam']

        if adv_dir == 'forward':
            tstart, tend, titer = 0, ntime-1, 1
            init_rep = 0
        elif adv_dir == 'backward':
            tstart, tend, titer = ntime-1, 0, -1
            init_rep = self.last_rep
        else:
            raise ValueError(f'Argument adv_dir = {adv_dir} not recognized!')

        ### Calculate velocity
        ## Initialize velocity
        ##   Note: we initialize velocity using the first full scan at rep=0
        u_interp = np.zeros((ntime, nrange, nbeam))
        u_interp[tstart,:,:] = U_raw.isel(rep=init_rep).values
        v_curr = 0   # TODO: Relax this assumption, either by using cup anemometer or lidar meas directly

        ## March in time
        for tstep in range(tstart, tend, titer):
            # Calculate info about current timestep
            u_curr = u_interp[tstep,:,:].copy()

            # Advect to next timestep
            dt_next = (time[tstep+titer] - time[tstep]).copy() / np.timedelta64(1, 's')  # sec
            x_adv = x_grid + dt_next*u_curr
            y_adv = y_grid + dt_next*v_curr

            ## Interpolate spatially
            u_next = interpolate.griddata(
                        np.vstack((x_adv.flatten(), y_adv.flatten())).T,
                        u_curr.flatten(),
                        np.vstack((x_grid.flatten(), y_grid.flatten())).T,
                        method='nearest')
            u_interp[tstep+titer,:,:] = np.reshape(u_next.copy(), x_grid.shape).copy()

            ## Overwrite correct spots next timestep with a measurement
            t_next = time[tstep+titer]

            beam_next_arr = beam_da.where(time2D == t_next)
            beam_next_arr = beam_next_arr.values.flatten()
            beam_next_arr = beam_next_arr[~np.isnan(beam_next_arr)]

            rep_next_arr = rep_da.where(time2D == t_next)
            rep_next_arr = rep_next_arr.values.flatten()
            rep_next_arr = rep_next_arr[~np.isnan(rep_next_arr)]

            assert len(beam_next_arr) == len(rep_next_arr), f"Length mismatch in beam_next_arr {beam_next_arr} and rep_next_arr {rep_next_arr}??"
            for ind_beam in range(len(beam_next_arr)):  # Sometimes we get multiple beams of measurements in one timestamp
                beam_next = int(beam_next_arr[ind_beam])
                rep_next = int(rep_next_arr[ind_beam])
                # print(f"Time: {t_next.values}, rep {rep_next}, beam {beam_next}")

                meas_next = U_raw.isel(rep=rep_next, beam=beam_next).values  # TODO: relax assumption that zero y-velocity
                u_interp[tstep+titer,:,beam_next] = meas_next    
                
        ## Save
        da_out = xr.DataArray(data=u_interp,
                              dims=('time', 'range', 'beam'),
                              coords=coords)
        return da_out
    
    def calc_timestep_betw_scans(self, time1D, time2D):
        '''
        In preparation for weighted sums, calculate the
          t in w_n(t) between scans
        Inputs:
        - time1D: the flattened time axis that outputs as the common time coordinate
        - time2D: the DataArray holding time data with dimensions (rep, beam)
        '''
        n_beam = len(time2D['beam'])
        n_time1D = len(time1D)
        
        t_since_scan = np.nan * np.zeros((n_time1D, n_beam))
        t_since_scan_frac = np.nan * np.zeros((n_time1D, n_beam))
        
        for curr_beam in range(n_beam):  # Iterate over beams
            t_visits_curr_beam = time2D.isel(beam=curr_beam)  # Timestamps that the current beam is visited
            for itime, curr_time in enumerate(time1D):
                # Identify the time of the most recent visit
                tmp_count = (curr_time >= t_visits_curr_beam).sum()
                t_visit_prev = t_visits_curr_beam.values[tmp_count-1]
                curr_t_since_scan = (curr_time-t_visit_prev)/np.timedelta64(1, 's')
                t_since_scan[itime, curr_beam] = curr_t_since_scan

                # Calculate the fraction of travel through the time window
                t_visit_next = t_visits_curr_beam.values[tmp_count]
                len_twindow = (t_visit_next-t_visit_prev) / np.timedelta64(1, 's')
                curr_scan_frac = curr_t_since_scan / len_twindow

                t_since_scan_frac[itime, curr_beam] = curr_scan_frac

        # Do some basic checks                
        assert t_since_scan_frac.max() <= 1, "All fraction values here should be <=1!"
        assert t_since_scan_frac.min() >= 0, "All fraction values here should be >=0!"

        return t_since_scan_frac
    
    def calc_weighting_fcn(self, scan_frac_arr, n_time, n_beam):
        '''
        Calculate the relative weight between the forward advection
          and the backward advection. To be used when we want to sum
          these two.
        Inputs:
        - scan_frac_arr: the output of calc_timestep_betw_scans
        - n_time: the length of time1D TODO: Double check this
        '''
        
        forward_weighting = np.nan * np.zeros((n_time, n_beam))

        for i_beam in range(n_beam):  # Iterate over beams
            for i_time in range(n_time):
                curr_scan_frac = scan_frac_arr[i_time, i_beam]
                
                if curr_scan_frac <= 0.2:
                    curr_weight = 1.0
                else:
                    cosarg = np.pi/2 + 5*np.pi/4*(curr_scan_frac - 3/5)
                    curr_weight = 0.5 * (1 + np.cos(cosarg))
                forward_weighting[i_time, i_beam] = curr_weight

        return forward_weighting
    
    def merge_forward_backward(self, u_f, u_b, weighting):
        '''
        Calculate the weighted average of the forward advection
          and backward advection
        Returns a DataArray
        '''
        u_avg = u_f * weighting + u_b * (1-weighting)
        return u_avg
    
    def cartesian_interp(self, xloc, X, Y, azimuth, U_in, time_gappy, uniform_time_flag=True):
        '''
        Interpolate to an upstream/downstream location (e.g., x=-3D for inflow BCs)
          on a Cartesian grid.
        xloc: An xdistance to interpolate to, e.g. x=-3*D
        X, Y, azimuth, U: DataArray of X, Y, azimuth, U values
        time_gappy: A time axis with non-uniform intervals because the lidar resets to its initial azimuth
        uniform_time_flag: If True, output data on a uniform time axis, filling data gaps with NaN
        '''

        ### Establish distances and lengths
        xloc_unrounded = xloc

        ylo_unrounded = xloc_unrounded * np.tan(np.deg2rad(azimuth.values.min()))
        yhi_unrounded = xloc_unrounded * np.tan(np.deg2rad(azimuth.values.max()))
        if ylo_unrounded > yhi_unrounded:  # Swap values if they're backwards
            ylo_unrounded, yhi_unrounded = yhi_unrounded, ylo_unrounded

        # Round to LES grid resolution
        xloc_rounded = np.floor(round(xloc_unrounded/self.dx_sim)) * self.dx_sim
        ylo_rounded = np.floor(round(ylo_unrounded/self.dx_sim)) * self.dx_sim
        yhi_rounded = np.floor(round(yhi_unrounded/self.dx_sim)) * self.dx_sim
        yrange = np.arange(ylo_rounded, yhi_rounded + self.dx_sim, self.dx_sim)

        ### Interpolate
        uloc = np.zeros((len(time_gappy), len(yrange)))

        for i in range(len(time_gappy)):
            uloc_interp = interpolate.griddata(
                        np.vstack((X.values.flatten(), Y.values.flatten())).T,
                        U_in.isel(time=i).values.flatten(),
                        np.vstack((xloc_rounded * np.ones_like(yrange), yrange)).T,
                        method='nearest')
            uloc[i,:] = uloc_interp.copy()

        ### Save data with gappy time axis to Xarray
        coords_gappy = {'y': yrange,
                    'time': time_gappy}

        ds_gappy = xr.Dataset(coords=coords_gappy)
        ds_gappy['U'] = (('y', 'time'), uloc.T)
        ds_out = ds_gappy

        ### Optionally save to a Dataset with a uniform time axis
        if uniform_time_flag:
            uniform_time = np.arange(time_gappy[0], time_gappy[-1], 1000000000)
            coords_uniform = {'y': ds_gappy['y'],
                        'time': uniform_time}
            ds_uniform = xr.Dataset(coords_uniform)

            U_uniform = np.nan * np.zeros((len(ds_uniform['y']), len(ds_uniform['time'])))

            ## Populdate datasets
            for curr_time in uniform_time:
                if (time_gappy == curr_time).sum() > 0:
                    tind_uni = np.nonzero(uniform_time == curr_time)[0][0]
                else:
                    continue
                U_uniform[:,tind_uni] = ds_gappy['U'].sel(time=curr_time).values

            ds_uniform['U'] = (('y', 'time'), U_uniform)

            ds_out = ds_uniform

        return ds_out