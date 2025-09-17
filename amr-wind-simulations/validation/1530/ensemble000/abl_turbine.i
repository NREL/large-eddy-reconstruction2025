#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#            SIMULATION CONTROL         #
#.......................................#
time.stop_time                           = 701.0             # Max (simulated) time to evolve [s]
time.max_step                            = -1          # Max number of time steps
time.fixed_dt                            = 0.03125        # Use this constant dt if > 0
time.cfl                                 = 0.95         # CFL factor

time.plot_interval                       = 1000       # Steps between plot files
time.checkpoint_interval                 = 5000       # Steps between checkpoint files

ABL.bndry_file                           = amrwind_inflow_bc.nc
ABL.bndry_io_mode                        = 1
ABL.bndry_planes                         = xlo
ABL.bndry_output_start_time              = 0.0
ABL.bndry_var_names                      = velocity temperature tke
ABL.bndry_output_format                  = netcdf

incflo.physics                           = ABL Actuator
incflo.use_godunov                       = 1
incflo.godunov_type                      = weno_z
turbulence.model                         = OneEqKsgsM84
TKE.source_terms                         = KsgsM84Src
#TKE.interpolation                        = PiecewiseConstant          
incflo.gravity                           = 0.  0. -9.81  # Gravitational force (3D)
incflo.density                           = 1.027          # Reference density
transport.viscosity                      = 1.0e-5
transport.laminar_prandtl                = 0.7
transport.turbulent_prandtl              = 0.3333

incflo.verbose                           =   0          # incflo_level

#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#            GEOMETRY & BCs             #
#.......................................#
geometry.prob_lo                         = 0.       0.     0.  # Lo corner coordinates
geometry.prob_hi                         = 1280 640 1280  # Hi corner coordinates
amr.n_cell                               = 128 64 128    # Grid cells at coarsest AMRlevel
geometry.is_periodic                     = 0   1   0   # Periodicity x y z (0/1)
incflo.delp                              = 0.  0.  0.  # Prescribed (cyclic) pressure gradient
#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#        Mesh refinement                #
#.......................................#
amr.max_level           = 3           # Max AMR level in hierarchy
tagging.labels = static
tagging.static.type = CartBoxRefinement
tagging.static.static_refinement_def = static_box.txt

xlo.type                                 = mass_inflow         
xlo.density                              = 1.027               
xlo.temperature                          = 319.9434000008724   
xlo.tke                                  = 0.0
xhi.type                                 = pressure_outflow    

zlo.type                                 = wall_model
zhi.type                                 = slip_wall
zhi.temperature_type                     = fixed_gradient
zhi.temperature                          = 0.003

#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#               PHYSICS                 #
#.......................................#
ICNS.source_terms                        = BoussinesqBuoyancy CoriolisForcing ABLForcing
incflo.velocity                          = 9.03 0.0 0.0
ABLForcing.abl_forcing_height            = 120.0
CoriolisForcing.latitude                 = 33.5779
CoriolisForcing.north_vector             = 0.0 1.0 0.0
CoriolisForcing.east_vector              = 1.0 0.0 0.0
BoussinesqBuoyancy.reference_temperature = 319.9434000008724
ABL.reference_temperature                = 319.9434000008724
ABL.temperature_heights                  = 0.0   900.0 1000.0 2000.0
ABL.temperature_values                   = 319.9434000008724 318.75449669879083 319.77403031138897 324.6216250630419  # obtained from ABL stats
ABL.perturb_temperature                  = true
ABL.cutoff_height                        = 50.0
ABL.perturb_velocity                     = false
ABL.perturb_ref_height                   = 200.0
ABL.Uperiods                             = 4.0
ABL.Vperiods                             = 4.0
ABL.deltaU                               = 2.0
ABL.deltaV                               = 3.0
ABL.kappa                                = .41
ABL.surface_roughness_z0                 = 0.100
ABL.surface_temp_flux                    = 0.184
ABL.initial_condition_input_file         = "ic.nc"

#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#                  ALM                  #
#.......................................#
# We omit the ALM specifics in the public code out of an abundance of caution
Actuator.WTG01.base_position = 360. 320. 0.
ICNS.source_terms = ActuatorForcing

#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#          POST-Processing              #
#.......................................#
incflo.post_processing                   = spinnersample

# ------------- spinner lidar sampling -------------
spinnersample.labels                          = spinner  
spinnersample.spinner.type                     = DTUSpinnerSampler
spinnersample.output_frequency                     = 1
spinnersample.fields                          = velocity
spinnersample.spinner.mode                       = hub #or fixed
spinnersample.spinner.turbine                   = WTG01
spinnersample.spinner.hub_debug                  = false
spinnersample.spinner.inner_prism_theta0       = 90
spinnersample.spinner.inner_prism_rotrate        = 3.5
spinnersample.spinner.inner_prism_azimuth      = 15.2
spinnersample.spinner.outer_prism_theta0      = 90
spinnersample.spinner.outer_prism_rotrate      = 6.5
spinnersample.spinner.outer_prism_azimuth       = 15.2
spinnersample.spinner.lidar_center              = 2556.13 2560.0 120.0 #this gets ovewritten for "hub"
spinnersample.spinner.scan_time                  = 2
spinnersample.spinner.num_samples              = 984
spinnersample.spinner.beam_length              = 310.0
spinnersample.spinner.beam_points              = 248
spinnersample.spinner.fixed_yaw                  = 0
spinnersample.spinner.fixed_roll              = 0
spinnersample.spinner.fixed_tilt              = 0    