#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#            SIMULATION CONTROL         #
#.......................................#
time.stop_time                           = 10801.0             # Max (simulated) time to evolve [s]
time.max_step                            = -1          # Max number of time steps
time.fixed_dt                            = 0.25        # Use this constant dt if > 0
time.cfl                                 = 0.95         # CFL factor

time.plot_interval                       = 7200       # Steps between plot files
time.checkpoint_interval                 = 7200       # Steps between checkpoint files
#ABL.bndry_file                           = bndry_file.native
#ABL.bndry_io_mode                        = 0
#ABL.bndry_planes                         = ylo xlo
#ABL.bndry_output_start_time              = 8999.0
#ABL.bndry_var_names                      = velocity temperature tke

incflo.physics                           = ABL # Actuator
#io.restart_file                          = ../neutral_oneturb_precursor/chk09000   
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
geometry.prob_hi                         = 15360.  15360.  1280.  # Hi corner coordinates
amr.n_cell                               = 1536 1536 128    # Grid cells at coarsest AMRlevel
amr.max_level                            = 0           # Max AMR level in hierarchy 
geometry.is_periodic                     = 1   1   0   # Periodicity x y z (0/1)
incflo.delp                              = 0.  0.  0.  # Prescribed (cyclic) pressure gradient

#xlo.type                                 = mass_inflow         
#xlo.density                              = 1.027               
#xlo.temperature                          = 312.0               
#xlo.tke                                  = 0.0
#xhi.type                                 = pressure_outflow    

#ylo.type                                 = mass_inflow         
#ylo.density                              = 1.027               
#ylo.temperature                          = 312.0               
#ylo.tke                                  = 0.0
#yhi.type                                 = pressure_outflow     

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
BoussinesqBuoyancy.reference_temperature = 315.8
ABL.reference_temperature                = 315.8
ABL.temperature_heights                  = 0.0   900.0 1000.0 2000.0
ABL.temperature_values                   = 315.8 315.8 323.8  326.8
#ABL.temperature_heights                  = 0.0   50.0  100.0 150.0 200.0 250.0 350.0 400.0 450.0 500.0 600.0 700.0 1700.0
#ABL.temperature_values                   = 302.0 305.6 308.1 310.0 311.4 312.5 313.9 314.2 314.4 314.5 314.8 322.8 325.8
ABL.perturb_temperature                  = true
ABL.cutoff_height                        = 50.0
ABL.perturb_velocity                     = true
ABL.perturb_ref_height                   = 200.0
ABL.Uperiods                             = 4.0
ABL.Vperiods                             = 4.0
ABL.deltaU                               = 2.0
ABL.deltaV                               = 3.0
ABL.kappa                                = .41
ABL.surface_roughness_z0                 = 0.100
ABL.surface_temp_flux                    = 0.184
#ABL.surface_temp_rate                    = -0.321

#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#          POST-Processing              #
#.......................................#
# io.output_hdf5_plotfile                  = true
# io.hdf5_compression                      = "ZFP_ACCURACY@0.001"

#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#              AVERAGING                #
#.......................................#


#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#            MESH REFINEMENT            #
#.......................................#


#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#               TURBINES                #
#.......................................#
