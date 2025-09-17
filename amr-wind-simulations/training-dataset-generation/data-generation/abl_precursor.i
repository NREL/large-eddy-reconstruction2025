#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#            SIMULATION CONTROL         #
#.......................................#
time.stop_time                           = 14401.0             # Max (simulated) time to evolve [s]
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
io.restart_file                          = ../spinup/chk43200   
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

incflo.post_processing                   = sampling0000 sampling0001 sampling0002 sampling0003 sampling0004 sampling0005 sampling0006 sampling0007 sampling0008 sampling0009 sampling0010 sampling0011 sampling0012 sampling0013 sampling0014 sampling0015 sampling0016 sampling0017 sampling0018 sampling0019 sampling0020 sampling0021 sampling0022 sampling0023 sampling0024 sampling0025 sampling0026 sampling0027 sampling0028 sampling0029 sampling0030 sampling0031 sampling0032 sampling0033 sampling0034 sampling0035 sampling0036 sampling0037 sampling0038 sampling0039 sampling0040 sampling0041 sampling0042 sampling0043 sampling0044 sampling0045 sampling0046 sampling0047 sampling0048 sampling0049 sampling0050 sampling0051 sampling0052 sampling0053 sampling0054 sampling0055 sampling0056 sampling0057 sampling0058 sampling0059 sampling0060 sampling0061 sampling0062 sampling0063 sampling0064 sampling0065 sampling0066 sampling0067 sampling0068 sampling0069 sampling0070 sampling0071 sampling0072 sampling0073 sampling0074 sampling0075 sampling0076 sampling0077 sampling0078 sampling0079 sampling0080 sampling0081 sampling0082 sampling0083 sampling0084 sampling0085 sampling0086 sampling0087 sampling0088 sampling0089 sampling0090 sampling0091 sampling0092 sampling0093 sampling0094 sampling0095 sampling0096 sampling0097 sampling0098 sampling0099 sampling0100 sampling0101 sampling0102 sampling0103 sampling0104 sampling0105 sampling0106 sampling0107 sampling0108 sampling0109 sampling0110 sampling0111 sampling0112 sampling0113 sampling0114 sampling0115 sampling0116 sampling0117 sampling0118 sampling0119 sampling0120 sampling0121 sampling0122 sampling0123 sampling0124 sampling0125 sampling0126 sampling0127 sampling0128 sampling0129 sampling0130 sampling0131 sampling0132 sampling0133 sampling0134 sampling0135 sampling0136 sampling0137 sampling0138 sampling0139 sampling0140 sampling0141 sampling0142 sampling0143 sampling0144 sampling0145 sampling0146 sampling0147 sampling0148 sampling0149 sampling0150 sampling0151 sampling0152 sampling0153 sampling0154 sampling0155 sampling0156 sampling0157 sampling0158 sampling0159 sampling0160 sampling0161 sampling0162 sampling0163 sampling0164 sampling0165 sampling0166 sampling0167 sampling0168 sampling0169 sampling0170 sampling0171 sampling0172 sampling0173 sampling0174 sampling0175 sampling0176 sampling0177 sampling0178 sampling0179 sampling0180 sampling0181 sampling0182 sampling0183 sampling0184 sampling0185 sampling0186 sampling0187 sampling0188 sampling0189 sampling0190 sampling0191 sampling0192 sampling0193 sampling0194 sampling0195 sampling0196 sampling0197 sampling0198 sampling0199 sampling0200 sampling0201 sampling0202 sampling0203 sampling0204 sampling0205 sampling0206 sampling0207 sampling0208 sampling0209 sampling0210 sampling0211 sampling0212 sampling0213 sampling0214 sampling0215 sampling0216 sampling0217 sampling0218 sampling0219 sampling0220 sampling0221 sampling0222 sampling0223 sampling0224 sampling0225 sampling0226 sampling0227 sampling0228 sampling0229 sampling0230 sampling0231 sampling0232 sampling0233 sampling0234 sampling0235 sampling0236 sampling0237 sampling0238 sampling0239 sampling0240 sampling0241 sampling0242 sampling0243 sampling0244 sampling0245 sampling0246 sampling0247 sampling0248 sampling0249 sampling0250 sampling0251 sampling0252 sampling0253 sampling0254 sampling0255 sampling0256 sampling0257 sampling0258 sampling0259 sampling0260 sampling0261 sampling0262 sampling0263 sampling0264 sampling0265 sampling0266 sampling0267 sampling0268 sampling0269 sampling0270 sampling0271 sampling0272 sampling0273 sampling0274 sampling0275 sampling0276 sampling0277 sampling0278 sampling0279 sampling0280 sampling0281 sampling0282 sampling0283 sampling0284 sampling0285 sampling0286 sampling0287 sampling0288 sampling0289 sampling0290 sampling0291 sampling0292 sampling0293 sampling0294 sampling0295 sampling0296 sampling0297 sampling0298 sampling0299 sampling0300 sampling0301 sampling0302 sampling0303 sampling0304 sampling0305 sampling0306 sampling0307 sampling0308 sampling0309 sampling0310 sampling0311 sampling0312 sampling0313 sampling0314 sampling0315 sampling0316 sampling0317 sampling0318 sampling0319 sampling0320 sampling0321 sampling0322 sampling0323 sampling0324 sampling0325 sampling0326 sampling0327 sampling0328 sampling0329 sampling0330 sampling0331 sampling0332 sampling0333 sampling0334 sampling0335 sampling0336 sampling0337 sampling0338 sampling0339 sampling0340 sampling0341 sampling0342 sampling0343 sampling0344

# ------------- Sampling parameters for one imaginary turbine at (1120.0 m, 340.0 m, 0.0 m) -------------
sampling0000.output_frequency                = 1
sampling0000.fields                          = velocity temperature tke
sampling0000.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0000.inflow-bc-3D.type               = PlaneSampler
sampling0000.inflow-bc-3D.num_points         = 64 64
sampling0000.inflow-bc-3D.origin             = 740.0 20.0 0.0
sampling0000.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0000.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0000.inflow-scan.type                = LidarSampler
sampling0000.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0000.inflow-scan.length              = 996.0
sampling0000.inflow-scan.origin              = 1120.0 340.0 120.0  # Lidar situated 3.0 m above hub height
sampling0000.inflow-scan.periodic            = true
sampling0000.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0000.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0000.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (1120.0 m, 980.0 m, 0.0 m) -------------
sampling0001.output_frequency                = 1
sampling0001.fields                          = velocity temperature tke
sampling0001.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0001.inflow-bc-3D.type               = PlaneSampler
sampling0001.inflow-bc-3D.num_points         = 64 64
sampling0001.inflow-bc-3D.origin             = 740.0 660.0 0.0
sampling0001.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0001.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0001.inflow-scan.type                = LidarSampler
sampling0001.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0001.inflow-scan.length              = 996.0
sampling0001.inflow-scan.origin              = 1120.0 980.0 120.0  # Lidar situated 3.0 m above hub height
sampling0001.inflow-scan.periodic            = true
sampling0001.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0001.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0001.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (1120.0 m, 1620.0 m, 0.0 m) -------------
sampling0002.output_frequency                = 1
sampling0002.fields                          = velocity temperature tke
sampling0002.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0002.inflow-bc-3D.type               = PlaneSampler
sampling0002.inflow-bc-3D.num_points         = 64 64
sampling0002.inflow-bc-3D.origin             = 740.0 1300.0 0.0
sampling0002.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0002.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0002.inflow-scan.type                = LidarSampler
sampling0002.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0002.inflow-scan.length              = 996.0
sampling0002.inflow-scan.origin              = 1120.0 1620.0 120.0  # Lidar situated 3.0 m above hub height
sampling0002.inflow-scan.periodic            = true
sampling0002.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0002.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0002.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (1120.0 m, 2260.0 m, 0.0 m) -------------
sampling0003.output_frequency                = 1
sampling0003.fields                          = velocity temperature tke
sampling0003.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0003.inflow-bc-3D.type               = PlaneSampler
sampling0003.inflow-bc-3D.num_points         = 64 64
sampling0003.inflow-bc-3D.origin             = 740.0 1940.0 0.0
sampling0003.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0003.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0003.inflow-scan.type                = LidarSampler
sampling0003.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0003.inflow-scan.length              = 996.0
sampling0003.inflow-scan.origin              = 1120.0 2260.0 120.0  # Lidar situated 3.0 m above hub height
sampling0003.inflow-scan.periodic            = true
sampling0003.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0003.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0003.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (1120.0 m, 2900.0 m, 0.0 m) -------------
sampling0004.output_frequency                = 1
sampling0004.fields                          = velocity temperature tke
sampling0004.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0004.inflow-bc-3D.type               = PlaneSampler
sampling0004.inflow-bc-3D.num_points         = 64 64
sampling0004.inflow-bc-3D.origin             = 740.0 2580.0 0.0
sampling0004.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0004.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0004.inflow-scan.type                = LidarSampler
sampling0004.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0004.inflow-scan.length              = 996.0
sampling0004.inflow-scan.origin              = 1120.0 2900.0 120.0  # Lidar situated 3.0 m above hub height
sampling0004.inflow-scan.periodic            = true
sampling0004.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0004.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0004.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (1120.0 m, 3540.0 m, 0.0 m) -------------
sampling0005.output_frequency                = 1
sampling0005.fields                          = velocity temperature tke
sampling0005.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0005.inflow-bc-3D.type               = PlaneSampler
sampling0005.inflow-bc-3D.num_points         = 64 64
sampling0005.inflow-bc-3D.origin             = 740.0 3220.0 0.0
sampling0005.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0005.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0005.inflow-scan.type                = LidarSampler
sampling0005.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0005.inflow-scan.length              = 996.0
sampling0005.inflow-scan.origin              = 1120.0 3540.0 120.0  # Lidar situated 3.0 m above hub height
sampling0005.inflow-scan.periodic            = true
sampling0005.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0005.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0005.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (1120.0 m, 4180.0 m, 0.0 m) -------------
sampling0006.output_frequency                = 1
sampling0006.fields                          = velocity temperature tke
sampling0006.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0006.inflow-bc-3D.type               = PlaneSampler
sampling0006.inflow-bc-3D.num_points         = 64 64
sampling0006.inflow-bc-3D.origin             = 740.0 3860.0 0.0
sampling0006.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0006.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0006.inflow-scan.type                = LidarSampler
sampling0006.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0006.inflow-scan.length              = 996.0
sampling0006.inflow-scan.origin              = 1120.0 4180.0 120.0  # Lidar situated 3.0 m above hub height
sampling0006.inflow-scan.periodic            = true
sampling0006.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0006.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0006.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (1120.0 m, 4820.0 m, 0.0 m) -------------
sampling0007.output_frequency                = 1
sampling0007.fields                          = velocity temperature tke
sampling0007.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0007.inflow-bc-3D.type               = PlaneSampler
sampling0007.inflow-bc-3D.num_points         = 64 64
sampling0007.inflow-bc-3D.origin             = 740.0 4500.0 0.0
sampling0007.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0007.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0007.inflow-scan.type                = LidarSampler
sampling0007.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0007.inflow-scan.length              = 996.0
sampling0007.inflow-scan.origin              = 1120.0 4820.0 120.0  # Lidar situated 3.0 m above hub height
sampling0007.inflow-scan.periodic            = true
sampling0007.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0007.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0007.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (1120.0 m, 5460.0 m, 0.0 m) -------------
sampling0008.output_frequency                = 1
sampling0008.fields                          = velocity temperature tke
sampling0008.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0008.inflow-bc-3D.type               = PlaneSampler
sampling0008.inflow-bc-3D.num_points         = 64 64
sampling0008.inflow-bc-3D.origin             = 740.0 5140.0 0.0
sampling0008.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0008.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0008.inflow-scan.type                = LidarSampler
sampling0008.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0008.inflow-scan.length              = 996.0
sampling0008.inflow-scan.origin              = 1120.0 5460.0 120.0  # Lidar situated 3.0 m above hub height
sampling0008.inflow-scan.periodic            = true
sampling0008.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0008.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0008.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (1120.0 m, 6100.0 m, 0.0 m) -------------
sampling0009.output_frequency                = 1
sampling0009.fields                          = velocity temperature tke
sampling0009.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0009.inflow-bc-3D.type               = PlaneSampler
sampling0009.inflow-bc-3D.num_points         = 64 64
sampling0009.inflow-bc-3D.origin             = 740.0 5780.0 0.0
sampling0009.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0009.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0009.inflow-scan.type                = LidarSampler
sampling0009.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0009.inflow-scan.length              = 996.0
sampling0009.inflow-scan.origin              = 1120.0 6100.0 120.0  # Lidar situated 3.0 m above hub height
sampling0009.inflow-scan.periodic            = true
sampling0009.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0009.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0009.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (1120.0 m, 6740.0 m, 0.0 m) -------------
sampling0010.output_frequency                = 1
sampling0010.fields                          = velocity temperature tke
sampling0010.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0010.inflow-bc-3D.type               = PlaneSampler
sampling0010.inflow-bc-3D.num_points         = 64 64
sampling0010.inflow-bc-3D.origin             = 740.0 6420.0 0.0
sampling0010.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0010.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0010.inflow-scan.type                = LidarSampler
sampling0010.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0010.inflow-scan.length              = 996.0
sampling0010.inflow-scan.origin              = 1120.0 6740.0 120.0  # Lidar situated 3.0 m above hub height
sampling0010.inflow-scan.periodic            = true
sampling0010.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0010.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0010.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (1120.0 m, 7380.0 m, 0.0 m) -------------
sampling0011.output_frequency                = 1
sampling0011.fields                          = velocity temperature tke
sampling0011.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0011.inflow-bc-3D.type               = PlaneSampler
sampling0011.inflow-bc-3D.num_points         = 64 64
sampling0011.inflow-bc-3D.origin             = 740.0 7060.0 0.0
sampling0011.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0011.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0011.inflow-scan.type                = LidarSampler
sampling0011.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0011.inflow-scan.length              = 996.0
sampling0011.inflow-scan.origin              = 1120.0 7380.0 120.0  # Lidar situated 3.0 m above hub height
sampling0011.inflow-scan.periodic            = true
sampling0011.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0011.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0011.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (1120.0 m, 8020.0 m, 0.0 m) -------------
sampling0012.output_frequency                = 1
sampling0012.fields                          = velocity temperature tke
sampling0012.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0012.inflow-bc-3D.type               = PlaneSampler
sampling0012.inflow-bc-3D.num_points         = 64 64
sampling0012.inflow-bc-3D.origin             = 740.0 7700.0 0.0
sampling0012.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0012.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0012.inflow-scan.type                = LidarSampler
sampling0012.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0012.inflow-scan.length              = 996.0
sampling0012.inflow-scan.origin              = 1120.0 8020.0 120.0  # Lidar situated 3.0 m above hub height
sampling0012.inflow-scan.periodic            = true
sampling0012.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0012.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0012.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (1120.0 m, 8660.0 m, 0.0 m) -------------
sampling0013.output_frequency                = 1
sampling0013.fields                          = velocity temperature tke
sampling0013.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0013.inflow-bc-3D.type               = PlaneSampler
sampling0013.inflow-bc-3D.num_points         = 64 64
sampling0013.inflow-bc-3D.origin             = 740.0 8340.0 0.0
sampling0013.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0013.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0013.inflow-scan.type                = LidarSampler
sampling0013.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0013.inflow-scan.length              = 996.0
sampling0013.inflow-scan.origin              = 1120.0 8660.0 120.0  # Lidar situated 3.0 m above hub height
sampling0013.inflow-scan.periodic            = true
sampling0013.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0013.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0013.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (1120.0 m, 9300.0 m, 0.0 m) -------------
sampling0014.output_frequency                = 1
sampling0014.fields                          = velocity temperature tke
sampling0014.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0014.inflow-bc-3D.type               = PlaneSampler
sampling0014.inflow-bc-3D.num_points         = 64 64
sampling0014.inflow-bc-3D.origin             = 740.0 8980.0 0.0
sampling0014.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0014.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0014.inflow-scan.type                = LidarSampler
sampling0014.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0014.inflow-scan.length              = 996.0
sampling0014.inflow-scan.origin              = 1120.0 9300.0 120.0  # Lidar situated 3.0 m above hub height
sampling0014.inflow-scan.periodic            = true
sampling0014.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0014.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0014.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (1120.0 m, 9940.0 m, 0.0 m) -------------
sampling0015.output_frequency                = 1
sampling0015.fields                          = velocity temperature tke
sampling0015.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0015.inflow-bc-3D.type               = PlaneSampler
sampling0015.inflow-bc-3D.num_points         = 64 64
sampling0015.inflow-bc-3D.origin             = 740.0 9620.0 0.0
sampling0015.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0015.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0015.inflow-scan.type                = LidarSampler
sampling0015.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0015.inflow-scan.length              = 996.0
sampling0015.inflow-scan.origin              = 1120.0 9940.0 120.0  # Lidar situated 3.0 m above hub height
sampling0015.inflow-scan.periodic            = true
sampling0015.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0015.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0015.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (1120.0 m, 10580.0 m, 0.0 m) -------------
sampling0016.output_frequency                = 1
sampling0016.fields                          = velocity temperature tke
sampling0016.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0016.inflow-bc-3D.type               = PlaneSampler
sampling0016.inflow-bc-3D.num_points         = 64 64
sampling0016.inflow-bc-3D.origin             = 740.0 10260.0 0.0
sampling0016.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0016.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0016.inflow-scan.type                = LidarSampler
sampling0016.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0016.inflow-scan.length              = 996.0
sampling0016.inflow-scan.origin              = 1120.0 10580.0 120.0  # Lidar situated 3.0 m above hub height
sampling0016.inflow-scan.periodic            = true
sampling0016.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0016.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0016.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (1120.0 m, 11220.0 m, 0.0 m) -------------
sampling0017.output_frequency                = 1
sampling0017.fields                          = velocity temperature tke
sampling0017.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0017.inflow-bc-3D.type               = PlaneSampler
sampling0017.inflow-bc-3D.num_points         = 64 64
sampling0017.inflow-bc-3D.origin             = 740.0 10900.0 0.0
sampling0017.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0017.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0017.inflow-scan.type                = LidarSampler
sampling0017.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0017.inflow-scan.length              = 996.0
sampling0017.inflow-scan.origin              = 1120.0 11220.0 120.0  # Lidar situated 3.0 m above hub height
sampling0017.inflow-scan.periodic            = true
sampling0017.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0017.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0017.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (1120.0 m, 11860.0 m, 0.0 m) -------------
sampling0018.output_frequency                = 1
sampling0018.fields                          = velocity temperature tke
sampling0018.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0018.inflow-bc-3D.type               = PlaneSampler
sampling0018.inflow-bc-3D.num_points         = 64 64
sampling0018.inflow-bc-3D.origin             = 740.0 11540.0 0.0
sampling0018.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0018.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0018.inflow-scan.type                = LidarSampler
sampling0018.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0018.inflow-scan.length              = 996.0
sampling0018.inflow-scan.origin              = 1120.0 11860.0 120.0  # Lidar situated 3.0 m above hub height
sampling0018.inflow-scan.periodic            = true
sampling0018.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0018.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0018.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (1120.0 m, 12500.0 m, 0.0 m) -------------
sampling0019.output_frequency                = 1
sampling0019.fields                          = velocity temperature tke
sampling0019.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0019.inflow-bc-3D.type               = PlaneSampler
sampling0019.inflow-bc-3D.num_points         = 64 64
sampling0019.inflow-bc-3D.origin             = 740.0 12180.0 0.0
sampling0019.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0019.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0019.inflow-scan.type                = LidarSampler
sampling0019.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0019.inflow-scan.length              = 996.0
sampling0019.inflow-scan.origin              = 1120.0 12500.0 120.0  # Lidar situated 3.0 m above hub height
sampling0019.inflow-scan.periodic            = true
sampling0019.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0019.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0019.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (1120.0 m, 13140.0 m, 0.0 m) -------------
sampling0020.output_frequency                = 1
sampling0020.fields                          = velocity temperature tke
sampling0020.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0020.inflow-bc-3D.type               = PlaneSampler
sampling0020.inflow-bc-3D.num_points         = 64 64
sampling0020.inflow-bc-3D.origin             = 740.0 12820.0 0.0
sampling0020.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0020.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0020.inflow-scan.type                = LidarSampler
sampling0020.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0020.inflow-scan.length              = 996.0
sampling0020.inflow-scan.origin              = 1120.0 13140.0 120.0  # Lidar situated 3.0 m above hub height
sampling0020.inflow-scan.periodic            = true
sampling0020.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0020.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0020.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (1120.0 m, 13780.0 m, 0.0 m) -------------
sampling0021.output_frequency                = 1
sampling0021.fields                          = velocity temperature tke
sampling0021.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0021.inflow-bc-3D.type               = PlaneSampler
sampling0021.inflow-bc-3D.num_points         = 64 64
sampling0021.inflow-bc-3D.origin             = 740.0 13460.0 0.0
sampling0021.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0021.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0021.inflow-scan.type                = LidarSampler
sampling0021.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0021.inflow-scan.length              = 996.0
sampling0021.inflow-scan.origin              = 1120.0 13780.0 120.0  # Lidar situated 3.0 m above hub height
sampling0021.inflow-scan.periodic            = true
sampling0021.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0021.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0021.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (1120.0 m, 14420.0 m, 0.0 m) -------------
sampling0022.output_frequency                = 1
sampling0022.fields                          = velocity temperature tke
sampling0022.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0022.inflow-bc-3D.type               = PlaneSampler
sampling0022.inflow-bc-3D.num_points         = 64 64
sampling0022.inflow-bc-3D.origin             = 740.0 14100.0 0.0
sampling0022.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0022.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0022.inflow-scan.type                = LidarSampler
sampling0022.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0022.inflow-scan.length              = 996.0
sampling0022.inflow-scan.origin              = 1120.0 14420.0 120.0  # Lidar situated 3.0 m above hub height
sampling0022.inflow-scan.periodic            = true
sampling0022.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0022.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0022.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (2120.0 m, 500.0 m, 0.0 m) -------------
sampling0023.output_frequency                = 1
sampling0023.fields                          = velocity temperature tke
sampling0023.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0023.inflow-bc-3D.type               = PlaneSampler
sampling0023.inflow-bc-3D.num_points         = 64 64
sampling0023.inflow-bc-3D.origin             = 1740.0 180.0 0.0
sampling0023.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0023.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0023.inflow-scan.type                = LidarSampler
sampling0023.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0023.inflow-scan.length              = 996.0
sampling0023.inflow-scan.origin              = 2120.0 500.0 120.0  # Lidar situated 3.0 m above hub height
sampling0023.inflow-scan.periodic            = true
sampling0023.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0023.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0023.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (2120.0 m, 1140.0 m, 0.0 m) -------------
sampling0024.output_frequency                = 1
sampling0024.fields                          = velocity temperature tke
sampling0024.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0024.inflow-bc-3D.type               = PlaneSampler
sampling0024.inflow-bc-3D.num_points         = 64 64
sampling0024.inflow-bc-3D.origin             = 1740.0 820.0 0.0
sampling0024.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0024.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0024.inflow-scan.type                = LidarSampler
sampling0024.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0024.inflow-scan.length              = 996.0
sampling0024.inflow-scan.origin              = 2120.0 1140.0 120.0  # Lidar situated 3.0 m above hub height
sampling0024.inflow-scan.periodic            = true
sampling0024.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0024.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0024.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (2120.0 m, 1780.0 m, 0.0 m) -------------
sampling0025.output_frequency                = 1
sampling0025.fields                          = velocity temperature tke
sampling0025.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0025.inflow-bc-3D.type               = PlaneSampler
sampling0025.inflow-bc-3D.num_points         = 64 64
sampling0025.inflow-bc-3D.origin             = 1740.0 1460.0 0.0
sampling0025.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0025.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0025.inflow-scan.type                = LidarSampler
sampling0025.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0025.inflow-scan.length              = 996.0
sampling0025.inflow-scan.origin              = 2120.0 1780.0 120.0  # Lidar situated 3.0 m above hub height
sampling0025.inflow-scan.periodic            = true
sampling0025.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0025.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0025.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (2120.0 m, 2420.0 m, 0.0 m) -------------
sampling0026.output_frequency                = 1
sampling0026.fields                          = velocity temperature tke
sampling0026.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0026.inflow-bc-3D.type               = PlaneSampler
sampling0026.inflow-bc-3D.num_points         = 64 64
sampling0026.inflow-bc-3D.origin             = 1740.0 2100.0 0.0
sampling0026.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0026.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0026.inflow-scan.type                = LidarSampler
sampling0026.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0026.inflow-scan.length              = 996.0
sampling0026.inflow-scan.origin              = 2120.0 2420.0 120.0  # Lidar situated 3.0 m above hub height
sampling0026.inflow-scan.periodic            = true
sampling0026.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0026.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0026.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (2120.0 m, 3060.0 m, 0.0 m) -------------
sampling0027.output_frequency                = 1
sampling0027.fields                          = velocity temperature tke
sampling0027.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0027.inflow-bc-3D.type               = PlaneSampler
sampling0027.inflow-bc-3D.num_points         = 64 64
sampling0027.inflow-bc-3D.origin             = 1740.0 2740.0 0.0
sampling0027.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0027.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0027.inflow-scan.type                = LidarSampler
sampling0027.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0027.inflow-scan.length              = 996.0
sampling0027.inflow-scan.origin              = 2120.0 3060.0 120.0  # Lidar situated 3.0 m above hub height
sampling0027.inflow-scan.periodic            = true
sampling0027.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0027.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0027.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (2120.0 m, 3700.0 m, 0.0 m) -------------
sampling0028.output_frequency                = 1
sampling0028.fields                          = velocity temperature tke
sampling0028.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0028.inflow-bc-3D.type               = PlaneSampler
sampling0028.inflow-bc-3D.num_points         = 64 64
sampling0028.inflow-bc-3D.origin             = 1740.0 3380.0 0.0
sampling0028.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0028.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0028.inflow-scan.type                = LidarSampler
sampling0028.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0028.inflow-scan.length              = 996.0
sampling0028.inflow-scan.origin              = 2120.0 3700.0 120.0  # Lidar situated 3.0 m above hub height
sampling0028.inflow-scan.periodic            = true
sampling0028.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0028.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0028.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (2120.0 m, 4340.0 m, 0.0 m) -------------
sampling0029.output_frequency                = 1
sampling0029.fields                          = velocity temperature tke
sampling0029.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0029.inflow-bc-3D.type               = PlaneSampler
sampling0029.inflow-bc-3D.num_points         = 64 64
sampling0029.inflow-bc-3D.origin             = 1740.0 4020.0 0.0
sampling0029.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0029.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0029.inflow-scan.type                = LidarSampler
sampling0029.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0029.inflow-scan.length              = 996.0
sampling0029.inflow-scan.origin              = 2120.0 4340.0 120.0  # Lidar situated 3.0 m above hub height
sampling0029.inflow-scan.periodic            = true
sampling0029.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0029.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0029.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (2120.0 m, 4980.0 m, 0.0 m) -------------
sampling0030.output_frequency                = 1
sampling0030.fields                          = velocity temperature tke
sampling0030.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0030.inflow-bc-3D.type               = PlaneSampler
sampling0030.inflow-bc-3D.num_points         = 64 64
sampling0030.inflow-bc-3D.origin             = 1740.0 4660.0 0.0
sampling0030.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0030.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0030.inflow-scan.type                = LidarSampler
sampling0030.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0030.inflow-scan.length              = 996.0
sampling0030.inflow-scan.origin              = 2120.0 4980.0 120.0  # Lidar situated 3.0 m above hub height
sampling0030.inflow-scan.periodic            = true
sampling0030.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0030.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0030.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (2120.0 m, 5620.0 m, 0.0 m) -------------
sampling0031.output_frequency                = 1
sampling0031.fields                          = velocity temperature tke
sampling0031.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0031.inflow-bc-3D.type               = PlaneSampler
sampling0031.inflow-bc-3D.num_points         = 64 64
sampling0031.inflow-bc-3D.origin             = 1740.0 5300.0 0.0
sampling0031.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0031.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0031.inflow-scan.type                = LidarSampler
sampling0031.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0031.inflow-scan.length              = 996.0
sampling0031.inflow-scan.origin              = 2120.0 5620.0 120.0  # Lidar situated 3.0 m above hub height
sampling0031.inflow-scan.periodic            = true
sampling0031.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0031.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0031.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (2120.0 m, 6260.0 m, 0.0 m) -------------
sampling0032.output_frequency                = 1
sampling0032.fields                          = velocity temperature tke
sampling0032.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0032.inflow-bc-3D.type               = PlaneSampler
sampling0032.inflow-bc-3D.num_points         = 64 64
sampling0032.inflow-bc-3D.origin             = 1740.0 5940.0 0.0
sampling0032.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0032.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0032.inflow-scan.type                = LidarSampler
sampling0032.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0032.inflow-scan.length              = 996.0
sampling0032.inflow-scan.origin              = 2120.0 6260.0 120.0  # Lidar situated 3.0 m above hub height
sampling0032.inflow-scan.periodic            = true
sampling0032.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0032.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0032.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (2120.0 m, 6900.0 m, 0.0 m) -------------
sampling0033.output_frequency                = 1
sampling0033.fields                          = velocity temperature tke
sampling0033.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0033.inflow-bc-3D.type               = PlaneSampler
sampling0033.inflow-bc-3D.num_points         = 64 64
sampling0033.inflow-bc-3D.origin             = 1740.0 6580.0 0.0
sampling0033.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0033.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0033.inflow-scan.type                = LidarSampler
sampling0033.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0033.inflow-scan.length              = 996.0
sampling0033.inflow-scan.origin              = 2120.0 6900.0 120.0  # Lidar situated 3.0 m above hub height
sampling0033.inflow-scan.periodic            = true
sampling0033.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0033.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0033.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (2120.0 m, 7540.0 m, 0.0 m) -------------
sampling0034.output_frequency                = 1
sampling0034.fields                          = velocity temperature tke
sampling0034.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0034.inflow-bc-3D.type               = PlaneSampler
sampling0034.inflow-bc-3D.num_points         = 64 64
sampling0034.inflow-bc-3D.origin             = 1740.0 7220.0 0.0
sampling0034.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0034.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0034.inflow-scan.type                = LidarSampler
sampling0034.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0034.inflow-scan.length              = 996.0
sampling0034.inflow-scan.origin              = 2120.0 7540.0 120.0  # Lidar situated 3.0 m above hub height
sampling0034.inflow-scan.periodic            = true
sampling0034.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0034.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0034.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (2120.0 m, 8180.0 m, 0.0 m) -------------
sampling0035.output_frequency                = 1
sampling0035.fields                          = velocity temperature tke
sampling0035.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0035.inflow-bc-3D.type               = PlaneSampler
sampling0035.inflow-bc-3D.num_points         = 64 64
sampling0035.inflow-bc-3D.origin             = 1740.0 7860.0 0.0
sampling0035.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0035.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0035.inflow-scan.type                = LidarSampler
sampling0035.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0035.inflow-scan.length              = 996.0
sampling0035.inflow-scan.origin              = 2120.0 8180.0 120.0  # Lidar situated 3.0 m above hub height
sampling0035.inflow-scan.periodic            = true
sampling0035.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0035.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0035.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (2120.0 m, 8820.0 m, 0.0 m) -------------
sampling0036.output_frequency                = 1
sampling0036.fields                          = velocity temperature tke
sampling0036.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0036.inflow-bc-3D.type               = PlaneSampler
sampling0036.inflow-bc-3D.num_points         = 64 64
sampling0036.inflow-bc-3D.origin             = 1740.0 8500.0 0.0
sampling0036.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0036.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0036.inflow-scan.type                = LidarSampler
sampling0036.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0036.inflow-scan.length              = 996.0
sampling0036.inflow-scan.origin              = 2120.0 8820.0 120.0  # Lidar situated 3.0 m above hub height
sampling0036.inflow-scan.periodic            = true
sampling0036.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0036.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0036.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (2120.0 m, 9460.0 m, 0.0 m) -------------
sampling0037.output_frequency                = 1
sampling0037.fields                          = velocity temperature tke
sampling0037.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0037.inflow-bc-3D.type               = PlaneSampler
sampling0037.inflow-bc-3D.num_points         = 64 64
sampling0037.inflow-bc-3D.origin             = 1740.0 9140.0 0.0
sampling0037.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0037.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0037.inflow-scan.type                = LidarSampler
sampling0037.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0037.inflow-scan.length              = 996.0
sampling0037.inflow-scan.origin              = 2120.0 9460.0 120.0  # Lidar situated 3.0 m above hub height
sampling0037.inflow-scan.periodic            = true
sampling0037.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0037.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0037.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (2120.0 m, 10100.0 m, 0.0 m) -------------
sampling0038.output_frequency                = 1
sampling0038.fields                          = velocity temperature tke
sampling0038.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0038.inflow-bc-3D.type               = PlaneSampler
sampling0038.inflow-bc-3D.num_points         = 64 64
sampling0038.inflow-bc-3D.origin             = 1740.0 9780.0 0.0
sampling0038.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0038.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0038.inflow-scan.type                = LidarSampler
sampling0038.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0038.inflow-scan.length              = 996.0
sampling0038.inflow-scan.origin              = 2120.0 10100.0 120.0  # Lidar situated 3.0 m above hub height
sampling0038.inflow-scan.periodic            = true
sampling0038.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0038.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0038.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (2120.0 m, 10740.0 m, 0.0 m) -------------
sampling0039.output_frequency                = 1
sampling0039.fields                          = velocity temperature tke
sampling0039.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0039.inflow-bc-3D.type               = PlaneSampler
sampling0039.inflow-bc-3D.num_points         = 64 64
sampling0039.inflow-bc-3D.origin             = 1740.0 10420.0 0.0
sampling0039.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0039.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0039.inflow-scan.type                = LidarSampler
sampling0039.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0039.inflow-scan.length              = 996.0
sampling0039.inflow-scan.origin              = 2120.0 10740.0 120.0  # Lidar situated 3.0 m above hub height
sampling0039.inflow-scan.periodic            = true
sampling0039.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0039.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0039.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (2120.0 m, 11380.0 m, 0.0 m) -------------
sampling0040.output_frequency                = 1
sampling0040.fields                          = velocity temperature tke
sampling0040.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0040.inflow-bc-3D.type               = PlaneSampler
sampling0040.inflow-bc-3D.num_points         = 64 64
sampling0040.inflow-bc-3D.origin             = 1740.0 11060.0 0.0
sampling0040.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0040.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0040.inflow-scan.type                = LidarSampler
sampling0040.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0040.inflow-scan.length              = 996.0
sampling0040.inflow-scan.origin              = 2120.0 11380.0 120.0  # Lidar situated 3.0 m above hub height
sampling0040.inflow-scan.periodic            = true
sampling0040.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0040.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0040.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (2120.0 m, 12020.0 m, 0.0 m) -------------
sampling0041.output_frequency                = 1
sampling0041.fields                          = velocity temperature tke
sampling0041.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0041.inflow-bc-3D.type               = PlaneSampler
sampling0041.inflow-bc-3D.num_points         = 64 64
sampling0041.inflow-bc-3D.origin             = 1740.0 11700.0 0.0
sampling0041.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0041.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0041.inflow-scan.type                = LidarSampler
sampling0041.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0041.inflow-scan.length              = 996.0
sampling0041.inflow-scan.origin              = 2120.0 12020.0 120.0  # Lidar situated 3.0 m above hub height
sampling0041.inflow-scan.periodic            = true
sampling0041.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0041.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0041.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (2120.0 m, 12660.0 m, 0.0 m) -------------
sampling0042.output_frequency                = 1
sampling0042.fields                          = velocity temperature tke
sampling0042.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0042.inflow-bc-3D.type               = PlaneSampler
sampling0042.inflow-bc-3D.num_points         = 64 64
sampling0042.inflow-bc-3D.origin             = 1740.0 12340.0 0.0
sampling0042.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0042.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0042.inflow-scan.type                = LidarSampler
sampling0042.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0042.inflow-scan.length              = 996.0
sampling0042.inflow-scan.origin              = 2120.0 12660.0 120.0  # Lidar situated 3.0 m above hub height
sampling0042.inflow-scan.periodic            = true
sampling0042.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0042.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0042.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (2120.0 m, 13300.0 m, 0.0 m) -------------
sampling0043.output_frequency                = 1
sampling0043.fields                          = velocity temperature tke
sampling0043.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0043.inflow-bc-3D.type               = PlaneSampler
sampling0043.inflow-bc-3D.num_points         = 64 64
sampling0043.inflow-bc-3D.origin             = 1740.0 12980.0 0.0
sampling0043.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0043.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0043.inflow-scan.type                = LidarSampler
sampling0043.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0043.inflow-scan.length              = 996.0
sampling0043.inflow-scan.origin              = 2120.0 13300.0 120.0  # Lidar situated 3.0 m above hub height
sampling0043.inflow-scan.periodic            = true
sampling0043.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0043.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0043.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (2120.0 m, 13940.0 m, 0.0 m) -------------
sampling0044.output_frequency                = 1
sampling0044.fields                          = velocity temperature tke
sampling0044.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0044.inflow-bc-3D.type               = PlaneSampler
sampling0044.inflow-bc-3D.num_points         = 64 64
sampling0044.inflow-bc-3D.origin             = 1740.0 13620.0 0.0
sampling0044.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0044.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0044.inflow-scan.type                = LidarSampler
sampling0044.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0044.inflow-scan.length              = 996.0
sampling0044.inflow-scan.origin              = 2120.0 13940.0 120.0  # Lidar situated 3.0 m above hub height
sampling0044.inflow-scan.periodic            = true
sampling0044.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0044.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0044.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (2120.0 m, 14580.0 m, 0.0 m) -------------
sampling0045.output_frequency                = 1
sampling0045.fields                          = velocity temperature tke
sampling0045.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0045.inflow-bc-3D.type               = PlaneSampler
sampling0045.inflow-bc-3D.num_points         = 64 64
sampling0045.inflow-bc-3D.origin             = 1740.0 14260.0 0.0
sampling0045.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0045.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0045.inflow-scan.type                = LidarSampler
sampling0045.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0045.inflow-scan.length              = 996.0
sampling0045.inflow-scan.origin              = 2120.0 14580.0 120.0  # Lidar situated 3.0 m above hub height
sampling0045.inflow-scan.periodic            = true
sampling0045.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0045.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0045.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (3120.0 m, 660.0 m, 0.0 m) -------------
sampling0046.output_frequency                = 1
sampling0046.fields                          = velocity temperature tke
sampling0046.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0046.inflow-bc-3D.type               = PlaneSampler
sampling0046.inflow-bc-3D.num_points         = 64 64
sampling0046.inflow-bc-3D.origin             = 2740.0 340.0 0.0
sampling0046.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0046.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0046.inflow-scan.type                = LidarSampler
sampling0046.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0046.inflow-scan.length              = 996.0
sampling0046.inflow-scan.origin              = 3120.0 660.0 120.0  # Lidar situated 3.0 m above hub height
sampling0046.inflow-scan.periodic            = true
sampling0046.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0046.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0046.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (3120.0 m, 1300.0 m, 0.0 m) -------------
sampling0047.output_frequency                = 1
sampling0047.fields                          = velocity temperature tke
sampling0047.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0047.inflow-bc-3D.type               = PlaneSampler
sampling0047.inflow-bc-3D.num_points         = 64 64
sampling0047.inflow-bc-3D.origin             = 2740.0 980.0 0.0
sampling0047.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0047.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0047.inflow-scan.type                = LidarSampler
sampling0047.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0047.inflow-scan.length              = 996.0
sampling0047.inflow-scan.origin              = 3120.0 1300.0 120.0  # Lidar situated 3.0 m above hub height
sampling0047.inflow-scan.periodic            = true
sampling0047.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0047.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0047.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (3120.0 m, 1940.0 m, 0.0 m) -------------
sampling0048.output_frequency                = 1
sampling0048.fields                          = velocity temperature tke
sampling0048.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0048.inflow-bc-3D.type               = PlaneSampler
sampling0048.inflow-bc-3D.num_points         = 64 64
sampling0048.inflow-bc-3D.origin             = 2740.0 1620.0 0.0
sampling0048.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0048.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0048.inflow-scan.type                = LidarSampler
sampling0048.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0048.inflow-scan.length              = 996.0
sampling0048.inflow-scan.origin              = 3120.0 1940.0 120.0  # Lidar situated 3.0 m above hub height
sampling0048.inflow-scan.periodic            = true
sampling0048.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0048.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0048.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (3120.0 m, 2580.0 m, 0.0 m) -------------
sampling0049.output_frequency                = 1
sampling0049.fields                          = velocity temperature tke
sampling0049.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0049.inflow-bc-3D.type               = PlaneSampler
sampling0049.inflow-bc-3D.num_points         = 64 64
sampling0049.inflow-bc-3D.origin             = 2740.0 2260.0 0.0
sampling0049.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0049.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0049.inflow-scan.type                = LidarSampler
sampling0049.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0049.inflow-scan.length              = 996.0
sampling0049.inflow-scan.origin              = 3120.0 2580.0 120.0  # Lidar situated 3.0 m above hub height
sampling0049.inflow-scan.periodic            = true
sampling0049.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0049.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0049.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (3120.0 m, 3220.0 m, 0.0 m) -------------
sampling0050.output_frequency                = 1
sampling0050.fields                          = velocity temperature tke
sampling0050.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0050.inflow-bc-3D.type               = PlaneSampler
sampling0050.inflow-bc-3D.num_points         = 64 64
sampling0050.inflow-bc-3D.origin             = 2740.0 2900.0 0.0
sampling0050.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0050.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0050.inflow-scan.type                = LidarSampler
sampling0050.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0050.inflow-scan.length              = 996.0
sampling0050.inflow-scan.origin              = 3120.0 3220.0 120.0  # Lidar situated 3.0 m above hub height
sampling0050.inflow-scan.periodic            = true
sampling0050.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0050.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0050.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (3120.0 m, 3860.0 m, 0.0 m) -------------
sampling0051.output_frequency                = 1
sampling0051.fields                          = velocity temperature tke
sampling0051.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0051.inflow-bc-3D.type               = PlaneSampler
sampling0051.inflow-bc-3D.num_points         = 64 64
sampling0051.inflow-bc-3D.origin             = 2740.0 3540.0 0.0
sampling0051.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0051.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0051.inflow-scan.type                = LidarSampler
sampling0051.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0051.inflow-scan.length              = 996.0
sampling0051.inflow-scan.origin              = 3120.0 3860.0 120.0  # Lidar situated 3.0 m above hub height
sampling0051.inflow-scan.periodic            = true
sampling0051.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0051.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0051.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (3120.0 m, 4500.0 m, 0.0 m) -------------
sampling0052.output_frequency                = 1
sampling0052.fields                          = velocity temperature tke
sampling0052.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0052.inflow-bc-3D.type               = PlaneSampler
sampling0052.inflow-bc-3D.num_points         = 64 64
sampling0052.inflow-bc-3D.origin             = 2740.0 4180.0 0.0
sampling0052.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0052.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0052.inflow-scan.type                = LidarSampler
sampling0052.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0052.inflow-scan.length              = 996.0
sampling0052.inflow-scan.origin              = 3120.0 4500.0 120.0  # Lidar situated 3.0 m above hub height
sampling0052.inflow-scan.periodic            = true
sampling0052.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0052.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0052.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (3120.0 m, 5140.0 m, 0.0 m) -------------
sampling0053.output_frequency                = 1
sampling0053.fields                          = velocity temperature tke
sampling0053.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0053.inflow-bc-3D.type               = PlaneSampler
sampling0053.inflow-bc-3D.num_points         = 64 64
sampling0053.inflow-bc-3D.origin             = 2740.0 4820.0 0.0
sampling0053.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0053.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0053.inflow-scan.type                = LidarSampler
sampling0053.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0053.inflow-scan.length              = 996.0
sampling0053.inflow-scan.origin              = 3120.0 5140.0 120.0  # Lidar situated 3.0 m above hub height
sampling0053.inflow-scan.periodic            = true
sampling0053.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0053.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0053.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (3120.0 m, 5780.0 m, 0.0 m) -------------
sampling0054.output_frequency                = 1
sampling0054.fields                          = velocity temperature tke
sampling0054.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0054.inflow-bc-3D.type               = PlaneSampler
sampling0054.inflow-bc-3D.num_points         = 64 64
sampling0054.inflow-bc-3D.origin             = 2740.0 5460.0 0.0
sampling0054.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0054.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0054.inflow-scan.type                = LidarSampler
sampling0054.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0054.inflow-scan.length              = 996.0
sampling0054.inflow-scan.origin              = 3120.0 5780.0 120.0  # Lidar situated 3.0 m above hub height
sampling0054.inflow-scan.periodic            = true
sampling0054.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0054.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0054.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (3120.0 m, 6420.0 m, 0.0 m) -------------
sampling0055.output_frequency                = 1
sampling0055.fields                          = velocity temperature tke
sampling0055.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0055.inflow-bc-3D.type               = PlaneSampler
sampling0055.inflow-bc-3D.num_points         = 64 64
sampling0055.inflow-bc-3D.origin             = 2740.0 6100.0 0.0
sampling0055.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0055.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0055.inflow-scan.type                = LidarSampler
sampling0055.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0055.inflow-scan.length              = 996.0
sampling0055.inflow-scan.origin              = 3120.0 6420.0 120.0  # Lidar situated 3.0 m above hub height
sampling0055.inflow-scan.periodic            = true
sampling0055.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0055.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0055.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (3120.0 m, 7060.0 m, 0.0 m) -------------
sampling0056.output_frequency                = 1
sampling0056.fields                          = velocity temperature tke
sampling0056.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0056.inflow-bc-3D.type               = PlaneSampler
sampling0056.inflow-bc-3D.num_points         = 64 64
sampling0056.inflow-bc-3D.origin             = 2740.0 6740.0 0.0
sampling0056.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0056.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0056.inflow-scan.type                = LidarSampler
sampling0056.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0056.inflow-scan.length              = 996.0
sampling0056.inflow-scan.origin              = 3120.0 7060.0 120.0  # Lidar situated 3.0 m above hub height
sampling0056.inflow-scan.periodic            = true
sampling0056.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0056.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0056.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (3120.0 m, 7700.0 m, 0.0 m) -------------
sampling0057.output_frequency                = 1
sampling0057.fields                          = velocity temperature tke
sampling0057.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0057.inflow-bc-3D.type               = PlaneSampler
sampling0057.inflow-bc-3D.num_points         = 64 64
sampling0057.inflow-bc-3D.origin             = 2740.0 7380.0 0.0
sampling0057.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0057.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0057.inflow-scan.type                = LidarSampler
sampling0057.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0057.inflow-scan.length              = 996.0
sampling0057.inflow-scan.origin              = 3120.0 7700.0 120.0  # Lidar situated 3.0 m above hub height
sampling0057.inflow-scan.periodic            = true
sampling0057.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0057.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0057.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (3120.0 m, 8340.0 m, 0.0 m) -------------
sampling0058.output_frequency                = 1
sampling0058.fields                          = velocity temperature tke
sampling0058.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0058.inflow-bc-3D.type               = PlaneSampler
sampling0058.inflow-bc-3D.num_points         = 64 64
sampling0058.inflow-bc-3D.origin             = 2740.0 8020.0 0.0
sampling0058.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0058.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0058.inflow-scan.type                = LidarSampler
sampling0058.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0058.inflow-scan.length              = 996.0
sampling0058.inflow-scan.origin              = 3120.0 8340.0 120.0  # Lidar situated 3.0 m above hub height
sampling0058.inflow-scan.periodic            = true
sampling0058.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0058.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0058.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (3120.0 m, 8980.0 m, 0.0 m) -------------
sampling0059.output_frequency                = 1
sampling0059.fields                          = velocity temperature tke
sampling0059.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0059.inflow-bc-3D.type               = PlaneSampler
sampling0059.inflow-bc-3D.num_points         = 64 64
sampling0059.inflow-bc-3D.origin             = 2740.0 8660.0 0.0
sampling0059.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0059.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0059.inflow-scan.type                = LidarSampler
sampling0059.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0059.inflow-scan.length              = 996.0
sampling0059.inflow-scan.origin              = 3120.0 8980.0 120.0  # Lidar situated 3.0 m above hub height
sampling0059.inflow-scan.periodic            = true
sampling0059.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0059.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0059.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (3120.0 m, 9620.0 m, 0.0 m) -------------
sampling0060.output_frequency                = 1
sampling0060.fields                          = velocity temperature tke
sampling0060.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0060.inflow-bc-3D.type               = PlaneSampler
sampling0060.inflow-bc-3D.num_points         = 64 64
sampling0060.inflow-bc-3D.origin             = 2740.0 9300.0 0.0
sampling0060.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0060.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0060.inflow-scan.type                = LidarSampler
sampling0060.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0060.inflow-scan.length              = 996.0
sampling0060.inflow-scan.origin              = 3120.0 9620.0 120.0  # Lidar situated 3.0 m above hub height
sampling0060.inflow-scan.periodic            = true
sampling0060.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0060.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0060.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (3120.0 m, 10260.0 m, 0.0 m) -------------
sampling0061.output_frequency                = 1
sampling0061.fields                          = velocity temperature tke
sampling0061.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0061.inflow-bc-3D.type               = PlaneSampler
sampling0061.inflow-bc-3D.num_points         = 64 64
sampling0061.inflow-bc-3D.origin             = 2740.0 9940.0 0.0
sampling0061.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0061.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0061.inflow-scan.type                = LidarSampler
sampling0061.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0061.inflow-scan.length              = 996.0
sampling0061.inflow-scan.origin              = 3120.0 10260.0 120.0  # Lidar situated 3.0 m above hub height
sampling0061.inflow-scan.periodic            = true
sampling0061.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0061.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0061.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (3120.0 m, 10900.0 m, 0.0 m) -------------
sampling0062.output_frequency                = 1
sampling0062.fields                          = velocity temperature tke
sampling0062.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0062.inflow-bc-3D.type               = PlaneSampler
sampling0062.inflow-bc-3D.num_points         = 64 64
sampling0062.inflow-bc-3D.origin             = 2740.0 10580.0 0.0
sampling0062.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0062.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0062.inflow-scan.type                = LidarSampler
sampling0062.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0062.inflow-scan.length              = 996.0
sampling0062.inflow-scan.origin              = 3120.0 10900.0 120.0  # Lidar situated 3.0 m above hub height
sampling0062.inflow-scan.periodic            = true
sampling0062.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0062.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0062.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (3120.0 m, 11540.0 m, 0.0 m) -------------
sampling0063.output_frequency                = 1
sampling0063.fields                          = velocity temperature tke
sampling0063.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0063.inflow-bc-3D.type               = PlaneSampler
sampling0063.inflow-bc-3D.num_points         = 64 64
sampling0063.inflow-bc-3D.origin             = 2740.0 11220.0 0.0
sampling0063.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0063.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0063.inflow-scan.type                = LidarSampler
sampling0063.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0063.inflow-scan.length              = 996.0
sampling0063.inflow-scan.origin              = 3120.0 11540.0 120.0  # Lidar situated 3.0 m above hub height
sampling0063.inflow-scan.periodic            = true
sampling0063.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0063.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0063.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (3120.0 m, 12180.0 m, 0.0 m) -------------
sampling0064.output_frequency                = 1
sampling0064.fields                          = velocity temperature tke
sampling0064.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0064.inflow-bc-3D.type               = PlaneSampler
sampling0064.inflow-bc-3D.num_points         = 64 64
sampling0064.inflow-bc-3D.origin             = 2740.0 11860.0 0.0
sampling0064.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0064.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0064.inflow-scan.type                = LidarSampler
sampling0064.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0064.inflow-scan.length              = 996.0
sampling0064.inflow-scan.origin              = 3120.0 12180.0 120.0  # Lidar situated 3.0 m above hub height
sampling0064.inflow-scan.periodic            = true
sampling0064.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0064.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0064.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (3120.0 m, 12820.0 m, 0.0 m) -------------
sampling0065.output_frequency                = 1
sampling0065.fields                          = velocity temperature tke
sampling0065.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0065.inflow-bc-3D.type               = PlaneSampler
sampling0065.inflow-bc-3D.num_points         = 64 64
sampling0065.inflow-bc-3D.origin             = 2740.0 12500.0 0.0
sampling0065.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0065.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0065.inflow-scan.type                = LidarSampler
sampling0065.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0065.inflow-scan.length              = 996.0
sampling0065.inflow-scan.origin              = 3120.0 12820.0 120.0  # Lidar situated 3.0 m above hub height
sampling0065.inflow-scan.periodic            = true
sampling0065.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0065.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0065.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (3120.0 m, 13460.0 m, 0.0 m) -------------
sampling0066.output_frequency                = 1
sampling0066.fields                          = velocity temperature tke
sampling0066.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0066.inflow-bc-3D.type               = PlaneSampler
sampling0066.inflow-bc-3D.num_points         = 64 64
sampling0066.inflow-bc-3D.origin             = 2740.0 13140.0 0.0
sampling0066.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0066.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0066.inflow-scan.type                = LidarSampler
sampling0066.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0066.inflow-scan.length              = 996.0
sampling0066.inflow-scan.origin              = 3120.0 13460.0 120.0  # Lidar situated 3.0 m above hub height
sampling0066.inflow-scan.periodic            = true
sampling0066.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0066.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0066.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (3120.0 m, 14100.0 m, 0.0 m) -------------
sampling0067.output_frequency                = 1
sampling0067.fields                          = velocity temperature tke
sampling0067.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0067.inflow-bc-3D.type               = PlaneSampler
sampling0067.inflow-bc-3D.num_points         = 64 64
sampling0067.inflow-bc-3D.origin             = 2740.0 13780.0 0.0
sampling0067.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0067.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0067.inflow-scan.type                = LidarSampler
sampling0067.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0067.inflow-scan.length              = 996.0
sampling0067.inflow-scan.origin              = 3120.0 14100.0 120.0  # Lidar situated 3.0 m above hub height
sampling0067.inflow-scan.periodic            = true
sampling0067.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0067.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0067.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (3120.0 m, 14740.0 m, 0.0 m) -------------
sampling0068.output_frequency                = 1
sampling0068.fields                          = velocity temperature tke
sampling0068.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0068.inflow-bc-3D.type               = PlaneSampler
sampling0068.inflow-bc-3D.num_points         = 64 64
sampling0068.inflow-bc-3D.origin             = 2740.0 14420.0 0.0
sampling0068.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0068.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0068.inflow-scan.type                = LidarSampler
sampling0068.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0068.inflow-scan.length              = 996.0
sampling0068.inflow-scan.origin              = 3120.0 14740.0 120.0  # Lidar situated 3.0 m above hub height
sampling0068.inflow-scan.periodic            = true
sampling0068.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0068.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0068.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (4120.0 m, 820.0 m, 0.0 m) -------------
sampling0069.output_frequency                = 1
sampling0069.fields                          = velocity temperature tke
sampling0069.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0069.inflow-bc-3D.type               = PlaneSampler
sampling0069.inflow-bc-3D.num_points         = 64 64
sampling0069.inflow-bc-3D.origin             = 3740.0 500.0 0.0
sampling0069.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0069.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0069.inflow-scan.type                = LidarSampler
sampling0069.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0069.inflow-scan.length              = 996.0
sampling0069.inflow-scan.origin              = 4120.0 820.0 120.0  # Lidar situated 3.0 m above hub height
sampling0069.inflow-scan.periodic            = true
sampling0069.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0069.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0069.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (4120.0 m, 1460.0 m, 0.0 m) -------------
sampling0070.output_frequency                = 1
sampling0070.fields                          = velocity temperature tke
sampling0070.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0070.inflow-bc-3D.type               = PlaneSampler
sampling0070.inflow-bc-3D.num_points         = 64 64
sampling0070.inflow-bc-3D.origin             = 3740.0 1140.0 0.0
sampling0070.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0070.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0070.inflow-scan.type                = LidarSampler
sampling0070.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0070.inflow-scan.length              = 996.0
sampling0070.inflow-scan.origin              = 4120.0 1460.0 120.0  # Lidar situated 3.0 m above hub height
sampling0070.inflow-scan.periodic            = true
sampling0070.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0070.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0070.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (4120.0 m, 2100.0 m, 0.0 m) -------------
sampling0071.output_frequency                = 1
sampling0071.fields                          = velocity temperature tke
sampling0071.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0071.inflow-bc-3D.type               = PlaneSampler
sampling0071.inflow-bc-3D.num_points         = 64 64
sampling0071.inflow-bc-3D.origin             = 3740.0 1780.0 0.0
sampling0071.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0071.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0071.inflow-scan.type                = LidarSampler
sampling0071.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0071.inflow-scan.length              = 996.0
sampling0071.inflow-scan.origin              = 4120.0 2100.0 120.0  # Lidar situated 3.0 m above hub height
sampling0071.inflow-scan.periodic            = true
sampling0071.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0071.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0071.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (4120.0 m, 2740.0 m, 0.0 m) -------------
sampling0072.output_frequency                = 1
sampling0072.fields                          = velocity temperature tke
sampling0072.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0072.inflow-bc-3D.type               = PlaneSampler
sampling0072.inflow-bc-3D.num_points         = 64 64
sampling0072.inflow-bc-3D.origin             = 3740.0 2420.0 0.0
sampling0072.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0072.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0072.inflow-scan.type                = LidarSampler
sampling0072.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0072.inflow-scan.length              = 996.0
sampling0072.inflow-scan.origin              = 4120.0 2740.0 120.0  # Lidar situated 3.0 m above hub height
sampling0072.inflow-scan.periodic            = true
sampling0072.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0072.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0072.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (4120.0 m, 3380.0 m, 0.0 m) -------------
sampling0073.output_frequency                = 1
sampling0073.fields                          = velocity temperature tke
sampling0073.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0073.inflow-bc-3D.type               = PlaneSampler
sampling0073.inflow-bc-3D.num_points         = 64 64
sampling0073.inflow-bc-3D.origin             = 3740.0 3060.0 0.0
sampling0073.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0073.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0073.inflow-scan.type                = LidarSampler
sampling0073.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0073.inflow-scan.length              = 996.0
sampling0073.inflow-scan.origin              = 4120.0 3380.0 120.0  # Lidar situated 3.0 m above hub height
sampling0073.inflow-scan.periodic            = true
sampling0073.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0073.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0073.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (4120.0 m, 4020.0 m, 0.0 m) -------------
sampling0074.output_frequency                = 1
sampling0074.fields                          = velocity temperature tke
sampling0074.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0074.inflow-bc-3D.type               = PlaneSampler
sampling0074.inflow-bc-3D.num_points         = 64 64
sampling0074.inflow-bc-3D.origin             = 3740.0 3700.0 0.0
sampling0074.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0074.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0074.inflow-scan.type                = LidarSampler
sampling0074.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0074.inflow-scan.length              = 996.0
sampling0074.inflow-scan.origin              = 4120.0 4020.0 120.0  # Lidar situated 3.0 m above hub height
sampling0074.inflow-scan.periodic            = true
sampling0074.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0074.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0074.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (4120.0 m, 4660.0 m, 0.0 m) -------------
sampling0075.output_frequency                = 1
sampling0075.fields                          = velocity temperature tke
sampling0075.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0075.inflow-bc-3D.type               = PlaneSampler
sampling0075.inflow-bc-3D.num_points         = 64 64
sampling0075.inflow-bc-3D.origin             = 3740.0 4340.0 0.0
sampling0075.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0075.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0075.inflow-scan.type                = LidarSampler
sampling0075.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0075.inflow-scan.length              = 996.0
sampling0075.inflow-scan.origin              = 4120.0 4660.0 120.0  # Lidar situated 3.0 m above hub height
sampling0075.inflow-scan.periodic            = true
sampling0075.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0075.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0075.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (4120.0 m, 5300.0 m, 0.0 m) -------------
sampling0076.output_frequency                = 1
sampling0076.fields                          = velocity temperature tke
sampling0076.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0076.inflow-bc-3D.type               = PlaneSampler
sampling0076.inflow-bc-3D.num_points         = 64 64
sampling0076.inflow-bc-3D.origin             = 3740.0 4980.0 0.0
sampling0076.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0076.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0076.inflow-scan.type                = LidarSampler
sampling0076.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0076.inflow-scan.length              = 996.0
sampling0076.inflow-scan.origin              = 4120.0 5300.0 120.0  # Lidar situated 3.0 m above hub height
sampling0076.inflow-scan.periodic            = true
sampling0076.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0076.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0076.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (4120.0 m, 5940.0 m, 0.0 m) -------------
sampling0077.output_frequency                = 1
sampling0077.fields                          = velocity temperature tke
sampling0077.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0077.inflow-bc-3D.type               = PlaneSampler
sampling0077.inflow-bc-3D.num_points         = 64 64
sampling0077.inflow-bc-3D.origin             = 3740.0 5620.0 0.0
sampling0077.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0077.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0077.inflow-scan.type                = LidarSampler
sampling0077.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0077.inflow-scan.length              = 996.0
sampling0077.inflow-scan.origin              = 4120.0 5940.0 120.0  # Lidar situated 3.0 m above hub height
sampling0077.inflow-scan.periodic            = true
sampling0077.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0077.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0077.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (4120.0 m, 6580.0 m, 0.0 m) -------------
sampling0078.output_frequency                = 1
sampling0078.fields                          = velocity temperature tke
sampling0078.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0078.inflow-bc-3D.type               = PlaneSampler
sampling0078.inflow-bc-3D.num_points         = 64 64
sampling0078.inflow-bc-3D.origin             = 3740.0 6260.0 0.0
sampling0078.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0078.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0078.inflow-scan.type                = LidarSampler
sampling0078.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0078.inflow-scan.length              = 996.0
sampling0078.inflow-scan.origin              = 4120.0 6580.0 120.0  # Lidar situated 3.0 m above hub height
sampling0078.inflow-scan.periodic            = true
sampling0078.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0078.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0078.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (4120.0 m, 7220.0 m, 0.0 m) -------------
sampling0079.output_frequency                = 1
sampling0079.fields                          = velocity temperature tke
sampling0079.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0079.inflow-bc-3D.type               = PlaneSampler
sampling0079.inflow-bc-3D.num_points         = 64 64
sampling0079.inflow-bc-3D.origin             = 3740.0 6900.0 0.0
sampling0079.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0079.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0079.inflow-scan.type                = LidarSampler
sampling0079.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0079.inflow-scan.length              = 996.0
sampling0079.inflow-scan.origin              = 4120.0 7220.0 120.0  # Lidar situated 3.0 m above hub height
sampling0079.inflow-scan.periodic            = true
sampling0079.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0079.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0079.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (4120.0 m, 7860.0 m, 0.0 m) -------------
sampling0080.output_frequency                = 1
sampling0080.fields                          = velocity temperature tke
sampling0080.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0080.inflow-bc-3D.type               = PlaneSampler
sampling0080.inflow-bc-3D.num_points         = 64 64
sampling0080.inflow-bc-3D.origin             = 3740.0 7540.0 0.0
sampling0080.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0080.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0080.inflow-scan.type                = LidarSampler
sampling0080.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0080.inflow-scan.length              = 996.0
sampling0080.inflow-scan.origin              = 4120.0 7860.0 120.0  # Lidar situated 3.0 m above hub height
sampling0080.inflow-scan.periodic            = true
sampling0080.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0080.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0080.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (4120.0 m, 8500.0 m, 0.0 m) -------------
sampling0081.output_frequency                = 1
sampling0081.fields                          = velocity temperature tke
sampling0081.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0081.inflow-bc-3D.type               = PlaneSampler
sampling0081.inflow-bc-3D.num_points         = 64 64
sampling0081.inflow-bc-3D.origin             = 3740.0 8180.0 0.0
sampling0081.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0081.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0081.inflow-scan.type                = LidarSampler
sampling0081.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0081.inflow-scan.length              = 996.0
sampling0081.inflow-scan.origin              = 4120.0 8500.0 120.0  # Lidar situated 3.0 m above hub height
sampling0081.inflow-scan.periodic            = true
sampling0081.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0081.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0081.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (4120.0 m, 9140.0 m, 0.0 m) -------------
sampling0082.output_frequency                = 1
sampling0082.fields                          = velocity temperature tke
sampling0082.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0082.inflow-bc-3D.type               = PlaneSampler
sampling0082.inflow-bc-3D.num_points         = 64 64
sampling0082.inflow-bc-3D.origin             = 3740.0 8820.0 0.0
sampling0082.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0082.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0082.inflow-scan.type                = LidarSampler
sampling0082.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0082.inflow-scan.length              = 996.0
sampling0082.inflow-scan.origin              = 4120.0 9140.0 120.0  # Lidar situated 3.0 m above hub height
sampling0082.inflow-scan.periodic            = true
sampling0082.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0082.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0082.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (4120.0 m, 9780.0 m, 0.0 m) -------------
sampling0083.output_frequency                = 1
sampling0083.fields                          = velocity temperature tke
sampling0083.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0083.inflow-bc-3D.type               = PlaneSampler
sampling0083.inflow-bc-3D.num_points         = 64 64
sampling0083.inflow-bc-3D.origin             = 3740.0 9460.0 0.0
sampling0083.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0083.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0083.inflow-scan.type                = LidarSampler
sampling0083.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0083.inflow-scan.length              = 996.0
sampling0083.inflow-scan.origin              = 4120.0 9780.0 120.0  # Lidar situated 3.0 m above hub height
sampling0083.inflow-scan.periodic            = true
sampling0083.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0083.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0083.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (4120.0 m, 10420.0 m, 0.0 m) -------------
sampling0084.output_frequency                = 1
sampling0084.fields                          = velocity temperature tke
sampling0084.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0084.inflow-bc-3D.type               = PlaneSampler
sampling0084.inflow-bc-3D.num_points         = 64 64
sampling0084.inflow-bc-3D.origin             = 3740.0 10100.0 0.0
sampling0084.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0084.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0084.inflow-scan.type                = LidarSampler
sampling0084.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0084.inflow-scan.length              = 996.0
sampling0084.inflow-scan.origin              = 4120.0 10420.0 120.0  # Lidar situated 3.0 m above hub height
sampling0084.inflow-scan.periodic            = true
sampling0084.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0084.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0084.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (4120.0 m, 11060.0 m, 0.0 m) -------------
sampling0085.output_frequency                = 1
sampling0085.fields                          = velocity temperature tke
sampling0085.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0085.inflow-bc-3D.type               = PlaneSampler
sampling0085.inflow-bc-3D.num_points         = 64 64
sampling0085.inflow-bc-3D.origin             = 3740.0 10740.0 0.0
sampling0085.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0085.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0085.inflow-scan.type                = LidarSampler
sampling0085.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0085.inflow-scan.length              = 996.0
sampling0085.inflow-scan.origin              = 4120.0 11060.0 120.0  # Lidar situated 3.0 m above hub height
sampling0085.inflow-scan.periodic            = true
sampling0085.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0085.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0085.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (4120.0 m, 11700.0 m, 0.0 m) -------------
sampling0086.output_frequency                = 1
sampling0086.fields                          = velocity temperature tke
sampling0086.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0086.inflow-bc-3D.type               = PlaneSampler
sampling0086.inflow-bc-3D.num_points         = 64 64
sampling0086.inflow-bc-3D.origin             = 3740.0 11380.0 0.0
sampling0086.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0086.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0086.inflow-scan.type                = LidarSampler
sampling0086.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0086.inflow-scan.length              = 996.0
sampling0086.inflow-scan.origin              = 4120.0 11700.0 120.0  # Lidar situated 3.0 m above hub height
sampling0086.inflow-scan.periodic            = true
sampling0086.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0086.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0086.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (4120.0 m, 12340.0 m, 0.0 m) -------------
sampling0087.output_frequency                = 1
sampling0087.fields                          = velocity temperature tke
sampling0087.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0087.inflow-bc-3D.type               = PlaneSampler
sampling0087.inflow-bc-3D.num_points         = 64 64
sampling0087.inflow-bc-3D.origin             = 3740.0 12020.0 0.0
sampling0087.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0087.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0087.inflow-scan.type                = LidarSampler
sampling0087.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0087.inflow-scan.length              = 996.0
sampling0087.inflow-scan.origin              = 4120.0 12340.0 120.0  # Lidar situated 3.0 m above hub height
sampling0087.inflow-scan.periodic            = true
sampling0087.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0087.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0087.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (4120.0 m, 12980.0 m, 0.0 m) -------------
sampling0088.output_frequency                = 1
sampling0088.fields                          = velocity temperature tke
sampling0088.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0088.inflow-bc-3D.type               = PlaneSampler
sampling0088.inflow-bc-3D.num_points         = 64 64
sampling0088.inflow-bc-3D.origin             = 3740.0 12660.0 0.0
sampling0088.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0088.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0088.inflow-scan.type                = LidarSampler
sampling0088.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0088.inflow-scan.length              = 996.0
sampling0088.inflow-scan.origin              = 4120.0 12980.0 120.0  # Lidar situated 3.0 m above hub height
sampling0088.inflow-scan.periodic            = true
sampling0088.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0088.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0088.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (4120.0 m, 13620.0 m, 0.0 m) -------------
sampling0089.output_frequency                = 1
sampling0089.fields                          = velocity temperature tke
sampling0089.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0089.inflow-bc-3D.type               = PlaneSampler
sampling0089.inflow-bc-3D.num_points         = 64 64
sampling0089.inflow-bc-3D.origin             = 3740.0 13300.0 0.0
sampling0089.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0089.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0089.inflow-scan.type                = LidarSampler
sampling0089.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0089.inflow-scan.length              = 996.0
sampling0089.inflow-scan.origin              = 4120.0 13620.0 120.0  # Lidar situated 3.0 m above hub height
sampling0089.inflow-scan.periodic            = true
sampling0089.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0089.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0089.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (4120.0 m, 14260.0 m, 0.0 m) -------------
sampling0090.output_frequency                = 1
sampling0090.fields                          = velocity temperature tke
sampling0090.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0090.inflow-bc-3D.type               = PlaneSampler
sampling0090.inflow-bc-3D.num_points         = 64 64
sampling0090.inflow-bc-3D.origin             = 3740.0 13940.0 0.0
sampling0090.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0090.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0090.inflow-scan.type                = LidarSampler
sampling0090.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0090.inflow-scan.length              = 996.0
sampling0090.inflow-scan.origin              = 4120.0 14260.0 120.0  # Lidar situated 3.0 m above hub height
sampling0090.inflow-scan.periodic            = true
sampling0090.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0090.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0090.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (4120.0 m, 14900.0 m, 0.0 m) -------------
sampling0091.output_frequency                = 1
sampling0091.fields                          = velocity temperature tke
sampling0091.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0091.inflow-bc-3D.type               = PlaneSampler
sampling0091.inflow-bc-3D.num_points         = 64 64
sampling0091.inflow-bc-3D.origin             = 3740.0 14580.0 0.0
sampling0091.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0091.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0091.inflow-scan.type                = LidarSampler
sampling0091.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0091.inflow-scan.length              = 996.0
sampling0091.inflow-scan.origin              = 4120.0 14900.0 120.0  # Lidar situated 3.0 m above hub height
sampling0091.inflow-scan.periodic            = true
sampling0091.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0091.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0091.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (5120.0 m, 340.0 m, 0.0 m) -------------
sampling0092.output_frequency                = 1
sampling0092.fields                          = velocity temperature tke
sampling0092.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0092.inflow-bc-3D.type               = PlaneSampler
sampling0092.inflow-bc-3D.num_points         = 64 64
sampling0092.inflow-bc-3D.origin             = 4740.0 20.0 0.0
sampling0092.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0092.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0092.inflow-scan.type                = LidarSampler
sampling0092.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0092.inflow-scan.length              = 996.0
sampling0092.inflow-scan.origin              = 5120.0 340.0 120.0  # Lidar situated 3.0 m above hub height
sampling0092.inflow-scan.periodic            = true
sampling0092.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0092.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0092.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (5120.0 m, 980.0 m, 0.0 m) -------------
sampling0093.output_frequency                = 1
sampling0093.fields                          = velocity temperature tke
sampling0093.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0093.inflow-bc-3D.type               = PlaneSampler
sampling0093.inflow-bc-3D.num_points         = 64 64
sampling0093.inflow-bc-3D.origin             = 4740.0 660.0 0.0
sampling0093.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0093.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0093.inflow-scan.type                = LidarSampler
sampling0093.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0093.inflow-scan.length              = 996.0
sampling0093.inflow-scan.origin              = 5120.0 980.0 120.0  # Lidar situated 3.0 m above hub height
sampling0093.inflow-scan.periodic            = true
sampling0093.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0093.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0093.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (5120.0 m, 1620.0 m, 0.0 m) -------------
sampling0094.output_frequency                = 1
sampling0094.fields                          = velocity temperature tke
sampling0094.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0094.inflow-bc-3D.type               = PlaneSampler
sampling0094.inflow-bc-3D.num_points         = 64 64
sampling0094.inflow-bc-3D.origin             = 4740.0 1300.0 0.0
sampling0094.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0094.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0094.inflow-scan.type                = LidarSampler
sampling0094.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0094.inflow-scan.length              = 996.0
sampling0094.inflow-scan.origin              = 5120.0 1620.0 120.0  # Lidar situated 3.0 m above hub height
sampling0094.inflow-scan.periodic            = true
sampling0094.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0094.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0094.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (5120.0 m, 2260.0 m, 0.0 m) -------------
sampling0095.output_frequency                = 1
sampling0095.fields                          = velocity temperature tke
sampling0095.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0095.inflow-bc-3D.type               = PlaneSampler
sampling0095.inflow-bc-3D.num_points         = 64 64
sampling0095.inflow-bc-3D.origin             = 4740.0 1940.0 0.0
sampling0095.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0095.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0095.inflow-scan.type                = LidarSampler
sampling0095.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0095.inflow-scan.length              = 996.0
sampling0095.inflow-scan.origin              = 5120.0 2260.0 120.0  # Lidar situated 3.0 m above hub height
sampling0095.inflow-scan.periodic            = true
sampling0095.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0095.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0095.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (5120.0 m, 2900.0 m, 0.0 m) -------------
sampling0096.output_frequency                = 1
sampling0096.fields                          = velocity temperature tke
sampling0096.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0096.inflow-bc-3D.type               = PlaneSampler
sampling0096.inflow-bc-3D.num_points         = 64 64
sampling0096.inflow-bc-3D.origin             = 4740.0 2580.0 0.0
sampling0096.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0096.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0096.inflow-scan.type                = LidarSampler
sampling0096.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0096.inflow-scan.length              = 996.0
sampling0096.inflow-scan.origin              = 5120.0 2900.0 120.0  # Lidar situated 3.0 m above hub height
sampling0096.inflow-scan.periodic            = true
sampling0096.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0096.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0096.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (5120.0 m, 3540.0 m, 0.0 m) -------------
sampling0097.output_frequency                = 1
sampling0097.fields                          = velocity temperature tke
sampling0097.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0097.inflow-bc-3D.type               = PlaneSampler
sampling0097.inflow-bc-3D.num_points         = 64 64
sampling0097.inflow-bc-3D.origin             = 4740.0 3220.0 0.0
sampling0097.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0097.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0097.inflow-scan.type                = LidarSampler
sampling0097.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0097.inflow-scan.length              = 996.0
sampling0097.inflow-scan.origin              = 5120.0 3540.0 120.0  # Lidar situated 3.0 m above hub height
sampling0097.inflow-scan.periodic            = true
sampling0097.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0097.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0097.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (5120.0 m, 4180.0 m, 0.0 m) -------------
sampling0098.output_frequency                = 1
sampling0098.fields                          = velocity temperature tke
sampling0098.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0098.inflow-bc-3D.type               = PlaneSampler
sampling0098.inflow-bc-3D.num_points         = 64 64
sampling0098.inflow-bc-3D.origin             = 4740.0 3860.0 0.0
sampling0098.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0098.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0098.inflow-scan.type                = LidarSampler
sampling0098.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0098.inflow-scan.length              = 996.0
sampling0098.inflow-scan.origin              = 5120.0 4180.0 120.0  # Lidar situated 3.0 m above hub height
sampling0098.inflow-scan.periodic            = true
sampling0098.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0098.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0098.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (5120.0 m, 4820.0 m, 0.0 m) -------------
sampling0099.output_frequency                = 1
sampling0099.fields                          = velocity temperature tke
sampling0099.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0099.inflow-bc-3D.type               = PlaneSampler
sampling0099.inflow-bc-3D.num_points         = 64 64
sampling0099.inflow-bc-3D.origin             = 4740.0 4500.0 0.0
sampling0099.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0099.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0099.inflow-scan.type                = LidarSampler
sampling0099.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0099.inflow-scan.length              = 996.0
sampling0099.inflow-scan.origin              = 5120.0 4820.0 120.0  # Lidar situated 3.0 m above hub height
sampling0099.inflow-scan.periodic            = true
sampling0099.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0099.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0099.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (5120.0 m, 5460.0 m, 0.0 m) -------------
sampling0100.output_frequency                = 1
sampling0100.fields                          = velocity temperature tke
sampling0100.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0100.inflow-bc-3D.type               = PlaneSampler
sampling0100.inflow-bc-3D.num_points         = 64 64
sampling0100.inflow-bc-3D.origin             = 4740.0 5140.0 0.0
sampling0100.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0100.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0100.inflow-scan.type                = LidarSampler
sampling0100.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0100.inflow-scan.length              = 996.0
sampling0100.inflow-scan.origin              = 5120.0 5460.0 120.0  # Lidar situated 3.0 m above hub height
sampling0100.inflow-scan.periodic            = true
sampling0100.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0100.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0100.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (5120.0 m, 6100.0 m, 0.0 m) -------------
sampling0101.output_frequency                = 1
sampling0101.fields                          = velocity temperature tke
sampling0101.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0101.inflow-bc-3D.type               = PlaneSampler
sampling0101.inflow-bc-3D.num_points         = 64 64
sampling0101.inflow-bc-3D.origin             = 4740.0 5780.0 0.0
sampling0101.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0101.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0101.inflow-scan.type                = LidarSampler
sampling0101.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0101.inflow-scan.length              = 996.0
sampling0101.inflow-scan.origin              = 5120.0 6100.0 120.0  # Lidar situated 3.0 m above hub height
sampling0101.inflow-scan.periodic            = true
sampling0101.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0101.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0101.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (5120.0 m, 6740.0 m, 0.0 m) -------------
sampling0102.output_frequency                = 1
sampling0102.fields                          = velocity temperature tke
sampling0102.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0102.inflow-bc-3D.type               = PlaneSampler
sampling0102.inflow-bc-3D.num_points         = 64 64
sampling0102.inflow-bc-3D.origin             = 4740.0 6420.0 0.0
sampling0102.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0102.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0102.inflow-scan.type                = LidarSampler
sampling0102.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0102.inflow-scan.length              = 996.0
sampling0102.inflow-scan.origin              = 5120.0 6740.0 120.0  # Lidar situated 3.0 m above hub height
sampling0102.inflow-scan.periodic            = true
sampling0102.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0102.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0102.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (5120.0 m, 7380.0 m, 0.0 m) -------------
sampling0103.output_frequency                = 1
sampling0103.fields                          = velocity temperature tke
sampling0103.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0103.inflow-bc-3D.type               = PlaneSampler
sampling0103.inflow-bc-3D.num_points         = 64 64
sampling0103.inflow-bc-3D.origin             = 4740.0 7060.0 0.0
sampling0103.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0103.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0103.inflow-scan.type                = LidarSampler
sampling0103.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0103.inflow-scan.length              = 996.0
sampling0103.inflow-scan.origin              = 5120.0 7380.0 120.0  # Lidar situated 3.0 m above hub height
sampling0103.inflow-scan.periodic            = true
sampling0103.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0103.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0103.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (5120.0 m, 8020.0 m, 0.0 m) -------------
sampling0104.output_frequency                = 1
sampling0104.fields                          = velocity temperature tke
sampling0104.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0104.inflow-bc-3D.type               = PlaneSampler
sampling0104.inflow-bc-3D.num_points         = 64 64
sampling0104.inflow-bc-3D.origin             = 4740.0 7700.0 0.0
sampling0104.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0104.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0104.inflow-scan.type                = LidarSampler
sampling0104.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0104.inflow-scan.length              = 996.0
sampling0104.inflow-scan.origin              = 5120.0 8020.0 120.0  # Lidar situated 3.0 m above hub height
sampling0104.inflow-scan.periodic            = true
sampling0104.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0104.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0104.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (5120.0 m, 8660.0 m, 0.0 m) -------------
sampling0105.output_frequency                = 1
sampling0105.fields                          = velocity temperature tke
sampling0105.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0105.inflow-bc-3D.type               = PlaneSampler
sampling0105.inflow-bc-3D.num_points         = 64 64
sampling0105.inflow-bc-3D.origin             = 4740.0 8340.0 0.0
sampling0105.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0105.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0105.inflow-scan.type                = LidarSampler
sampling0105.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0105.inflow-scan.length              = 996.0
sampling0105.inflow-scan.origin              = 5120.0 8660.0 120.0  # Lidar situated 3.0 m above hub height
sampling0105.inflow-scan.periodic            = true
sampling0105.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0105.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0105.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (5120.0 m, 9300.0 m, 0.0 m) -------------
sampling0106.output_frequency                = 1
sampling0106.fields                          = velocity temperature tke
sampling0106.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0106.inflow-bc-3D.type               = PlaneSampler
sampling0106.inflow-bc-3D.num_points         = 64 64
sampling0106.inflow-bc-3D.origin             = 4740.0 8980.0 0.0
sampling0106.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0106.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0106.inflow-scan.type                = LidarSampler
sampling0106.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0106.inflow-scan.length              = 996.0
sampling0106.inflow-scan.origin              = 5120.0 9300.0 120.0  # Lidar situated 3.0 m above hub height
sampling0106.inflow-scan.periodic            = true
sampling0106.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0106.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0106.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (5120.0 m, 9940.0 m, 0.0 m) -------------
sampling0107.output_frequency                = 1
sampling0107.fields                          = velocity temperature tke
sampling0107.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0107.inflow-bc-3D.type               = PlaneSampler
sampling0107.inflow-bc-3D.num_points         = 64 64
sampling0107.inflow-bc-3D.origin             = 4740.0 9620.0 0.0
sampling0107.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0107.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0107.inflow-scan.type                = LidarSampler
sampling0107.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0107.inflow-scan.length              = 996.0
sampling0107.inflow-scan.origin              = 5120.0 9940.0 120.0  # Lidar situated 3.0 m above hub height
sampling0107.inflow-scan.periodic            = true
sampling0107.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0107.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0107.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (5120.0 m, 10580.0 m, 0.0 m) -------------
sampling0108.output_frequency                = 1
sampling0108.fields                          = velocity temperature tke
sampling0108.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0108.inflow-bc-3D.type               = PlaneSampler
sampling0108.inflow-bc-3D.num_points         = 64 64
sampling0108.inflow-bc-3D.origin             = 4740.0 10260.0 0.0
sampling0108.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0108.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0108.inflow-scan.type                = LidarSampler
sampling0108.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0108.inflow-scan.length              = 996.0
sampling0108.inflow-scan.origin              = 5120.0 10580.0 120.0  # Lidar situated 3.0 m above hub height
sampling0108.inflow-scan.periodic            = true
sampling0108.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0108.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0108.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (5120.0 m, 11220.0 m, 0.0 m) -------------
sampling0109.output_frequency                = 1
sampling0109.fields                          = velocity temperature tke
sampling0109.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0109.inflow-bc-3D.type               = PlaneSampler
sampling0109.inflow-bc-3D.num_points         = 64 64
sampling0109.inflow-bc-3D.origin             = 4740.0 10900.0 0.0
sampling0109.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0109.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0109.inflow-scan.type                = LidarSampler
sampling0109.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0109.inflow-scan.length              = 996.0
sampling0109.inflow-scan.origin              = 5120.0 11220.0 120.0  # Lidar situated 3.0 m above hub height
sampling0109.inflow-scan.periodic            = true
sampling0109.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0109.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0109.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (5120.0 m, 11860.0 m, 0.0 m) -------------
sampling0110.output_frequency                = 1
sampling0110.fields                          = velocity temperature tke
sampling0110.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0110.inflow-bc-3D.type               = PlaneSampler
sampling0110.inflow-bc-3D.num_points         = 64 64
sampling0110.inflow-bc-3D.origin             = 4740.0 11540.0 0.0
sampling0110.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0110.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0110.inflow-scan.type                = LidarSampler
sampling0110.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0110.inflow-scan.length              = 996.0
sampling0110.inflow-scan.origin              = 5120.0 11860.0 120.0  # Lidar situated 3.0 m above hub height
sampling0110.inflow-scan.periodic            = true
sampling0110.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0110.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0110.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (5120.0 m, 12500.0 m, 0.0 m) -------------
sampling0111.output_frequency                = 1
sampling0111.fields                          = velocity temperature tke
sampling0111.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0111.inflow-bc-3D.type               = PlaneSampler
sampling0111.inflow-bc-3D.num_points         = 64 64
sampling0111.inflow-bc-3D.origin             = 4740.0 12180.0 0.0
sampling0111.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0111.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0111.inflow-scan.type                = LidarSampler
sampling0111.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0111.inflow-scan.length              = 996.0
sampling0111.inflow-scan.origin              = 5120.0 12500.0 120.0  # Lidar situated 3.0 m above hub height
sampling0111.inflow-scan.periodic            = true
sampling0111.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0111.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0111.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (5120.0 m, 13140.0 m, 0.0 m) -------------
sampling0112.output_frequency                = 1
sampling0112.fields                          = velocity temperature tke
sampling0112.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0112.inflow-bc-3D.type               = PlaneSampler
sampling0112.inflow-bc-3D.num_points         = 64 64
sampling0112.inflow-bc-3D.origin             = 4740.0 12820.0 0.0
sampling0112.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0112.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0112.inflow-scan.type                = LidarSampler
sampling0112.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0112.inflow-scan.length              = 996.0
sampling0112.inflow-scan.origin              = 5120.0 13140.0 120.0  # Lidar situated 3.0 m above hub height
sampling0112.inflow-scan.periodic            = true
sampling0112.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0112.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0112.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (5120.0 m, 13780.0 m, 0.0 m) -------------
sampling0113.output_frequency                = 1
sampling0113.fields                          = velocity temperature tke
sampling0113.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0113.inflow-bc-3D.type               = PlaneSampler
sampling0113.inflow-bc-3D.num_points         = 64 64
sampling0113.inflow-bc-3D.origin             = 4740.0 13460.0 0.0
sampling0113.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0113.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0113.inflow-scan.type                = LidarSampler
sampling0113.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0113.inflow-scan.length              = 996.0
sampling0113.inflow-scan.origin              = 5120.0 13780.0 120.0  # Lidar situated 3.0 m above hub height
sampling0113.inflow-scan.periodic            = true
sampling0113.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0113.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0113.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (5120.0 m, 14420.0 m, 0.0 m) -------------
sampling0114.output_frequency                = 1
sampling0114.fields                          = velocity temperature tke
sampling0114.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0114.inflow-bc-3D.type               = PlaneSampler
sampling0114.inflow-bc-3D.num_points         = 64 64
sampling0114.inflow-bc-3D.origin             = 4740.0 14100.0 0.0
sampling0114.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0114.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0114.inflow-scan.type                = LidarSampler
sampling0114.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0114.inflow-scan.length              = 996.0
sampling0114.inflow-scan.origin              = 5120.0 14420.0 120.0  # Lidar situated 3.0 m above hub height
sampling0114.inflow-scan.periodic            = true
sampling0114.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0114.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0114.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (6120.0 m, 500.0 m, 0.0 m) -------------
sampling0115.output_frequency                = 1
sampling0115.fields                          = velocity temperature tke
sampling0115.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0115.inflow-bc-3D.type               = PlaneSampler
sampling0115.inflow-bc-3D.num_points         = 64 64
sampling0115.inflow-bc-3D.origin             = 5740.0 180.0 0.0
sampling0115.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0115.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0115.inflow-scan.type                = LidarSampler
sampling0115.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0115.inflow-scan.length              = 996.0
sampling0115.inflow-scan.origin              = 6120.0 500.0 120.0  # Lidar situated 3.0 m above hub height
sampling0115.inflow-scan.periodic            = true
sampling0115.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0115.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0115.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (6120.0 m, 1140.0 m, 0.0 m) -------------
sampling0116.output_frequency                = 1
sampling0116.fields                          = velocity temperature tke
sampling0116.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0116.inflow-bc-3D.type               = PlaneSampler
sampling0116.inflow-bc-3D.num_points         = 64 64
sampling0116.inflow-bc-3D.origin             = 5740.0 820.0 0.0
sampling0116.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0116.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0116.inflow-scan.type                = LidarSampler
sampling0116.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0116.inflow-scan.length              = 996.0
sampling0116.inflow-scan.origin              = 6120.0 1140.0 120.0  # Lidar situated 3.0 m above hub height
sampling0116.inflow-scan.periodic            = true
sampling0116.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0116.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0116.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (6120.0 m, 1780.0 m, 0.0 m) -------------
sampling0117.output_frequency                = 1
sampling0117.fields                          = velocity temperature tke
sampling0117.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0117.inflow-bc-3D.type               = PlaneSampler
sampling0117.inflow-bc-3D.num_points         = 64 64
sampling0117.inflow-bc-3D.origin             = 5740.0 1460.0 0.0
sampling0117.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0117.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0117.inflow-scan.type                = LidarSampler
sampling0117.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0117.inflow-scan.length              = 996.0
sampling0117.inflow-scan.origin              = 6120.0 1780.0 120.0  # Lidar situated 3.0 m above hub height
sampling0117.inflow-scan.periodic            = true
sampling0117.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0117.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0117.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (6120.0 m, 2420.0 m, 0.0 m) -------------
sampling0118.output_frequency                = 1
sampling0118.fields                          = velocity temperature tke
sampling0118.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0118.inflow-bc-3D.type               = PlaneSampler
sampling0118.inflow-bc-3D.num_points         = 64 64
sampling0118.inflow-bc-3D.origin             = 5740.0 2100.0 0.0
sampling0118.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0118.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0118.inflow-scan.type                = LidarSampler
sampling0118.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0118.inflow-scan.length              = 996.0
sampling0118.inflow-scan.origin              = 6120.0 2420.0 120.0  # Lidar situated 3.0 m above hub height
sampling0118.inflow-scan.periodic            = true
sampling0118.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0118.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0118.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (6120.0 m, 3060.0 m, 0.0 m) -------------
sampling0119.output_frequency                = 1
sampling0119.fields                          = velocity temperature tke
sampling0119.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0119.inflow-bc-3D.type               = PlaneSampler
sampling0119.inflow-bc-3D.num_points         = 64 64
sampling0119.inflow-bc-3D.origin             = 5740.0 2740.0 0.0
sampling0119.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0119.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0119.inflow-scan.type                = LidarSampler
sampling0119.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0119.inflow-scan.length              = 996.0
sampling0119.inflow-scan.origin              = 6120.0 3060.0 120.0  # Lidar situated 3.0 m above hub height
sampling0119.inflow-scan.periodic            = true
sampling0119.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0119.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0119.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (6120.0 m, 3700.0 m, 0.0 m) -------------
sampling0120.output_frequency                = 1
sampling0120.fields                          = velocity temperature tke
sampling0120.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0120.inflow-bc-3D.type               = PlaneSampler
sampling0120.inflow-bc-3D.num_points         = 64 64
sampling0120.inflow-bc-3D.origin             = 5740.0 3380.0 0.0
sampling0120.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0120.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0120.inflow-scan.type                = LidarSampler
sampling0120.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0120.inflow-scan.length              = 996.0
sampling0120.inflow-scan.origin              = 6120.0 3700.0 120.0  # Lidar situated 3.0 m above hub height
sampling0120.inflow-scan.periodic            = true
sampling0120.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0120.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0120.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (6120.0 m, 4340.0 m, 0.0 m) -------------
sampling0121.output_frequency                = 1
sampling0121.fields                          = velocity temperature tke
sampling0121.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0121.inflow-bc-3D.type               = PlaneSampler
sampling0121.inflow-bc-3D.num_points         = 64 64
sampling0121.inflow-bc-3D.origin             = 5740.0 4020.0 0.0
sampling0121.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0121.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0121.inflow-scan.type                = LidarSampler
sampling0121.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0121.inflow-scan.length              = 996.0
sampling0121.inflow-scan.origin              = 6120.0 4340.0 120.0  # Lidar situated 3.0 m above hub height
sampling0121.inflow-scan.periodic            = true
sampling0121.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0121.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0121.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (6120.0 m, 4980.0 m, 0.0 m) -------------
sampling0122.output_frequency                = 1
sampling0122.fields                          = velocity temperature tke
sampling0122.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0122.inflow-bc-3D.type               = PlaneSampler
sampling0122.inflow-bc-3D.num_points         = 64 64
sampling0122.inflow-bc-3D.origin             = 5740.0 4660.0 0.0
sampling0122.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0122.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0122.inflow-scan.type                = LidarSampler
sampling0122.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0122.inflow-scan.length              = 996.0
sampling0122.inflow-scan.origin              = 6120.0 4980.0 120.0  # Lidar situated 3.0 m above hub height
sampling0122.inflow-scan.periodic            = true
sampling0122.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0122.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0122.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (6120.0 m, 5620.0 m, 0.0 m) -------------
sampling0123.output_frequency                = 1
sampling0123.fields                          = velocity temperature tke
sampling0123.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0123.inflow-bc-3D.type               = PlaneSampler
sampling0123.inflow-bc-3D.num_points         = 64 64
sampling0123.inflow-bc-3D.origin             = 5740.0 5300.0 0.0
sampling0123.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0123.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0123.inflow-scan.type                = LidarSampler
sampling0123.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0123.inflow-scan.length              = 996.0
sampling0123.inflow-scan.origin              = 6120.0 5620.0 120.0  # Lidar situated 3.0 m above hub height
sampling0123.inflow-scan.periodic            = true
sampling0123.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0123.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0123.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (6120.0 m, 6260.0 m, 0.0 m) -------------
sampling0124.output_frequency                = 1
sampling0124.fields                          = velocity temperature tke
sampling0124.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0124.inflow-bc-3D.type               = PlaneSampler
sampling0124.inflow-bc-3D.num_points         = 64 64
sampling0124.inflow-bc-3D.origin             = 5740.0 5940.0 0.0
sampling0124.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0124.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0124.inflow-scan.type                = LidarSampler
sampling0124.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0124.inflow-scan.length              = 996.0
sampling0124.inflow-scan.origin              = 6120.0 6260.0 120.0  # Lidar situated 3.0 m above hub height
sampling0124.inflow-scan.periodic            = true
sampling0124.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0124.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0124.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (6120.0 m, 6900.0 m, 0.0 m) -------------
sampling0125.output_frequency                = 1
sampling0125.fields                          = velocity temperature tke
sampling0125.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0125.inflow-bc-3D.type               = PlaneSampler
sampling0125.inflow-bc-3D.num_points         = 64 64
sampling0125.inflow-bc-3D.origin             = 5740.0 6580.0 0.0
sampling0125.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0125.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0125.inflow-scan.type                = LidarSampler
sampling0125.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0125.inflow-scan.length              = 996.0
sampling0125.inflow-scan.origin              = 6120.0 6900.0 120.0  # Lidar situated 3.0 m above hub height
sampling0125.inflow-scan.periodic            = true
sampling0125.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0125.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0125.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (6120.0 m, 7540.0 m, 0.0 m) -------------
sampling0126.output_frequency                = 1
sampling0126.fields                          = velocity temperature tke
sampling0126.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0126.inflow-bc-3D.type               = PlaneSampler
sampling0126.inflow-bc-3D.num_points         = 64 64
sampling0126.inflow-bc-3D.origin             = 5740.0 7220.0 0.0
sampling0126.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0126.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0126.inflow-scan.type                = LidarSampler
sampling0126.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0126.inflow-scan.length              = 996.0
sampling0126.inflow-scan.origin              = 6120.0 7540.0 120.0  # Lidar situated 3.0 m above hub height
sampling0126.inflow-scan.periodic            = true
sampling0126.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0126.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0126.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (6120.0 m, 8180.0 m, 0.0 m) -------------
sampling0127.output_frequency                = 1
sampling0127.fields                          = velocity temperature tke
sampling0127.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0127.inflow-bc-3D.type               = PlaneSampler
sampling0127.inflow-bc-3D.num_points         = 64 64
sampling0127.inflow-bc-3D.origin             = 5740.0 7860.0 0.0
sampling0127.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0127.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0127.inflow-scan.type                = LidarSampler
sampling0127.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0127.inflow-scan.length              = 996.0
sampling0127.inflow-scan.origin              = 6120.0 8180.0 120.0  # Lidar situated 3.0 m above hub height
sampling0127.inflow-scan.periodic            = true
sampling0127.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0127.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0127.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (6120.0 m, 8820.0 m, 0.0 m) -------------
sampling0128.output_frequency                = 1
sampling0128.fields                          = velocity temperature tke
sampling0128.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0128.inflow-bc-3D.type               = PlaneSampler
sampling0128.inflow-bc-3D.num_points         = 64 64
sampling0128.inflow-bc-3D.origin             = 5740.0 8500.0 0.0
sampling0128.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0128.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0128.inflow-scan.type                = LidarSampler
sampling0128.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0128.inflow-scan.length              = 996.0
sampling0128.inflow-scan.origin              = 6120.0 8820.0 120.0  # Lidar situated 3.0 m above hub height
sampling0128.inflow-scan.periodic            = true
sampling0128.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0128.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0128.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (6120.0 m, 9460.0 m, 0.0 m) -------------
sampling0129.output_frequency                = 1
sampling0129.fields                          = velocity temperature tke
sampling0129.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0129.inflow-bc-3D.type               = PlaneSampler
sampling0129.inflow-bc-3D.num_points         = 64 64
sampling0129.inflow-bc-3D.origin             = 5740.0 9140.0 0.0
sampling0129.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0129.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0129.inflow-scan.type                = LidarSampler
sampling0129.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0129.inflow-scan.length              = 996.0
sampling0129.inflow-scan.origin              = 6120.0 9460.0 120.0  # Lidar situated 3.0 m above hub height
sampling0129.inflow-scan.periodic            = true
sampling0129.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0129.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0129.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (6120.0 m, 10100.0 m, 0.0 m) -------------
sampling0130.output_frequency                = 1
sampling0130.fields                          = velocity temperature tke
sampling0130.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0130.inflow-bc-3D.type               = PlaneSampler
sampling0130.inflow-bc-3D.num_points         = 64 64
sampling0130.inflow-bc-3D.origin             = 5740.0 9780.0 0.0
sampling0130.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0130.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0130.inflow-scan.type                = LidarSampler
sampling0130.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0130.inflow-scan.length              = 996.0
sampling0130.inflow-scan.origin              = 6120.0 10100.0 120.0  # Lidar situated 3.0 m above hub height
sampling0130.inflow-scan.periodic            = true
sampling0130.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0130.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0130.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (6120.0 m, 10740.0 m, 0.0 m) -------------
sampling0131.output_frequency                = 1
sampling0131.fields                          = velocity temperature tke
sampling0131.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0131.inflow-bc-3D.type               = PlaneSampler
sampling0131.inflow-bc-3D.num_points         = 64 64
sampling0131.inflow-bc-3D.origin             = 5740.0 10420.0 0.0
sampling0131.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0131.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0131.inflow-scan.type                = LidarSampler
sampling0131.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0131.inflow-scan.length              = 996.0
sampling0131.inflow-scan.origin              = 6120.0 10740.0 120.0  # Lidar situated 3.0 m above hub height
sampling0131.inflow-scan.periodic            = true
sampling0131.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0131.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0131.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (6120.0 m, 11380.0 m, 0.0 m) -------------
sampling0132.output_frequency                = 1
sampling0132.fields                          = velocity temperature tke
sampling0132.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0132.inflow-bc-3D.type               = PlaneSampler
sampling0132.inflow-bc-3D.num_points         = 64 64
sampling0132.inflow-bc-3D.origin             = 5740.0 11060.0 0.0
sampling0132.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0132.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0132.inflow-scan.type                = LidarSampler
sampling0132.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0132.inflow-scan.length              = 996.0
sampling0132.inflow-scan.origin              = 6120.0 11380.0 120.0  # Lidar situated 3.0 m above hub height
sampling0132.inflow-scan.periodic            = true
sampling0132.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0132.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0132.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (6120.0 m, 12020.0 m, 0.0 m) -------------
sampling0133.output_frequency                = 1
sampling0133.fields                          = velocity temperature tke
sampling0133.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0133.inflow-bc-3D.type               = PlaneSampler
sampling0133.inflow-bc-3D.num_points         = 64 64
sampling0133.inflow-bc-3D.origin             = 5740.0 11700.0 0.0
sampling0133.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0133.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0133.inflow-scan.type                = LidarSampler
sampling0133.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0133.inflow-scan.length              = 996.0
sampling0133.inflow-scan.origin              = 6120.0 12020.0 120.0  # Lidar situated 3.0 m above hub height
sampling0133.inflow-scan.periodic            = true
sampling0133.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0133.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0133.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (6120.0 m, 12660.0 m, 0.0 m) -------------
sampling0134.output_frequency                = 1
sampling0134.fields                          = velocity temperature tke
sampling0134.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0134.inflow-bc-3D.type               = PlaneSampler
sampling0134.inflow-bc-3D.num_points         = 64 64
sampling0134.inflow-bc-3D.origin             = 5740.0 12340.0 0.0
sampling0134.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0134.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0134.inflow-scan.type                = LidarSampler
sampling0134.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0134.inflow-scan.length              = 996.0
sampling0134.inflow-scan.origin              = 6120.0 12660.0 120.0  # Lidar situated 3.0 m above hub height
sampling0134.inflow-scan.periodic            = true
sampling0134.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0134.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0134.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (6120.0 m, 13300.0 m, 0.0 m) -------------
sampling0135.output_frequency                = 1
sampling0135.fields                          = velocity temperature tke
sampling0135.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0135.inflow-bc-3D.type               = PlaneSampler
sampling0135.inflow-bc-3D.num_points         = 64 64
sampling0135.inflow-bc-3D.origin             = 5740.0 12980.0 0.0
sampling0135.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0135.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0135.inflow-scan.type                = LidarSampler
sampling0135.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0135.inflow-scan.length              = 996.0
sampling0135.inflow-scan.origin              = 6120.0 13300.0 120.0  # Lidar situated 3.0 m above hub height
sampling0135.inflow-scan.periodic            = true
sampling0135.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0135.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0135.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (6120.0 m, 13940.0 m, 0.0 m) -------------
sampling0136.output_frequency                = 1
sampling0136.fields                          = velocity temperature tke
sampling0136.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0136.inflow-bc-3D.type               = PlaneSampler
sampling0136.inflow-bc-3D.num_points         = 64 64
sampling0136.inflow-bc-3D.origin             = 5740.0 13620.0 0.0
sampling0136.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0136.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0136.inflow-scan.type                = LidarSampler
sampling0136.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0136.inflow-scan.length              = 996.0
sampling0136.inflow-scan.origin              = 6120.0 13940.0 120.0  # Lidar situated 3.0 m above hub height
sampling0136.inflow-scan.periodic            = true
sampling0136.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0136.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0136.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (6120.0 m, 14580.0 m, 0.0 m) -------------
sampling0137.output_frequency                = 1
sampling0137.fields                          = velocity temperature tke
sampling0137.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0137.inflow-bc-3D.type               = PlaneSampler
sampling0137.inflow-bc-3D.num_points         = 64 64
sampling0137.inflow-bc-3D.origin             = 5740.0 14260.0 0.0
sampling0137.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0137.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0137.inflow-scan.type                = LidarSampler
sampling0137.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0137.inflow-scan.length              = 996.0
sampling0137.inflow-scan.origin              = 6120.0 14580.0 120.0  # Lidar situated 3.0 m above hub height
sampling0137.inflow-scan.periodic            = true
sampling0137.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0137.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0137.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (7120.0 m, 660.0 m, 0.0 m) -------------
sampling0138.output_frequency                = 1
sampling0138.fields                          = velocity temperature tke
sampling0138.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0138.inflow-bc-3D.type               = PlaneSampler
sampling0138.inflow-bc-3D.num_points         = 64 64
sampling0138.inflow-bc-3D.origin             = 6740.0 340.0 0.0
sampling0138.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0138.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0138.inflow-scan.type                = LidarSampler
sampling0138.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0138.inflow-scan.length              = 996.0
sampling0138.inflow-scan.origin              = 7120.0 660.0 120.0  # Lidar situated 3.0 m above hub height
sampling0138.inflow-scan.periodic            = true
sampling0138.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0138.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0138.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (7120.0 m, 1300.0 m, 0.0 m) -------------
sampling0139.output_frequency                = 1
sampling0139.fields                          = velocity temperature tke
sampling0139.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0139.inflow-bc-3D.type               = PlaneSampler
sampling0139.inflow-bc-3D.num_points         = 64 64
sampling0139.inflow-bc-3D.origin             = 6740.0 980.0 0.0
sampling0139.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0139.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0139.inflow-scan.type                = LidarSampler
sampling0139.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0139.inflow-scan.length              = 996.0
sampling0139.inflow-scan.origin              = 7120.0 1300.0 120.0  # Lidar situated 3.0 m above hub height
sampling0139.inflow-scan.periodic            = true
sampling0139.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0139.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0139.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (7120.0 m, 1940.0 m, 0.0 m) -------------
sampling0140.output_frequency                = 1
sampling0140.fields                          = velocity temperature tke
sampling0140.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0140.inflow-bc-3D.type               = PlaneSampler
sampling0140.inflow-bc-3D.num_points         = 64 64
sampling0140.inflow-bc-3D.origin             = 6740.0 1620.0 0.0
sampling0140.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0140.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0140.inflow-scan.type                = LidarSampler
sampling0140.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0140.inflow-scan.length              = 996.0
sampling0140.inflow-scan.origin              = 7120.0 1940.0 120.0  # Lidar situated 3.0 m above hub height
sampling0140.inflow-scan.periodic            = true
sampling0140.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0140.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0140.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (7120.0 m, 2580.0 m, 0.0 m) -------------
sampling0141.output_frequency                = 1
sampling0141.fields                          = velocity temperature tke
sampling0141.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0141.inflow-bc-3D.type               = PlaneSampler
sampling0141.inflow-bc-3D.num_points         = 64 64
sampling0141.inflow-bc-3D.origin             = 6740.0 2260.0 0.0
sampling0141.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0141.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0141.inflow-scan.type                = LidarSampler
sampling0141.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0141.inflow-scan.length              = 996.0
sampling0141.inflow-scan.origin              = 7120.0 2580.0 120.0  # Lidar situated 3.0 m above hub height
sampling0141.inflow-scan.periodic            = true
sampling0141.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0141.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0141.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (7120.0 m, 3220.0 m, 0.0 m) -------------
sampling0142.output_frequency                = 1
sampling0142.fields                          = velocity temperature tke
sampling0142.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0142.inflow-bc-3D.type               = PlaneSampler
sampling0142.inflow-bc-3D.num_points         = 64 64
sampling0142.inflow-bc-3D.origin             = 6740.0 2900.0 0.0
sampling0142.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0142.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0142.inflow-scan.type                = LidarSampler
sampling0142.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0142.inflow-scan.length              = 996.0
sampling0142.inflow-scan.origin              = 7120.0 3220.0 120.0  # Lidar situated 3.0 m above hub height
sampling0142.inflow-scan.periodic            = true
sampling0142.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0142.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0142.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (7120.0 m, 3860.0 m, 0.0 m) -------------
sampling0143.output_frequency                = 1
sampling0143.fields                          = velocity temperature tke
sampling0143.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0143.inflow-bc-3D.type               = PlaneSampler
sampling0143.inflow-bc-3D.num_points         = 64 64
sampling0143.inflow-bc-3D.origin             = 6740.0 3540.0 0.0
sampling0143.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0143.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0143.inflow-scan.type                = LidarSampler
sampling0143.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0143.inflow-scan.length              = 996.0
sampling0143.inflow-scan.origin              = 7120.0 3860.0 120.0  # Lidar situated 3.0 m above hub height
sampling0143.inflow-scan.periodic            = true
sampling0143.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0143.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0143.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (7120.0 m, 4500.0 m, 0.0 m) -------------
sampling0144.output_frequency                = 1
sampling0144.fields                          = velocity temperature tke
sampling0144.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0144.inflow-bc-3D.type               = PlaneSampler
sampling0144.inflow-bc-3D.num_points         = 64 64
sampling0144.inflow-bc-3D.origin             = 6740.0 4180.0 0.0
sampling0144.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0144.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0144.inflow-scan.type                = LidarSampler
sampling0144.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0144.inflow-scan.length              = 996.0
sampling0144.inflow-scan.origin              = 7120.0 4500.0 120.0  # Lidar situated 3.0 m above hub height
sampling0144.inflow-scan.periodic            = true
sampling0144.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0144.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0144.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (7120.0 m, 5140.0 m, 0.0 m) -------------
sampling0145.output_frequency                = 1
sampling0145.fields                          = velocity temperature tke
sampling0145.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0145.inflow-bc-3D.type               = PlaneSampler
sampling0145.inflow-bc-3D.num_points         = 64 64
sampling0145.inflow-bc-3D.origin             = 6740.0 4820.0 0.0
sampling0145.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0145.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0145.inflow-scan.type                = LidarSampler
sampling0145.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0145.inflow-scan.length              = 996.0
sampling0145.inflow-scan.origin              = 7120.0 5140.0 120.0  # Lidar situated 3.0 m above hub height
sampling0145.inflow-scan.periodic            = true
sampling0145.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0145.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0145.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (7120.0 m, 5780.0 m, 0.0 m) -------------
sampling0146.output_frequency                = 1
sampling0146.fields                          = velocity temperature tke
sampling0146.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0146.inflow-bc-3D.type               = PlaneSampler
sampling0146.inflow-bc-3D.num_points         = 64 64
sampling0146.inflow-bc-3D.origin             = 6740.0 5460.0 0.0
sampling0146.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0146.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0146.inflow-scan.type                = LidarSampler
sampling0146.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0146.inflow-scan.length              = 996.0
sampling0146.inflow-scan.origin              = 7120.0 5780.0 120.0  # Lidar situated 3.0 m above hub height
sampling0146.inflow-scan.periodic            = true
sampling0146.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0146.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0146.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (7120.0 m, 6420.0 m, 0.0 m) -------------
sampling0147.output_frequency                = 1
sampling0147.fields                          = velocity temperature tke
sampling0147.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0147.inflow-bc-3D.type               = PlaneSampler
sampling0147.inflow-bc-3D.num_points         = 64 64
sampling0147.inflow-bc-3D.origin             = 6740.0 6100.0 0.0
sampling0147.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0147.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0147.inflow-scan.type                = LidarSampler
sampling0147.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0147.inflow-scan.length              = 996.0
sampling0147.inflow-scan.origin              = 7120.0 6420.0 120.0  # Lidar situated 3.0 m above hub height
sampling0147.inflow-scan.periodic            = true
sampling0147.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0147.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0147.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (7120.0 m, 7060.0 m, 0.0 m) -------------
sampling0148.output_frequency                = 1
sampling0148.fields                          = velocity temperature tke
sampling0148.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0148.inflow-bc-3D.type               = PlaneSampler
sampling0148.inflow-bc-3D.num_points         = 64 64
sampling0148.inflow-bc-3D.origin             = 6740.0 6740.0 0.0
sampling0148.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0148.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0148.inflow-scan.type                = LidarSampler
sampling0148.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0148.inflow-scan.length              = 996.0
sampling0148.inflow-scan.origin              = 7120.0 7060.0 120.0  # Lidar situated 3.0 m above hub height
sampling0148.inflow-scan.periodic            = true
sampling0148.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0148.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0148.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (7120.0 m, 7700.0 m, 0.0 m) -------------
sampling0149.output_frequency                = 1
sampling0149.fields                          = velocity temperature tke
sampling0149.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0149.inflow-bc-3D.type               = PlaneSampler
sampling0149.inflow-bc-3D.num_points         = 64 64
sampling0149.inflow-bc-3D.origin             = 6740.0 7380.0 0.0
sampling0149.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0149.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0149.inflow-scan.type                = LidarSampler
sampling0149.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0149.inflow-scan.length              = 996.0
sampling0149.inflow-scan.origin              = 7120.0 7700.0 120.0  # Lidar situated 3.0 m above hub height
sampling0149.inflow-scan.periodic            = true
sampling0149.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0149.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0149.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (7120.0 m, 8340.0 m, 0.0 m) -------------
sampling0150.output_frequency                = 1
sampling0150.fields                          = velocity temperature tke
sampling0150.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0150.inflow-bc-3D.type               = PlaneSampler
sampling0150.inflow-bc-3D.num_points         = 64 64
sampling0150.inflow-bc-3D.origin             = 6740.0 8020.0 0.0
sampling0150.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0150.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0150.inflow-scan.type                = LidarSampler
sampling0150.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0150.inflow-scan.length              = 996.0
sampling0150.inflow-scan.origin              = 7120.0 8340.0 120.0  # Lidar situated 3.0 m above hub height
sampling0150.inflow-scan.periodic            = true
sampling0150.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0150.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0150.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (7120.0 m, 8980.0 m, 0.0 m) -------------
sampling0151.output_frequency                = 1
sampling0151.fields                          = velocity temperature tke
sampling0151.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0151.inflow-bc-3D.type               = PlaneSampler
sampling0151.inflow-bc-3D.num_points         = 64 64
sampling0151.inflow-bc-3D.origin             = 6740.0 8660.0 0.0
sampling0151.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0151.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0151.inflow-scan.type                = LidarSampler
sampling0151.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0151.inflow-scan.length              = 996.0
sampling0151.inflow-scan.origin              = 7120.0 8980.0 120.0  # Lidar situated 3.0 m above hub height
sampling0151.inflow-scan.periodic            = true
sampling0151.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0151.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0151.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (7120.0 m, 9620.0 m, 0.0 m) -------------
sampling0152.output_frequency                = 1
sampling0152.fields                          = velocity temperature tke
sampling0152.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0152.inflow-bc-3D.type               = PlaneSampler
sampling0152.inflow-bc-3D.num_points         = 64 64
sampling0152.inflow-bc-3D.origin             = 6740.0 9300.0 0.0
sampling0152.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0152.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0152.inflow-scan.type                = LidarSampler
sampling0152.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0152.inflow-scan.length              = 996.0
sampling0152.inflow-scan.origin              = 7120.0 9620.0 120.0  # Lidar situated 3.0 m above hub height
sampling0152.inflow-scan.periodic            = true
sampling0152.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0152.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0152.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (7120.0 m, 10260.0 m, 0.0 m) -------------
sampling0153.output_frequency                = 1
sampling0153.fields                          = velocity temperature tke
sampling0153.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0153.inflow-bc-3D.type               = PlaneSampler
sampling0153.inflow-bc-3D.num_points         = 64 64
sampling0153.inflow-bc-3D.origin             = 6740.0 9940.0 0.0
sampling0153.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0153.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0153.inflow-scan.type                = LidarSampler
sampling0153.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0153.inflow-scan.length              = 996.0
sampling0153.inflow-scan.origin              = 7120.0 10260.0 120.0  # Lidar situated 3.0 m above hub height
sampling0153.inflow-scan.periodic            = true
sampling0153.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0153.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0153.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (7120.0 m, 10900.0 m, 0.0 m) -------------
sampling0154.output_frequency                = 1
sampling0154.fields                          = velocity temperature tke
sampling0154.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0154.inflow-bc-3D.type               = PlaneSampler
sampling0154.inflow-bc-3D.num_points         = 64 64
sampling0154.inflow-bc-3D.origin             = 6740.0 10580.0 0.0
sampling0154.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0154.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0154.inflow-scan.type                = LidarSampler
sampling0154.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0154.inflow-scan.length              = 996.0
sampling0154.inflow-scan.origin              = 7120.0 10900.0 120.0  # Lidar situated 3.0 m above hub height
sampling0154.inflow-scan.periodic            = true
sampling0154.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0154.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0154.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (7120.0 m, 11540.0 m, 0.0 m) -------------
sampling0155.output_frequency                = 1
sampling0155.fields                          = velocity temperature tke
sampling0155.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0155.inflow-bc-3D.type               = PlaneSampler
sampling0155.inflow-bc-3D.num_points         = 64 64
sampling0155.inflow-bc-3D.origin             = 6740.0 11220.0 0.0
sampling0155.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0155.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0155.inflow-scan.type                = LidarSampler
sampling0155.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0155.inflow-scan.length              = 996.0
sampling0155.inflow-scan.origin              = 7120.0 11540.0 120.0  # Lidar situated 3.0 m above hub height
sampling0155.inflow-scan.periodic            = true
sampling0155.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0155.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0155.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (7120.0 m, 12180.0 m, 0.0 m) -------------
sampling0156.output_frequency                = 1
sampling0156.fields                          = velocity temperature tke
sampling0156.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0156.inflow-bc-3D.type               = PlaneSampler
sampling0156.inflow-bc-3D.num_points         = 64 64
sampling0156.inflow-bc-3D.origin             = 6740.0 11860.0 0.0
sampling0156.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0156.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0156.inflow-scan.type                = LidarSampler
sampling0156.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0156.inflow-scan.length              = 996.0
sampling0156.inflow-scan.origin              = 7120.0 12180.0 120.0  # Lidar situated 3.0 m above hub height
sampling0156.inflow-scan.periodic            = true
sampling0156.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0156.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0156.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (7120.0 m, 12820.0 m, 0.0 m) -------------
sampling0157.output_frequency                = 1
sampling0157.fields                          = velocity temperature tke
sampling0157.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0157.inflow-bc-3D.type               = PlaneSampler
sampling0157.inflow-bc-3D.num_points         = 64 64
sampling0157.inflow-bc-3D.origin             = 6740.0 12500.0 0.0
sampling0157.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0157.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0157.inflow-scan.type                = LidarSampler
sampling0157.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0157.inflow-scan.length              = 996.0
sampling0157.inflow-scan.origin              = 7120.0 12820.0 120.0  # Lidar situated 3.0 m above hub height
sampling0157.inflow-scan.periodic            = true
sampling0157.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0157.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0157.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (7120.0 m, 13460.0 m, 0.0 m) -------------
sampling0158.output_frequency                = 1
sampling0158.fields                          = velocity temperature tke
sampling0158.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0158.inflow-bc-3D.type               = PlaneSampler
sampling0158.inflow-bc-3D.num_points         = 64 64
sampling0158.inflow-bc-3D.origin             = 6740.0 13140.0 0.0
sampling0158.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0158.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0158.inflow-scan.type                = LidarSampler
sampling0158.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0158.inflow-scan.length              = 996.0
sampling0158.inflow-scan.origin              = 7120.0 13460.0 120.0  # Lidar situated 3.0 m above hub height
sampling0158.inflow-scan.periodic            = true
sampling0158.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0158.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0158.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (7120.0 m, 14100.0 m, 0.0 m) -------------
sampling0159.output_frequency                = 1
sampling0159.fields                          = velocity temperature tke
sampling0159.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0159.inflow-bc-3D.type               = PlaneSampler
sampling0159.inflow-bc-3D.num_points         = 64 64
sampling0159.inflow-bc-3D.origin             = 6740.0 13780.0 0.0
sampling0159.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0159.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0159.inflow-scan.type                = LidarSampler
sampling0159.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0159.inflow-scan.length              = 996.0
sampling0159.inflow-scan.origin              = 7120.0 14100.0 120.0  # Lidar situated 3.0 m above hub height
sampling0159.inflow-scan.periodic            = true
sampling0159.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0159.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0159.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (7120.0 m, 14740.0 m, 0.0 m) -------------
sampling0160.output_frequency                = 1
sampling0160.fields                          = velocity temperature tke
sampling0160.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0160.inflow-bc-3D.type               = PlaneSampler
sampling0160.inflow-bc-3D.num_points         = 64 64
sampling0160.inflow-bc-3D.origin             = 6740.0 14420.0 0.0
sampling0160.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0160.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0160.inflow-scan.type                = LidarSampler
sampling0160.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0160.inflow-scan.length              = 996.0
sampling0160.inflow-scan.origin              = 7120.0 14740.0 120.0  # Lidar situated 3.0 m above hub height
sampling0160.inflow-scan.periodic            = true
sampling0160.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0160.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0160.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (8120.0 m, 820.0 m, 0.0 m) -------------
sampling0161.output_frequency                = 1
sampling0161.fields                          = velocity temperature tke
sampling0161.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0161.inflow-bc-3D.type               = PlaneSampler
sampling0161.inflow-bc-3D.num_points         = 64 64
sampling0161.inflow-bc-3D.origin             = 7740.0 500.0 0.0
sampling0161.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0161.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0161.inflow-scan.type                = LidarSampler
sampling0161.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0161.inflow-scan.length              = 996.0
sampling0161.inflow-scan.origin              = 8120.0 820.0 120.0  # Lidar situated 3.0 m above hub height
sampling0161.inflow-scan.periodic            = true
sampling0161.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0161.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0161.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (8120.0 m, 1460.0 m, 0.0 m) -------------
sampling0162.output_frequency                = 1
sampling0162.fields                          = velocity temperature tke
sampling0162.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0162.inflow-bc-3D.type               = PlaneSampler
sampling0162.inflow-bc-3D.num_points         = 64 64
sampling0162.inflow-bc-3D.origin             = 7740.0 1140.0 0.0
sampling0162.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0162.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0162.inflow-scan.type                = LidarSampler
sampling0162.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0162.inflow-scan.length              = 996.0
sampling0162.inflow-scan.origin              = 8120.0 1460.0 120.0  # Lidar situated 3.0 m above hub height
sampling0162.inflow-scan.periodic            = true
sampling0162.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0162.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0162.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (8120.0 m, 2100.0 m, 0.0 m) -------------
sampling0163.output_frequency                = 1
sampling0163.fields                          = velocity temperature tke
sampling0163.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0163.inflow-bc-3D.type               = PlaneSampler
sampling0163.inflow-bc-3D.num_points         = 64 64
sampling0163.inflow-bc-3D.origin             = 7740.0 1780.0 0.0
sampling0163.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0163.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0163.inflow-scan.type                = LidarSampler
sampling0163.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0163.inflow-scan.length              = 996.0
sampling0163.inflow-scan.origin              = 8120.0 2100.0 120.0  # Lidar situated 3.0 m above hub height
sampling0163.inflow-scan.periodic            = true
sampling0163.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0163.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0163.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (8120.0 m, 2740.0 m, 0.0 m) -------------
sampling0164.output_frequency                = 1
sampling0164.fields                          = velocity temperature tke
sampling0164.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0164.inflow-bc-3D.type               = PlaneSampler
sampling0164.inflow-bc-3D.num_points         = 64 64
sampling0164.inflow-bc-3D.origin             = 7740.0 2420.0 0.0
sampling0164.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0164.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0164.inflow-scan.type                = LidarSampler
sampling0164.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0164.inflow-scan.length              = 996.0
sampling0164.inflow-scan.origin              = 8120.0 2740.0 120.0  # Lidar situated 3.0 m above hub height
sampling0164.inflow-scan.periodic            = true
sampling0164.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0164.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0164.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (8120.0 m, 3380.0 m, 0.0 m) -------------
sampling0165.output_frequency                = 1
sampling0165.fields                          = velocity temperature tke
sampling0165.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0165.inflow-bc-3D.type               = PlaneSampler
sampling0165.inflow-bc-3D.num_points         = 64 64
sampling0165.inflow-bc-3D.origin             = 7740.0 3060.0 0.0
sampling0165.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0165.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0165.inflow-scan.type                = LidarSampler
sampling0165.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0165.inflow-scan.length              = 996.0
sampling0165.inflow-scan.origin              = 8120.0 3380.0 120.0  # Lidar situated 3.0 m above hub height
sampling0165.inflow-scan.periodic            = true
sampling0165.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0165.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0165.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (8120.0 m, 4020.0 m, 0.0 m) -------------
sampling0166.output_frequency                = 1
sampling0166.fields                          = velocity temperature tke
sampling0166.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0166.inflow-bc-3D.type               = PlaneSampler
sampling0166.inflow-bc-3D.num_points         = 64 64
sampling0166.inflow-bc-3D.origin             = 7740.0 3700.0 0.0
sampling0166.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0166.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0166.inflow-scan.type                = LidarSampler
sampling0166.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0166.inflow-scan.length              = 996.0
sampling0166.inflow-scan.origin              = 8120.0 4020.0 120.0  # Lidar situated 3.0 m above hub height
sampling0166.inflow-scan.periodic            = true
sampling0166.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0166.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0166.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (8120.0 m, 4660.0 m, 0.0 m) -------------
sampling0167.output_frequency                = 1
sampling0167.fields                          = velocity temperature tke
sampling0167.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0167.inflow-bc-3D.type               = PlaneSampler
sampling0167.inflow-bc-3D.num_points         = 64 64
sampling0167.inflow-bc-3D.origin             = 7740.0 4340.0 0.0
sampling0167.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0167.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0167.inflow-scan.type                = LidarSampler
sampling0167.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0167.inflow-scan.length              = 996.0
sampling0167.inflow-scan.origin              = 8120.0 4660.0 120.0  # Lidar situated 3.0 m above hub height
sampling0167.inflow-scan.periodic            = true
sampling0167.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0167.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0167.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (8120.0 m, 5300.0 m, 0.0 m) -------------
sampling0168.output_frequency                = 1
sampling0168.fields                          = velocity temperature tke
sampling0168.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0168.inflow-bc-3D.type               = PlaneSampler
sampling0168.inflow-bc-3D.num_points         = 64 64
sampling0168.inflow-bc-3D.origin             = 7740.0 4980.0 0.0
sampling0168.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0168.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0168.inflow-scan.type                = LidarSampler
sampling0168.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0168.inflow-scan.length              = 996.0
sampling0168.inflow-scan.origin              = 8120.0 5300.0 120.0  # Lidar situated 3.0 m above hub height
sampling0168.inflow-scan.periodic            = true
sampling0168.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0168.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0168.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (8120.0 m, 5940.0 m, 0.0 m) -------------
sampling0169.output_frequency                = 1
sampling0169.fields                          = velocity temperature tke
sampling0169.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0169.inflow-bc-3D.type               = PlaneSampler
sampling0169.inflow-bc-3D.num_points         = 64 64
sampling0169.inflow-bc-3D.origin             = 7740.0 5620.0 0.0
sampling0169.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0169.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0169.inflow-scan.type                = LidarSampler
sampling0169.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0169.inflow-scan.length              = 996.0
sampling0169.inflow-scan.origin              = 8120.0 5940.0 120.0  # Lidar situated 3.0 m above hub height
sampling0169.inflow-scan.periodic            = true
sampling0169.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0169.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0169.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (8120.0 m, 6580.0 m, 0.0 m) -------------
sampling0170.output_frequency                = 1
sampling0170.fields                          = velocity temperature tke
sampling0170.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0170.inflow-bc-3D.type               = PlaneSampler
sampling0170.inflow-bc-3D.num_points         = 64 64
sampling0170.inflow-bc-3D.origin             = 7740.0 6260.0 0.0
sampling0170.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0170.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0170.inflow-scan.type                = LidarSampler
sampling0170.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0170.inflow-scan.length              = 996.0
sampling0170.inflow-scan.origin              = 8120.0 6580.0 120.0  # Lidar situated 3.0 m above hub height
sampling0170.inflow-scan.periodic            = true
sampling0170.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0170.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0170.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (8120.0 m, 7220.0 m, 0.0 m) -------------
sampling0171.output_frequency                = 1
sampling0171.fields                          = velocity temperature tke
sampling0171.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0171.inflow-bc-3D.type               = PlaneSampler
sampling0171.inflow-bc-3D.num_points         = 64 64
sampling0171.inflow-bc-3D.origin             = 7740.0 6900.0 0.0
sampling0171.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0171.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0171.inflow-scan.type                = LidarSampler
sampling0171.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0171.inflow-scan.length              = 996.0
sampling0171.inflow-scan.origin              = 8120.0 7220.0 120.0  # Lidar situated 3.0 m above hub height
sampling0171.inflow-scan.periodic            = true
sampling0171.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0171.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0171.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (8120.0 m, 7860.0 m, 0.0 m) -------------
sampling0172.output_frequency                = 1
sampling0172.fields                          = velocity temperature tke
sampling0172.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0172.inflow-bc-3D.type               = PlaneSampler
sampling0172.inflow-bc-3D.num_points         = 64 64
sampling0172.inflow-bc-3D.origin             = 7740.0 7540.0 0.0
sampling0172.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0172.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0172.inflow-scan.type                = LidarSampler
sampling0172.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0172.inflow-scan.length              = 996.0
sampling0172.inflow-scan.origin              = 8120.0 7860.0 120.0  # Lidar situated 3.0 m above hub height
sampling0172.inflow-scan.periodic            = true
sampling0172.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0172.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0172.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (8120.0 m, 8500.0 m, 0.0 m) -------------
sampling0173.output_frequency                = 1
sampling0173.fields                          = velocity temperature tke
sampling0173.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0173.inflow-bc-3D.type               = PlaneSampler
sampling0173.inflow-bc-3D.num_points         = 64 64
sampling0173.inflow-bc-3D.origin             = 7740.0 8180.0 0.0
sampling0173.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0173.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0173.inflow-scan.type                = LidarSampler
sampling0173.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0173.inflow-scan.length              = 996.0
sampling0173.inflow-scan.origin              = 8120.0 8500.0 120.0  # Lidar situated 3.0 m above hub height
sampling0173.inflow-scan.periodic            = true
sampling0173.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0173.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0173.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (8120.0 m, 9140.0 m, 0.0 m) -------------
sampling0174.output_frequency                = 1
sampling0174.fields                          = velocity temperature tke
sampling0174.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0174.inflow-bc-3D.type               = PlaneSampler
sampling0174.inflow-bc-3D.num_points         = 64 64
sampling0174.inflow-bc-3D.origin             = 7740.0 8820.0 0.0
sampling0174.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0174.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0174.inflow-scan.type                = LidarSampler
sampling0174.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0174.inflow-scan.length              = 996.0
sampling0174.inflow-scan.origin              = 8120.0 9140.0 120.0  # Lidar situated 3.0 m above hub height
sampling0174.inflow-scan.periodic            = true
sampling0174.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0174.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0174.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (8120.0 m, 9780.0 m, 0.0 m) -------------
sampling0175.output_frequency                = 1
sampling0175.fields                          = velocity temperature tke
sampling0175.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0175.inflow-bc-3D.type               = PlaneSampler
sampling0175.inflow-bc-3D.num_points         = 64 64
sampling0175.inflow-bc-3D.origin             = 7740.0 9460.0 0.0
sampling0175.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0175.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0175.inflow-scan.type                = LidarSampler
sampling0175.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0175.inflow-scan.length              = 996.0
sampling0175.inflow-scan.origin              = 8120.0 9780.0 120.0  # Lidar situated 3.0 m above hub height
sampling0175.inflow-scan.periodic            = true
sampling0175.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0175.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0175.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (8120.0 m, 10420.0 m, 0.0 m) -------------
sampling0176.output_frequency                = 1
sampling0176.fields                          = velocity temperature tke
sampling0176.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0176.inflow-bc-3D.type               = PlaneSampler
sampling0176.inflow-bc-3D.num_points         = 64 64
sampling0176.inflow-bc-3D.origin             = 7740.0 10100.0 0.0
sampling0176.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0176.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0176.inflow-scan.type                = LidarSampler
sampling0176.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0176.inflow-scan.length              = 996.0
sampling0176.inflow-scan.origin              = 8120.0 10420.0 120.0  # Lidar situated 3.0 m above hub height
sampling0176.inflow-scan.periodic            = true
sampling0176.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0176.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0176.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (8120.0 m, 11060.0 m, 0.0 m) -------------
sampling0177.output_frequency                = 1
sampling0177.fields                          = velocity temperature tke
sampling0177.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0177.inflow-bc-3D.type               = PlaneSampler
sampling0177.inflow-bc-3D.num_points         = 64 64
sampling0177.inflow-bc-3D.origin             = 7740.0 10740.0 0.0
sampling0177.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0177.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0177.inflow-scan.type                = LidarSampler
sampling0177.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0177.inflow-scan.length              = 996.0
sampling0177.inflow-scan.origin              = 8120.0 11060.0 120.0  # Lidar situated 3.0 m above hub height
sampling0177.inflow-scan.periodic            = true
sampling0177.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0177.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0177.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (8120.0 m, 11700.0 m, 0.0 m) -------------
sampling0178.output_frequency                = 1
sampling0178.fields                          = velocity temperature tke
sampling0178.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0178.inflow-bc-3D.type               = PlaneSampler
sampling0178.inflow-bc-3D.num_points         = 64 64
sampling0178.inflow-bc-3D.origin             = 7740.0 11380.0 0.0
sampling0178.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0178.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0178.inflow-scan.type                = LidarSampler
sampling0178.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0178.inflow-scan.length              = 996.0
sampling0178.inflow-scan.origin              = 8120.0 11700.0 120.0  # Lidar situated 3.0 m above hub height
sampling0178.inflow-scan.periodic            = true
sampling0178.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0178.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0178.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (8120.0 m, 12340.0 m, 0.0 m) -------------
sampling0179.output_frequency                = 1
sampling0179.fields                          = velocity temperature tke
sampling0179.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0179.inflow-bc-3D.type               = PlaneSampler
sampling0179.inflow-bc-3D.num_points         = 64 64
sampling0179.inflow-bc-3D.origin             = 7740.0 12020.0 0.0
sampling0179.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0179.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0179.inflow-scan.type                = LidarSampler
sampling0179.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0179.inflow-scan.length              = 996.0
sampling0179.inflow-scan.origin              = 8120.0 12340.0 120.0  # Lidar situated 3.0 m above hub height
sampling0179.inflow-scan.periodic            = true
sampling0179.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0179.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0179.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (8120.0 m, 12980.0 m, 0.0 m) -------------
sampling0180.output_frequency                = 1
sampling0180.fields                          = velocity temperature tke
sampling0180.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0180.inflow-bc-3D.type               = PlaneSampler
sampling0180.inflow-bc-3D.num_points         = 64 64
sampling0180.inflow-bc-3D.origin             = 7740.0 12660.0 0.0
sampling0180.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0180.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0180.inflow-scan.type                = LidarSampler
sampling0180.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0180.inflow-scan.length              = 996.0
sampling0180.inflow-scan.origin              = 8120.0 12980.0 120.0  # Lidar situated 3.0 m above hub height
sampling0180.inflow-scan.periodic            = true
sampling0180.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0180.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0180.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (8120.0 m, 13620.0 m, 0.0 m) -------------
sampling0181.output_frequency                = 1
sampling0181.fields                          = velocity temperature tke
sampling0181.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0181.inflow-bc-3D.type               = PlaneSampler
sampling0181.inflow-bc-3D.num_points         = 64 64
sampling0181.inflow-bc-3D.origin             = 7740.0 13300.0 0.0
sampling0181.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0181.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0181.inflow-scan.type                = LidarSampler
sampling0181.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0181.inflow-scan.length              = 996.0
sampling0181.inflow-scan.origin              = 8120.0 13620.0 120.0  # Lidar situated 3.0 m above hub height
sampling0181.inflow-scan.periodic            = true
sampling0181.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0181.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0181.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (8120.0 m, 14260.0 m, 0.0 m) -------------
sampling0182.output_frequency                = 1
sampling0182.fields                          = velocity temperature tke
sampling0182.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0182.inflow-bc-3D.type               = PlaneSampler
sampling0182.inflow-bc-3D.num_points         = 64 64
sampling0182.inflow-bc-3D.origin             = 7740.0 13940.0 0.0
sampling0182.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0182.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0182.inflow-scan.type                = LidarSampler
sampling0182.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0182.inflow-scan.length              = 996.0
sampling0182.inflow-scan.origin              = 8120.0 14260.0 120.0  # Lidar situated 3.0 m above hub height
sampling0182.inflow-scan.periodic            = true
sampling0182.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0182.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0182.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (8120.0 m, 14900.0 m, 0.0 m) -------------
sampling0183.output_frequency                = 1
sampling0183.fields                          = velocity temperature tke
sampling0183.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0183.inflow-bc-3D.type               = PlaneSampler
sampling0183.inflow-bc-3D.num_points         = 64 64
sampling0183.inflow-bc-3D.origin             = 7740.0 14580.0 0.0
sampling0183.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0183.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0183.inflow-scan.type                = LidarSampler
sampling0183.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0183.inflow-scan.length              = 996.0
sampling0183.inflow-scan.origin              = 8120.0 14900.0 120.0  # Lidar situated 3.0 m above hub height
sampling0183.inflow-scan.periodic            = true
sampling0183.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0183.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0183.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (9120.0 m, 340.0 m, 0.0 m) -------------
sampling0184.output_frequency                = 1
sampling0184.fields                          = velocity temperature tke
sampling0184.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0184.inflow-bc-3D.type               = PlaneSampler
sampling0184.inflow-bc-3D.num_points         = 64 64
sampling0184.inflow-bc-3D.origin             = 8740.0 20.0 0.0
sampling0184.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0184.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0184.inflow-scan.type                = LidarSampler
sampling0184.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0184.inflow-scan.length              = 996.0
sampling0184.inflow-scan.origin              = 9120.0 340.0 120.0  # Lidar situated 3.0 m above hub height
sampling0184.inflow-scan.periodic            = true
sampling0184.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0184.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0184.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (9120.0 m, 980.0 m, 0.0 m) -------------
sampling0185.output_frequency                = 1
sampling0185.fields                          = velocity temperature tke
sampling0185.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0185.inflow-bc-3D.type               = PlaneSampler
sampling0185.inflow-bc-3D.num_points         = 64 64
sampling0185.inflow-bc-3D.origin             = 8740.0 660.0 0.0
sampling0185.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0185.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0185.inflow-scan.type                = LidarSampler
sampling0185.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0185.inflow-scan.length              = 996.0
sampling0185.inflow-scan.origin              = 9120.0 980.0 120.0  # Lidar situated 3.0 m above hub height
sampling0185.inflow-scan.periodic            = true
sampling0185.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0185.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0185.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (9120.0 m, 1620.0 m, 0.0 m) -------------
sampling0186.output_frequency                = 1
sampling0186.fields                          = velocity temperature tke
sampling0186.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0186.inflow-bc-3D.type               = PlaneSampler
sampling0186.inflow-bc-3D.num_points         = 64 64
sampling0186.inflow-bc-3D.origin             = 8740.0 1300.0 0.0
sampling0186.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0186.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0186.inflow-scan.type                = LidarSampler
sampling0186.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0186.inflow-scan.length              = 996.0
sampling0186.inflow-scan.origin              = 9120.0 1620.0 120.0  # Lidar situated 3.0 m above hub height
sampling0186.inflow-scan.periodic            = true
sampling0186.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0186.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0186.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (9120.0 m, 2260.0 m, 0.0 m) -------------
sampling0187.output_frequency                = 1
sampling0187.fields                          = velocity temperature tke
sampling0187.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0187.inflow-bc-3D.type               = PlaneSampler
sampling0187.inflow-bc-3D.num_points         = 64 64
sampling0187.inflow-bc-3D.origin             = 8740.0 1940.0 0.0
sampling0187.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0187.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0187.inflow-scan.type                = LidarSampler
sampling0187.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0187.inflow-scan.length              = 996.0
sampling0187.inflow-scan.origin              = 9120.0 2260.0 120.0  # Lidar situated 3.0 m above hub height
sampling0187.inflow-scan.periodic            = true
sampling0187.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0187.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0187.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (9120.0 m, 2900.0 m, 0.0 m) -------------
sampling0188.output_frequency                = 1
sampling0188.fields                          = velocity temperature tke
sampling0188.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0188.inflow-bc-3D.type               = PlaneSampler
sampling0188.inflow-bc-3D.num_points         = 64 64
sampling0188.inflow-bc-3D.origin             = 8740.0 2580.0 0.0
sampling0188.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0188.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0188.inflow-scan.type                = LidarSampler
sampling0188.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0188.inflow-scan.length              = 996.0
sampling0188.inflow-scan.origin              = 9120.0 2900.0 120.0  # Lidar situated 3.0 m above hub height
sampling0188.inflow-scan.periodic            = true
sampling0188.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0188.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0188.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (9120.0 m, 3540.0 m, 0.0 m) -------------
sampling0189.output_frequency                = 1
sampling0189.fields                          = velocity temperature tke
sampling0189.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0189.inflow-bc-3D.type               = PlaneSampler
sampling0189.inflow-bc-3D.num_points         = 64 64
sampling0189.inflow-bc-3D.origin             = 8740.0 3220.0 0.0
sampling0189.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0189.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0189.inflow-scan.type                = LidarSampler
sampling0189.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0189.inflow-scan.length              = 996.0
sampling0189.inflow-scan.origin              = 9120.0 3540.0 120.0  # Lidar situated 3.0 m above hub height
sampling0189.inflow-scan.periodic            = true
sampling0189.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0189.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0189.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (9120.0 m, 4180.0 m, 0.0 m) -------------
sampling0190.output_frequency                = 1
sampling0190.fields                          = velocity temperature tke
sampling0190.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0190.inflow-bc-3D.type               = PlaneSampler
sampling0190.inflow-bc-3D.num_points         = 64 64
sampling0190.inflow-bc-3D.origin             = 8740.0 3860.0 0.0
sampling0190.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0190.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0190.inflow-scan.type                = LidarSampler
sampling0190.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0190.inflow-scan.length              = 996.0
sampling0190.inflow-scan.origin              = 9120.0 4180.0 120.0  # Lidar situated 3.0 m above hub height
sampling0190.inflow-scan.periodic            = true
sampling0190.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0190.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0190.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (9120.0 m, 4820.0 m, 0.0 m) -------------
sampling0191.output_frequency                = 1
sampling0191.fields                          = velocity temperature tke
sampling0191.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0191.inflow-bc-3D.type               = PlaneSampler
sampling0191.inflow-bc-3D.num_points         = 64 64
sampling0191.inflow-bc-3D.origin             = 8740.0 4500.0 0.0
sampling0191.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0191.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0191.inflow-scan.type                = LidarSampler
sampling0191.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0191.inflow-scan.length              = 996.0
sampling0191.inflow-scan.origin              = 9120.0 4820.0 120.0  # Lidar situated 3.0 m above hub height
sampling0191.inflow-scan.periodic            = true
sampling0191.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0191.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0191.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (9120.0 m, 5460.0 m, 0.0 m) -------------
sampling0192.output_frequency                = 1
sampling0192.fields                          = velocity temperature tke
sampling0192.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0192.inflow-bc-3D.type               = PlaneSampler
sampling0192.inflow-bc-3D.num_points         = 64 64
sampling0192.inflow-bc-3D.origin             = 8740.0 5140.0 0.0
sampling0192.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0192.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0192.inflow-scan.type                = LidarSampler
sampling0192.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0192.inflow-scan.length              = 996.0
sampling0192.inflow-scan.origin              = 9120.0 5460.0 120.0  # Lidar situated 3.0 m above hub height
sampling0192.inflow-scan.periodic            = true
sampling0192.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0192.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0192.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (9120.0 m, 6100.0 m, 0.0 m) -------------
sampling0193.output_frequency                = 1
sampling0193.fields                          = velocity temperature tke
sampling0193.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0193.inflow-bc-3D.type               = PlaneSampler
sampling0193.inflow-bc-3D.num_points         = 64 64
sampling0193.inflow-bc-3D.origin             = 8740.0 5780.0 0.0
sampling0193.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0193.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0193.inflow-scan.type                = LidarSampler
sampling0193.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0193.inflow-scan.length              = 996.0
sampling0193.inflow-scan.origin              = 9120.0 6100.0 120.0  # Lidar situated 3.0 m above hub height
sampling0193.inflow-scan.periodic            = true
sampling0193.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0193.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0193.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (9120.0 m, 6740.0 m, 0.0 m) -------------
sampling0194.output_frequency                = 1
sampling0194.fields                          = velocity temperature tke
sampling0194.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0194.inflow-bc-3D.type               = PlaneSampler
sampling0194.inflow-bc-3D.num_points         = 64 64
sampling0194.inflow-bc-3D.origin             = 8740.0 6420.0 0.0
sampling0194.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0194.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0194.inflow-scan.type                = LidarSampler
sampling0194.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0194.inflow-scan.length              = 996.0
sampling0194.inflow-scan.origin              = 9120.0 6740.0 120.0  # Lidar situated 3.0 m above hub height
sampling0194.inflow-scan.periodic            = true
sampling0194.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0194.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0194.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (9120.0 m, 7380.0 m, 0.0 m) -------------
sampling0195.output_frequency                = 1
sampling0195.fields                          = velocity temperature tke
sampling0195.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0195.inflow-bc-3D.type               = PlaneSampler
sampling0195.inflow-bc-3D.num_points         = 64 64
sampling0195.inflow-bc-3D.origin             = 8740.0 7060.0 0.0
sampling0195.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0195.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0195.inflow-scan.type                = LidarSampler
sampling0195.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0195.inflow-scan.length              = 996.0
sampling0195.inflow-scan.origin              = 9120.0 7380.0 120.0  # Lidar situated 3.0 m above hub height
sampling0195.inflow-scan.periodic            = true
sampling0195.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0195.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0195.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (9120.0 m, 8020.0 m, 0.0 m) -------------
sampling0196.output_frequency                = 1
sampling0196.fields                          = velocity temperature tke
sampling0196.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0196.inflow-bc-3D.type               = PlaneSampler
sampling0196.inflow-bc-3D.num_points         = 64 64
sampling0196.inflow-bc-3D.origin             = 8740.0 7700.0 0.0
sampling0196.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0196.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0196.inflow-scan.type                = LidarSampler
sampling0196.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0196.inflow-scan.length              = 996.0
sampling0196.inflow-scan.origin              = 9120.0 8020.0 120.0  # Lidar situated 3.0 m above hub height
sampling0196.inflow-scan.periodic            = true
sampling0196.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0196.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0196.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (9120.0 m, 8660.0 m, 0.0 m) -------------
sampling0197.output_frequency                = 1
sampling0197.fields                          = velocity temperature tke
sampling0197.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0197.inflow-bc-3D.type               = PlaneSampler
sampling0197.inflow-bc-3D.num_points         = 64 64
sampling0197.inflow-bc-3D.origin             = 8740.0 8340.0 0.0
sampling0197.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0197.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0197.inflow-scan.type                = LidarSampler
sampling0197.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0197.inflow-scan.length              = 996.0
sampling0197.inflow-scan.origin              = 9120.0 8660.0 120.0  # Lidar situated 3.0 m above hub height
sampling0197.inflow-scan.periodic            = true
sampling0197.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0197.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0197.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (9120.0 m, 9300.0 m, 0.0 m) -------------
sampling0198.output_frequency                = 1
sampling0198.fields                          = velocity temperature tke
sampling0198.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0198.inflow-bc-3D.type               = PlaneSampler
sampling0198.inflow-bc-3D.num_points         = 64 64
sampling0198.inflow-bc-3D.origin             = 8740.0 8980.0 0.0
sampling0198.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0198.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0198.inflow-scan.type                = LidarSampler
sampling0198.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0198.inflow-scan.length              = 996.0
sampling0198.inflow-scan.origin              = 9120.0 9300.0 120.0  # Lidar situated 3.0 m above hub height
sampling0198.inflow-scan.periodic            = true
sampling0198.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0198.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0198.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (9120.0 m, 9940.0 m, 0.0 m) -------------
sampling0199.output_frequency                = 1
sampling0199.fields                          = velocity temperature tke
sampling0199.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0199.inflow-bc-3D.type               = PlaneSampler
sampling0199.inflow-bc-3D.num_points         = 64 64
sampling0199.inflow-bc-3D.origin             = 8740.0 9620.0 0.0
sampling0199.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0199.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0199.inflow-scan.type                = LidarSampler
sampling0199.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0199.inflow-scan.length              = 996.0
sampling0199.inflow-scan.origin              = 9120.0 9940.0 120.0  # Lidar situated 3.0 m above hub height
sampling0199.inflow-scan.periodic            = true
sampling0199.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0199.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0199.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (9120.0 m, 10580.0 m, 0.0 m) -------------
sampling0200.output_frequency                = 1
sampling0200.fields                          = velocity temperature tke
sampling0200.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0200.inflow-bc-3D.type               = PlaneSampler
sampling0200.inflow-bc-3D.num_points         = 64 64
sampling0200.inflow-bc-3D.origin             = 8740.0 10260.0 0.0
sampling0200.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0200.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0200.inflow-scan.type                = LidarSampler
sampling0200.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0200.inflow-scan.length              = 996.0
sampling0200.inflow-scan.origin              = 9120.0 10580.0 120.0  # Lidar situated 3.0 m above hub height
sampling0200.inflow-scan.periodic            = true
sampling0200.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0200.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0200.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (9120.0 m, 11220.0 m, 0.0 m) -------------
sampling0201.output_frequency                = 1
sampling0201.fields                          = velocity temperature tke
sampling0201.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0201.inflow-bc-3D.type               = PlaneSampler
sampling0201.inflow-bc-3D.num_points         = 64 64
sampling0201.inflow-bc-3D.origin             = 8740.0 10900.0 0.0
sampling0201.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0201.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0201.inflow-scan.type                = LidarSampler
sampling0201.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0201.inflow-scan.length              = 996.0
sampling0201.inflow-scan.origin              = 9120.0 11220.0 120.0  # Lidar situated 3.0 m above hub height
sampling0201.inflow-scan.periodic            = true
sampling0201.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0201.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0201.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (9120.0 m, 11860.0 m, 0.0 m) -------------
sampling0202.output_frequency                = 1
sampling0202.fields                          = velocity temperature tke
sampling0202.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0202.inflow-bc-3D.type               = PlaneSampler
sampling0202.inflow-bc-3D.num_points         = 64 64
sampling0202.inflow-bc-3D.origin             = 8740.0 11540.0 0.0
sampling0202.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0202.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0202.inflow-scan.type                = LidarSampler
sampling0202.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0202.inflow-scan.length              = 996.0
sampling0202.inflow-scan.origin              = 9120.0 11860.0 120.0  # Lidar situated 3.0 m above hub height
sampling0202.inflow-scan.periodic            = true
sampling0202.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0202.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0202.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (9120.0 m, 12500.0 m, 0.0 m) -------------
sampling0203.output_frequency                = 1
sampling0203.fields                          = velocity temperature tke
sampling0203.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0203.inflow-bc-3D.type               = PlaneSampler
sampling0203.inflow-bc-3D.num_points         = 64 64
sampling0203.inflow-bc-3D.origin             = 8740.0 12180.0 0.0
sampling0203.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0203.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0203.inflow-scan.type                = LidarSampler
sampling0203.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0203.inflow-scan.length              = 996.0
sampling0203.inflow-scan.origin              = 9120.0 12500.0 120.0  # Lidar situated 3.0 m above hub height
sampling0203.inflow-scan.periodic            = true
sampling0203.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0203.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0203.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (9120.0 m, 13140.0 m, 0.0 m) -------------
sampling0204.output_frequency                = 1
sampling0204.fields                          = velocity temperature tke
sampling0204.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0204.inflow-bc-3D.type               = PlaneSampler
sampling0204.inflow-bc-3D.num_points         = 64 64
sampling0204.inflow-bc-3D.origin             = 8740.0 12820.0 0.0
sampling0204.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0204.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0204.inflow-scan.type                = LidarSampler
sampling0204.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0204.inflow-scan.length              = 996.0
sampling0204.inflow-scan.origin              = 9120.0 13140.0 120.0  # Lidar situated 3.0 m above hub height
sampling0204.inflow-scan.periodic            = true
sampling0204.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0204.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0204.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (9120.0 m, 13780.0 m, 0.0 m) -------------
sampling0205.output_frequency                = 1
sampling0205.fields                          = velocity temperature tke
sampling0205.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0205.inflow-bc-3D.type               = PlaneSampler
sampling0205.inflow-bc-3D.num_points         = 64 64
sampling0205.inflow-bc-3D.origin             = 8740.0 13460.0 0.0
sampling0205.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0205.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0205.inflow-scan.type                = LidarSampler
sampling0205.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0205.inflow-scan.length              = 996.0
sampling0205.inflow-scan.origin              = 9120.0 13780.0 120.0  # Lidar situated 3.0 m above hub height
sampling0205.inflow-scan.periodic            = true
sampling0205.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0205.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0205.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (9120.0 m, 14420.0 m, 0.0 m) -------------
sampling0206.output_frequency                = 1
sampling0206.fields                          = velocity temperature tke
sampling0206.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0206.inflow-bc-3D.type               = PlaneSampler
sampling0206.inflow-bc-3D.num_points         = 64 64
sampling0206.inflow-bc-3D.origin             = 8740.0 14100.0 0.0
sampling0206.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0206.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0206.inflow-scan.type                = LidarSampler
sampling0206.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0206.inflow-scan.length              = 996.0
sampling0206.inflow-scan.origin              = 9120.0 14420.0 120.0  # Lidar situated 3.0 m above hub height
sampling0206.inflow-scan.periodic            = true
sampling0206.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0206.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0206.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (10120.0 m, 500.0 m, 0.0 m) -------------
sampling0207.output_frequency                = 1
sampling0207.fields                          = velocity temperature tke
sampling0207.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0207.inflow-bc-3D.type               = PlaneSampler
sampling0207.inflow-bc-3D.num_points         = 64 64
sampling0207.inflow-bc-3D.origin             = 9740.0 180.0 0.0
sampling0207.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0207.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0207.inflow-scan.type                = LidarSampler
sampling0207.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0207.inflow-scan.length              = 996.0
sampling0207.inflow-scan.origin              = 10120.0 500.0 120.0  # Lidar situated 3.0 m above hub height
sampling0207.inflow-scan.periodic            = true
sampling0207.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0207.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0207.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (10120.0 m, 1140.0 m, 0.0 m) -------------
sampling0208.output_frequency                = 1
sampling0208.fields                          = velocity temperature tke
sampling0208.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0208.inflow-bc-3D.type               = PlaneSampler
sampling0208.inflow-bc-3D.num_points         = 64 64
sampling0208.inflow-bc-3D.origin             = 9740.0 820.0 0.0
sampling0208.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0208.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0208.inflow-scan.type                = LidarSampler
sampling0208.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0208.inflow-scan.length              = 996.0
sampling0208.inflow-scan.origin              = 10120.0 1140.0 120.0  # Lidar situated 3.0 m above hub height
sampling0208.inflow-scan.periodic            = true
sampling0208.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0208.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0208.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (10120.0 m, 1780.0 m, 0.0 m) -------------
sampling0209.output_frequency                = 1
sampling0209.fields                          = velocity temperature tke
sampling0209.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0209.inflow-bc-3D.type               = PlaneSampler
sampling0209.inflow-bc-3D.num_points         = 64 64
sampling0209.inflow-bc-3D.origin             = 9740.0 1460.0 0.0
sampling0209.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0209.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0209.inflow-scan.type                = LidarSampler
sampling0209.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0209.inflow-scan.length              = 996.0
sampling0209.inflow-scan.origin              = 10120.0 1780.0 120.0  # Lidar situated 3.0 m above hub height
sampling0209.inflow-scan.periodic            = true
sampling0209.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0209.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0209.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (10120.0 m, 2420.0 m, 0.0 m) -------------
sampling0210.output_frequency                = 1
sampling0210.fields                          = velocity temperature tke
sampling0210.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0210.inflow-bc-3D.type               = PlaneSampler
sampling0210.inflow-bc-3D.num_points         = 64 64
sampling0210.inflow-bc-3D.origin             = 9740.0 2100.0 0.0
sampling0210.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0210.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0210.inflow-scan.type                = LidarSampler
sampling0210.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0210.inflow-scan.length              = 996.0
sampling0210.inflow-scan.origin              = 10120.0 2420.0 120.0  # Lidar situated 3.0 m above hub height
sampling0210.inflow-scan.periodic            = true
sampling0210.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0210.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0210.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (10120.0 m, 3060.0 m, 0.0 m) -------------
sampling0211.output_frequency                = 1
sampling0211.fields                          = velocity temperature tke
sampling0211.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0211.inflow-bc-3D.type               = PlaneSampler
sampling0211.inflow-bc-3D.num_points         = 64 64
sampling0211.inflow-bc-3D.origin             = 9740.0 2740.0 0.0
sampling0211.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0211.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0211.inflow-scan.type                = LidarSampler
sampling0211.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0211.inflow-scan.length              = 996.0
sampling0211.inflow-scan.origin              = 10120.0 3060.0 120.0  # Lidar situated 3.0 m above hub height
sampling0211.inflow-scan.periodic            = true
sampling0211.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0211.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0211.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (10120.0 m, 3700.0 m, 0.0 m) -------------
sampling0212.output_frequency                = 1
sampling0212.fields                          = velocity temperature tke
sampling0212.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0212.inflow-bc-3D.type               = PlaneSampler
sampling0212.inflow-bc-3D.num_points         = 64 64
sampling0212.inflow-bc-3D.origin             = 9740.0 3380.0 0.0
sampling0212.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0212.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0212.inflow-scan.type                = LidarSampler
sampling0212.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0212.inflow-scan.length              = 996.0
sampling0212.inflow-scan.origin              = 10120.0 3700.0 120.0  # Lidar situated 3.0 m above hub height
sampling0212.inflow-scan.periodic            = true
sampling0212.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0212.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0212.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (10120.0 m, 4340.0 m, 0.0 m) -------------
sampling0213.output_frequency                = 1
sampling0213.fields                          = velocity temperature tke
sampling0213.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0213.inflow-bc-3D.type               = PlaneSampler
sampling0213.inflow-bc-3D.num_points         = 64 64
sampling0213.inflow-bc-3D.origin             = 9740.0 4020.0 0.0
sampling0213.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0213.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0213.inflow-scan.type                = LidarSampler
sampling0213.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0213.inflow-scan.length              = 996.0
sampling0213.inflow-scan.origin              = 10120.0 4340.0 120.0  # Lidar situated 3.0 m above hub height
sampling0213.inflow-scan.periodic            = true
sampling0213.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0213.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0213.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (10120.0 m, 4980.0 m, 0.0 m) -------------
sampling0214.output_frequency                = 1
sampling0214.fields                          = velocity temperature tke
sampling0214.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0214.inflow-bc-3D.type               = PlaneSampler
sampling0214.inflow-bc-3D.num_points         = 64 64
sampling0214.inflow-bc-3D.origin             = 9740.0 4660.0 0.0
sampling0214.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0214.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0214.inflow-scan.type                = LidarSampler
sampling0214.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0214.inflow-scan.length              = 996.0
sampling0214.inflow-scan.origin              = 10120.0 4980.0 120.0  # Lidar situated 3.0 m above hub height
sampling0214.inflow-scan.periodic            = true
sampling0214.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0214.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0214.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (10120.0 m, 5620.0 m, 0.0 m) -------------
sampling0215.output_frequency                = 1
sampling0215.fields                          = velocity temperature tke
sampling0215.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0215.inflow-bc-3D.type               = PlaneSampler
sampling0215.inflow-bc-3D.num_points         = 64 64
sampling0215.inflow-bc-3D.origin             = 9740.0 5300.0 0.0
sampling0215.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0215.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0215.inflow-scan.type                = LidarSampler
sampling0215.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0215.inflow-scan.length              = 996.0
sampling0215.inflow-scan.origin              = 10120.0 5620.0 120.0  # Lidar situated 3.0 m above hub height
sampling0215.inflow-scan.periodic            = true
sampling0215.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0215.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0215.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (10120.0 m, 6260.0 m, 0.0 m) -------------
sampling0216.output_frequency                = 1
sampling0216.fields                          = velocity temperature tke
sampling0216.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0216.inflow-bc-3D.type               = PlaneSampler
sampling0216.inflow-bc-3D.num_points         = 64 64
sampling0216.inflow-bc-3D.origin             = 9740.0 5940.0 0.0
sampling0216.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0216.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0216.inflow-scan.type                = LidarSampler
sampling0216.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0216.inflow-scan.length              = 996.0
sampling0216.inflow-scan.origin              = 10120.0 6260.0 120.0  # Lidar situated 3.0 m above hub height
sampling0216.inflow-scan.periodic            = true
sampling0216.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0216.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0216.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (10120.0 m, 6900.0 m, 0.0 m) -------------
sampling0217.output_frequency                = 1
sampling0217.fields                          = velocity temperature tke
sampling0217.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0217.inflow-bc-3D.type               = PlaneSampler
sampling0217.inflow-bc-3D.num_points         = 64 64
sampling0217.inflow-bc-3D.origin             = 9740.0 6580.0 0.0
sampling0217.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0217.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0217.inflow-scan.type                = LidarSampler
sampling0217.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0217.inflow-scan.length              = 996.0
sampling0217.inflow-scan.origin              = 10120.0 6900.0 120.0  # Lidar situated 3.0 m above hub height
sampling0217.inflow-scan.periodic            = true
sampling0217.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0217.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0217.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (10120.0 m, 7540.0 m, 0.0 m) -------------
sampling0218.output_frequency                = 1
sampling0218.fields                          = velocity temperature tke
sampling0218.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0218.inflow-bc-3D.type               = PlaneSampler
sampling0218.inflow-bc-3D.num_points         = 64 64
sampling0218.inflow-bc-3D.origin             = 9740.0 7220.0 0.0
sampling0218.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0218.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0218.inflow-scan.type                = LidarSampler
sampling0218.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0218.inflow-scan.length              = 996.0
sampling0218.inflow-scan.origin              = 10120.0 7540.0 120.0  # Lidar situated 3.0 m above hub height
sampling0218.inflow-scan.periodic            = true
sampling0218.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0218.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0218.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (10120.0 m, 8180.0 m, 0.0 m) -------------
sampling0219.output_frequency                = 1
sampling0219.fields                          = velocity temperature tke
sampling0219.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0219.inflow-bc-3D.type               = PlaneSampler
sampling0219.inflow-bc-3D.num_points         = 64 64
sampling0219.inflow-bc-3D.origin             = 9740.0 7860.0 0.0
sampling0219.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0219.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0219.inflow-scan.type                = LidarSampler
sampling0219.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0219.inflow-scan.length              = 996.0
sampling0219.inflow-scan.origin              = 10120.0 8180.0 120.0  # Lidar situated 3.0 m above hub height
sampling0219.inflow-scan.periodic            = true
sampling0219.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0219.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0219.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (10120.0 m, 8820.0 m, 0.0 m) -------------
sampling0220.output_frequency                = 1
sampling0220.fields                          = velocity temperature tke
sampling0220.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0220.inflow-bc-3D.type               = PlaneSampler
sampling0220.inflow-bc-3D.num_points         = 64 64
sampling0220.inflow-bc-3D.origin             = 9740.0 8500.0 0.0
sampling0220.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0220.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0220.inflow-scan.type                = LidarSampler
sampling0220.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0220.inflow-scan.length              = 996.0
sampling0220.inflow-scan.origin              = 10120.0 8820.0 120.0  # Lidar situated 3.0 m above hub height
sampling0220.inflow-scan.periodic            = true
sampling0220.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0220.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0220.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (10120.0 m, 9460.0 m, 0.0 m) -------------
sampling0221.output_frequency                = 1
sampling0221.fields                          = velocity temperature tke
sampling0221.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0221.inflow-bc-3D.type               = PlaneSampler
sampling0221.inflow-bc-3D.num_points         = 64 64
sampling0221.inflow-bc-3D.origin             = 9740.0 9140.0 0.0
sampling0221.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0221.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0221.inflow-scan.type                = LidarSampler
sampling0221.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0221.inflow-scan.length              = 996.0
sampling0221.inflow-scan.origin              = 10120.0 9460.0 120.0  # Lidar situated 3.0 m above hub height
sampling0221.inflow-scan.periodic            = true
sampling0221.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0221.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0221.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (10120.0 m, 10100.0 m, 0.0 m) -------------
sampling0222.output_frequency                = 1
sampling0222.fields                          = velocity temperature tke
sampling0222.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0222.inflow-bc-3D.type               = PlaneSampler
sampling0222.inflow-bc-3D.num_points         = 64 64
sampling0222.inflow-bc-3D.origin             = 9740.0 9780.0 0.0
sampling0222.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0222.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0222.inflow-scan.type                = LidarSampler
sampling0222.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0222.inflow-scan.length              = 996.0
sampling0222.inflow-scan.origin              = 10120.0 10100.0 120.0  # Lidar situated 3.0 m above hub height
sampling0222.inflow-scan.periodic            = true
sampling0222.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0222.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0222.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (10120.0 m, 10740.0 m, 0.0 m) -------------
sampling0223.output_frequency                = 1
sampling0223.fields                          = velocity temperature tke
sampling0223.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0223.inflow-bc-3D.type               = PlaneSampler
sampling0223.inflow-bc-3D.num_points         = 64 64
sampling0223.inflow-bc-3D.origin             = 9740.0 10420.0 0.0
sampling0223.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0223.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0223.inflow-scan.type                = LidarSampler
sampling0223.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0223.inflow-scan.length              = 996.0
sampling0223.inflow-scan.origin              = 10120.0 10740.0 120.0  # Lidar situated 3.0 m above hub height
sampling0223.inflow-scan.periodic            = true
sampling0223.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0223.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0223.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (10120.0 m, 11380.0 m, 0.0 m) -------------
sampling0224.output_frequency                = 1
sampling0224.fields                          = velocity temperature tke
sampling0224.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0224.inflow-bc-3D.type               = PlaneSampler
sampling0224.inflow-bc-3D.num_points         = 64 64
sampling0224.inflow-bc-3D.origin             = 9740.0 11060.0 0.0
sampling0224.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0224.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0224.inflow-scan.type                = LidarSampler
sampling0224.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0224.inflow-scan.length              = 996.0
sampling0224.inflow-scan.origin              = 10120.0 11380.0 120.0  # Lidar situated 3.0 m above hub height
sampling0224.inflow-scan.periodic            = true
sampling0224.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0224.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0224.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (10120.0 m, 12020.0 m, 0.0 m) -------------
sampling0225.output_frequency                = 1
sampling0225.fields                          = velocity temperature tke
sampling0225.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0225.inflow-bc-3D.type               = PlaneSampler
sampling0225.inflow-bc-3D.num_points         = 64 64
sampling0225.inflow-bc-3D.origin             = 9740.0 11700.0 0.0
sampling0225.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0225.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0225.inflow-scan.type                = LidarSampler
sampling0225.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0225.inflow-scan.length              = 996.0
sampling0225.inflow-scan.origin              = 10120.0 12020.0 120.0  # Lidar situated 3.0 m above hub height
sampling0225.inflow-scan.periodic            = true
sampling0225.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0225.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0225.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (10120.0 m, 12660.0 m, 0.0 m) -------------
sampling0226.output_frequency                = 1
sampling0226.fields                          = velocity temperature tke
sampling0226.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0226.inflow-bc-3D.type               = PlaneSampler
sampling0226.inflow-bc-3D.num_points         = 64 64
sampling0226.inflow-bc-3D.origin             = 9740.0 12340.0 0.0
sampling0226.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0226.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0226.inflow-scan.type                = LidarSampler
sampling0226.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0226.inflow-scan.length              = 996.0
sampling0226.inflow-scan.origin              = 10120.0 12660.0 120.0  # Lidar situated 3.0 m above hub height
sampling0226.inflow-scan.periodic            = true
sampling0226.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0226.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0226.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (10120.0 m, 13300.0 m, 0.0 m) -------------
sampling0227.output_frequency                = 1
sampling0227.fields                          = velocity temperature tke
sampling0227.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0227.inflow-bc-3D.type               = PlaneSampler
sampling0227.inflow-bc-3D.num_points         = 64 64
sampling0227.inflow-bc-3D.origin             = 9740.0 12980.0 0.0
sampling0227.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0227.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0227.inflow-scan.type                = LidarSampler
sampling0227.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0227.inflow-scan.length              = 996.0
sampling0227.inflow-scan.origin              = 10120.0 13300.0 120.0  # Lidar situated 3.0 m above hub height
sampling0227.inflow-scan.periodic            = true
sampling0227.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0227.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0227.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (10120.0 m, 13940.0 m, 0.0 m) -------------
sampling0228.output_frequency                = 1
sampling0228.fields                          = velocity temperature tke
sampling0228.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0228.inflow-bc-3D.type               = PlaneSampler
sampling0228.inflow-bc-3D.num_points         = 64 64
sampling0228.inflow-bc-3D.origin             = 9740.0 13620.0 0.0
sampling0228.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0228.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0228.inflow-scan.type                = LidarSampler
sampling0228.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0228.inflow-scan.length              = 996.0
sampling0228.inflow-scan.origin              = 10120.0 13940.0 120.0  # Lidar situated 3.0 m above hub height
sampling0228.inflow-scan.periodic            = true
sampling0228.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0228.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0228.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (10120.0 m, 14580.0 m, 0.0 m) -------------
sampling0229.output_frequency                = 1
sampling0229.fields                          = velocity temperature tke
sampling0229.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0229.inflow-bc-3D.type               = PlaneSampler
sampling0229.inflow-bc-3D.num_points         = 64 64
sampling0229.inflow-bc-3D.origin             = 9740.0 14260.0 0.0
sampling0229.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0229.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0229.inflow-scan.type                = LidarSampler
sampling0229.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0229.inflow-scan.length              = 996.0
sampling0229.inflow-scan.origin              = 10120.0 14580.0 120.0  # Lidar situated 3.0 m above hub height
sampling0229.inflow-scan.periodic            = true
sampling0229.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0229.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0229.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (11120.0 m, 660.0 m, 0.0 m) -------------
sampling0230.output_frequency                = 1
sampling0230.fields                          = velocity temperature tke
sampling0230.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0230.inflow-bc-3D.type               = PlaneSampler
sampling0230.inflow-bc-3D.num_points         = 64 64
sampling0230.inflow-bc-3D.origin             = 10740.0 340.0 0.0
sampling0230.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0230.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0230.inflow-scan.type                = LidarSampler
sampling0230.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0230.inflow-scan.length              = 996.0
sampling0230.inflow-scan.origin              = 11120.0 660.0 120.0  # Lidar situated 3.0 m above hub height
sampling0230.inflow-scan.periodic            = true
sampling0230.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0230.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0230.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (11120.0 m, 1300.0 m, 0.0 m) -------------
sampling0231.output_frequency                = 1
sampling0231.fields                          = velocity temperature tke
sampling0231.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0231.inflow-bc-3D.type               = PlaneSampler
sampling0231.inflow-bc-3D.num_points         = 64 64
sampling0231.inflow-bc-3D.origin             = 10740.0 980.0 0.0
sampling0231.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0231.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0231.inflow-scan.type                = LidarSampler
sampling0231.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0231.inflow-scan.length              = 996.0
sampling0231.inflow-scan.origin              = 11120.0 1300.0 120.0  # Lidar situated 3.0 m above hub height
sampling0231.inflow-scan.periodic            = true
sampling0231.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0231.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0231.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (11120.0 m, 1940.0 m, 0.0 m) -------------
sampling0232.output_frequency                = 1
sampling0232.fields                          = velocity temperature tke
sampling0232.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0232.inflow-bc-3D.type               = PlaneSampler
sampling0232.inflow-bc-3D.num_points         = 64 64
sampling0232.inflow-bc-3D.origin             = 10740.0 1620.0 0.0
sampling0232.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0232.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0232.inflow-scan.type                = LidarSampler
sampling0232.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0232.inflow-scan.length              = 996.0
sampling0232.inflow-scan.origin              = 11120.0 1940.0 120.0  # Lidar situated 3.0 m above hub height
sampling0232.inflow-scan.periodic            = true
sampling0232.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0232.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0232.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (11120.0 m, 2580.0 m, 0.0 m) -------------
sampling0233.output_frequency                = 1
sampling0233.fields                          = velocity temperature tke
sampling0233.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0233.inflow-bc-3D.type               = PlaneSampler
sampling0233.inflow-bc-3D.num_points         = 64 64
sampling0233.inflow-bc-3D.origin             = 10740.0 2260.0 0.0
sampling0233.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0233.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0233.inflow-scan.type                = LidarSampler
sampling0233.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0233.inflow-scan.length              = 996.0
sampling0233.inflow-scan.origin              = 11120.0 2580.0 120.0  # Lidar situated 3.0 m above hub height
sampling0233.inflow-scan.periodic            = true
sampling0233.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0233.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0233.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (11120.0 m, 3220.0 m, 0.0 m) -------------
sampling0234.output_frequency                = 1
sampling0234.fields                          = velocity temperature tke
sampling0234.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0234.inflow-bc-3D.type               = PlaneSampler
sampling0234.inflow-bc-3D.num_points         = 64 64
sampling0234.inflow-bc-3D.origin             = 10740.0 2900.0 0.0
sampling0234.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0234.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0234.inflow-scan.type                = LidarSampler
sampling0234.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0234.inflow-scan.length              = 996.0
sampling0234.inflow-scan.origin              = 11120.0 3220.0 120.0  # Lidar situated 3.0 m above hub height
sampling0234.inflow-scan.periodic            = true
sampling0234.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0234.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0234.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (11120.0 m, 3860.0 m, 0.0 m) -------------
sampling0235.output_frequency                = 1
sampling0235.fields                          = velocity temperature tke
sampling0235.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0235.inflow-bc-3D.type               = PlaneSampler
sampling0235.inflow-bc-3D.num_points         = 64 64
sampling0235.inflow-bc-3D.origin             = 10740.0 3540.0 0.0
sampling0235.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0235.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0235.inflow-scan.type                = LidarSampler
sampling0235.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0235.inflow-scan.length              = 996.0
sampling0235.inflow-scan.origin              = 11120.0 3860.0 120.0  # Lidar situated 3.0 m above hub height
sampling0235.inflow-scan.periodic            = true
sampling0235.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0235.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0235.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (11120.0 m, 4500.0 m, 0.0 m) -------------
sampling0236.output_frequency                = 1
sampling0236.fields                          = velocity temperature tke
sampling0236.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0236.inflow-bc-3D.type               = PlaneSampler
sampling0236.inflow-bc-3D.num_points         = 64 64
sampling0236.inflow-bc-3D.origin             = 10740.0 4180.0 0.0
sampling0236.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0236.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0236.inflow-scan.type                = LidarSampler
sampling0236.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0236.inflow-scan.length              = 996.0
sampling0236.inflow-scan.origin              = 11120.0 4500.0 120.0  # Lidar situated 3.0 m above hub height
sampling0236.inflow-scan.periodic            = true
sampling0236.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0236.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0236.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (11120.0 m, 5140.0 m, 0.0 m) -------------
sampling0237.output_frequency                = 1
sampling0237.fields                          = velocity temperature tke
sampling0237.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0237.inflow-bc-3D.type               = PlaneSampler
sampling0237.inflow-bc-3D.num_points         = 64 64
sampling0237.inflow-bc-3D.origin             = 10740.0 4820.0 0.0
sampling0237.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0237.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0237.inflow-scan.type                = LidarSampler
sampling0237.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0237.inflow-scan.length              = 996.0
sampling0237.inflow-scan.origin              = 11120.0 5140.0 120.0  # Lidar situated 3.0 m above hub height
sampling0237.inflow-scan.periodic            = true
sampling0237.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0237.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0237.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (11120.0 m, 5780.0 m, 0.0 m) -------------
sampling0238.output_frequency                = 1
sampling0238.fields                          = velocity temperature tke
sampling0238.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0238.inflow-bc-3D.type               = PlaneSampler
sampling0238.inflow-bc-3D.num_points         = 64 64
sampling0238.inflow-bc-3D.origin             = 10740.0 5460.0 0.0
sampling0238.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0238.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0238.inflow-scan.type                = LidarSampler
sampling0238.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0238.inflow-scan.length              = 996.0
sampling0238.inflow-scan.origin              = 11120.0 5780.0 120.0  # Lidar situated 3.0 m above hub height
sampling0238.inflow-scan.periodic            = true
sampling0238.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0238.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0238.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (11120.0 m, 6420.0 m, 0.0 m) -------------
sampling0239.output_frequency                = 1
sampling0239.fields                          = velocity temperature tke
sampling0239.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0239.inflow-bc-3D.type               = PlaneSampler
sampling0239.inflow-bc-3D.num_points         = 64 64
sampling0239.inflow-bc-3D.origin             = 10740.0 6100.0 0.0
sampling0239.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0239.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0239.inflow-scan.type                = LidarSampler
sampling0239.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0239.inflow-scan.length              = 996.0
sampling0239.inflow-scan.origin              = 11120.0 6420.0 120.0  # Lidar situated 3.0 m above hub height
sampling0239.inflow-scan.periodic            = true
sampling0239.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0239.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0239.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (11120.0 m, 7060.0 m, 0.0 m) -------------
sampling0240.output_frequency                = 1
sampling0240.fields                          = velocity temperature tke
sampling0240.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0240.inflow-bc-3D.type               = PlaneSampler
sampling0240.inflow-bc-3D.num_points         = 64 64
sampling0240.inflow-bc-3D.origin             = 10740.0 6740.0 0.0
sampling0240.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0240.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0240.inflow-scan.type                = LidarSampler
sampling0240.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0240.inflow-scan.length              = 996.0
sampling0240.inflow-scan.origin              = 11120.0 7060.0 120.0  # Lidar situated 3.0 m above hub height
sampling0240.inflow-scan.periodic            = true
sampling0240.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0240.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0240.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (11120.0 m, 7700.0 m, 0.0 m) -------------
sampling0241.output_frequency                = 1
sampling0241.fields                          = velocity temperature tke
sampling0241.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0241.inflow-bc-3D.type               = PlaneSampler
sampling0241.inflow-bc-3D.num_points         = 64 64
sampling0241.inflow-bc-3D.origin             = 10740.0 7380.0 0.0
sampling0241.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0241.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0241.inflow-scan.type                = LidarSampler
sampling0241.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0241.inflow-scan.length              = 996.0
sampling0241.inflow-scan.origin              = 11120.0 7700.0 120.0  # Lidar situated 3.0 m above hub height
sampling0241.inflow-scan.periodic            = true
sampling0241.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0241.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0241.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (11120.0 m, 8340.0 m, 0.0 m) -------------
sampling0242.output_frequency                = 1
sampling0242.fields                          = velocity temperature tke
sampling0242.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0242.inflow-bc-3D.type               = PlaneSampler
sampling0242.inflow-bc-3D.num_points         = 64 64
sampling0242.inflow-bc-3D.origin             = 10740.0 8020.0 0.0
sampling0242.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0242.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0242.inflow-scan.type                = LidarSampler
sampling0242.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0242.inflow-scan.length              = 996.0
sampling0242.inflow-scan.origin              = 11120.0 8340.0 120.0  # Lidar situated 3.0 m above hub height
sampling0242.inflow-scan.periodic            = true
sampling0242.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0242.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0242.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (11120.0 m, 8980.0 m, 0.0 m) -------------
sampling0243.output_frequency                = 1
sampling0243.fields                          = velocity temperature tke
sampling0243.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0243.inflow-bc-3D.type               = PlaneSampler
sampling0243.inflow-bc-3D.num_points         = 64 64
sampling0243.inflow-bc-3D.origin             = 10740.0 8660.0 0.0
sampling0243.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0243.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0243.inflow-scan.type                = LidarSampler
sampling0243.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0243.inflow-scan.length              = 996.0
sampling0243.inflow-scan.origin              = 11120.0 8980.0 120.0  # Lidar situated 3.0 m above hub height
sampling0243.inflow-scan.periodic            = true
sampling0243.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0243.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0243.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (11120.0 m, 9620.0 m, 0.0 m) -------------
sampling0244.output_frequency                = 1
sampling0244.fields                          = velocity temperature tke
sampling0244.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0244.inflow-bc-3D.type               = PlaneSampler
sampling0244.inflow-bc-3D.num_points         = 64 64
sampling0244.inflow-bc-3D.origin             = 10740.0 9300.0 0.0
sampling0244.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0244.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0244.inflow-scan.type                = LidarSampler
sampling0244.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0244.inflow-scan.length              = 996.0
sampling0244.inflow-scan.origin              = 11120.0 9620.0 120.0  # Lidar situated 3.0 m above hub height
sampling0244.inflow-scan.periodic            = true
sampling0244.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0244.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0244.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (11120.0 m, 10260.0 m, 0.0 m) -------------
sampling0245.output_frequency                = 1
sampling0245.fields                          = velocity temperature tke
sampling0245.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0245.inflow-bc-3D.type               = PlaneSampler
sampling0245.inflow-bc-3D.num_points         = 64 64
sampling0245.inflow-bc-3D.origin             = 10740.0 9940.0 0.0
sampling0245.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0245.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0245.inflow-scan.type                = LidarSampler
sampling0245.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0245.inflow-scan.length              = 996.0
sampling0245.inflow-scan.origin              = 11120.0 10260.0 120.0  # Lidar situated 3.0 m above hub height
sampling0245.inflow-scan.periodic            = true
sampling0245.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0245.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0245.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (11120.0 m, 10900.0 m, 0.0 m) -------------
sampling0246.output_frequency                = 1
sampling0246.fields                          = velocity temperature tke
sampling0246.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0246.inflow-bc-3D.type               = PlaneSampler
sampling0246.inflow-bc-3D.num_points         = 64 64
sampling0246.inflow-bc-3D.origin             = 10740.0 10580.0 0.0
sampling0246.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0246.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0246.inflow-scan.type                = LidarSampler
sampling0246.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0246.inflow-scan.length              = 996.0
sampling0246.inflow-scan.origin              = 11120.0 10900.0 120.0  # Lidar situated 3.0 m above hub height
sampling0246.inflow-scan.periodic            = true
sampling0246.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0246.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0246.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (11120.0 m, 11540.0 m, 0.0 m) -------------
sampling0247.output_frequency                = 1
sampling0247.fields                          = velocity temperature tke
sampling0247.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0247.inflow-bc-3D.type               = PlaneSampler
sampling0247.inflow-bc-3D.num_points         = 64 64
sampling0247.inflow-bc-3D.origin             = 10740.0 11220.0 0.0
sampling0247.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0247.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0247.inflow-scan.type                = LidarSampler
sampling0247.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0247.inflow-scan.length              = 996.0
sampling0247.inflow-scan.origin              = 11120.0 11540.0 120.0  # Lidar situated 3.0 m above hub height
sampling0247.inflow-scan.periodic            = true
sampling0247.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0247.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0247.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (11120.0 m, 12180.0 m, 0.0 m) -------------
sampling0248.output_frequency                = 1
sampling0248.fields                          = velocity temperature tke
sampling0248.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0248.inflow-bc-3D.type               = PlaneSampler
sampling0248.inflow-bc-3D.num_points         = 64 64
sampling0248.inflow-bc-3D.origin             = 10740.0 11860.0 0.0
sampling0248.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0248.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0248.inflow-scan.type                = LidarSampler
sampling0248.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0248.inflow-scan.length              = 996.0
sampling0248.inflow-scan.origin              = 11120.0 12180.0 120.0  # Lidar situated 3.0 m above hub height
sampling0248.inflow-scan.periodic            = true
sampling0248.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0248.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0248.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (11120.0 m, 12820.0 m, 0.0 m) -------------
sampling0249.output_frequency                = 1
sampling0249.fields                          = velocity temperature tke
sampling0249.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0249.inflow-bc-3D.type               = PlaneSampler
sampling0249.inflow-bc-3D.num_points         = 64 64
sampling0249.inflow-bc-3D.origin             = 10740.0 12500.0 0.0
sampling0249.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0249.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0249.inflow-scan.type                = LidarSampler
sampling0249.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0249.inflow-scan.length              = 996.0
sampling0249.inflow-scan.origin              = 11120.0 12820.0 120.0  # Lidar situated 3.0 m above hub height
sampling0249.inflow-scan.periodic            = true
sampling0249.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0249.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0249.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (11120.0 m, 13460.0 m, 0.0 m) -------------
sampling0250.output_frequency                = 1
sampling0250.fields                          = velocity temperature tke
sampling0250.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0250.inflow-bc-3D.type               = PlaneSampler
sampling0250.inflow-bc-3D.num_points         = 64 64
sampling0250.inflow-bc-3D.origin             = 10740.0 13140.0 0.0
sampling0250.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0250.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0250.inflow-scan.type                = LidarSampler
sampling0250.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0250.inflow-scan.length              = 996.0
sampling0250.inflow-scan.origin              = 11120.0 13460.0 120.0  # Lidar situated 3.0 m above hub height
sampling0250.inflow-scan.periodic            = true
sampling0250.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0250.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0250.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (11120.0 m, 14100.0 m, 0.0 m) -------------
sampling0251.output_frequency                = 1
sampling0251.fields                          = velocity temperature tke
sampling0251.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0251.inflow-bc-3D.type               = PlaneSampler
sampling0251.inflow-bc-3D.num_points         = 64 64
sampling0251.inflow-bc-3D.origin             = 10740.0 13780.0 0.0
sampling0251.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0251.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0251.inflow-scan.type                = LidarSampler
sampling0251.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0251.inflow-scan.length              = 996.0
sampling0251.inflow-scan.origin              = 11120.0 14100.0 120.0  # Lidar situated 3.0 m above hub height
sampling0251.inflow-scan.periodic            = true
sampling0251.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0251.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0251.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (11120.0 m, 14740.0 m, 0.0 m) -------------
sampling0252.output_frequency                = 1
sampling0252.fields                          = velocity temperature tke
sampling0252.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0252.inflow-bc-3D.type               = PlaneSampler
sampling0252.inflow-bc-3D.num_points         = 64 64
sampling0252.inflow-bc-3D.origin             = 10740.0 14420.0 0.0
sampling0252.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0252.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0252.inflow-scan.type                = LidarSampler
sampling0252.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0252.inflow-scan.length              = 996.0
sampling0252.inflow-scan.origin              = 11120.0 14740.0 120.0  # Lidar situated 3.0 m above hub height
sampling0252.inflow-scan.periodic            = true
sampling0252.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0252.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0252.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (12120.0 m, 820.0 m, 0.0 m) -------------
sampling0253.output_frequency                = 1
sampling0253.fields                          = velocity temperature tke
sampling0253.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0253.inflow-bc-3D.type               = PlaneSampler
sampling0253.inflow-bc-3D.num_points         = 64 64
sampling0253.inflow-bc-3D.origin             = 11740.0 500.0 0.0
sampling0253.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0253.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0253.inflow-scan.type                = LidarSampler
sampling0253.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0253.inflow-scan.length              = 996.0
sampling0253.inflow-scan.origin              = 12120.0 820.0 120.0  # Lidar situated 3.0 m above hub height
sampling0253.inflow-scan.periodic            = true
sampling0253.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0253.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0253.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (12120.0 m, 1460.0 m, 0.0 m) -------------
sampling0254.output_frequency                = 1
sampling0254.fields                          = velocity temperature tke
sampling0254.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0254.inflow-bc-3D.type               = PlaneSampler
sampling0254.inflow-bc-3D.num_points         = 64 64
sampling0254.inflow-bc-3D.origin             = 11740.0 1140.0 0.0
sampling0254.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0254.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0254.inflow-scan.type                = LidarSampler
sampling0254.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0254.inflow-scan.length              = 996.0
sampling0254.inflow-scan.origin              = 12120.0 1460.0 120.0  # Lidar situated 3.0 m above hub height
sampling0254.inflow-scan.periodic            = true
sampling0254.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0254.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0254.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (12120.0 m, 2100.0 m, 0.0 m) -------------
sampling0255.output_frequency                = 1
sampling0255.fields                          = velocity temperature tke
sampling0255.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0255.inflow-bc-3D.type               = PlaneSampler
sampling0255.inflow-bc-3D.num_points         = 64 64
sampling0255.inflow-bc-3D.origin             = 11740.0 1780.0 0.0
sampling0255.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0255.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0255.inflow-scan.type                = LidarSampler
sampling0255.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0255.inflow-scan.length              = 996.0
sampling0255.inflow-scan.origin              = 12120.0 2100.0 120.0  # Lidar situated 3.0 m above hub height
sampling0255.inflow-scan.periodic            = true
sampling0255.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0255.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0255.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (12120.0 m, 2740.0 m, 0.0 m) -------------
sampling0256.output_frequency                = 1
sampling0256.fields                          = velocity temperature tke
sampling0256.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0256.inflow-bc-3D.type               = PlaneSampler
sampling0256.inflow-bc-3D.num_points         = 64 64
sampling0256.inflow-bc-3D.origin             = 11740.0 2420.0 0.0
sampling0256.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0256.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0256.inflow-scan.type                = LidarSampler
sampling0256.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0256.inflow-scan.length              = 996.0
sampling0256.inflow-scan.origin              = 12120.0 2740.0 120.0  # Lidar situated 3.0 m above hub height
sampling0256.inflow-scan.periodic            = true
sampling0256.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0256.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0256.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (12120.0 m, 3380.0 m, 0.0 m) -------------
sampling0257.output_frequency                = 1
sampling0257.fields                          = velocity temperature tke
sampling0257.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0257.inflow-bc-3D.type               = PlaneSampler
sampling0257.inflow-bc-3D.num_points         = 64 64
sampling0257.inflow-bc-3D.origin             = 11740.0 3060.0 0.0
sampling0257.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0257.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0257.inflow-scan.type                = LidarSampler
sampling0257.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0257.inflow-scan.length              = 996.0
sampling0257.inflow-scan.origin              = 12120.0 3380.0 120.0  # Lidar situated 3.0 m above hub height
sampling0257.inflow-scan.periodic            = true
sampling0257.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0257.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0257.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (12120.0 m, 4020.0 m, 0.0 m) -------------
sampling0258.output_frequency                = 1
sampling0258.fields                          = velocity temperature tke
sampling0258.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0258.inflow-bc-3D.type               = PlaneSampler
sampling0258.inflow-bc-3D.num_points         = 64 64
sampling0258.inflow-bc-3D.origin             = 11740.0 3700.0 0.0
sampling0258.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0258.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0258.inflow-scan.type                = LidarSampler
sampling0258.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0258.inflow-scan.length              = 996.0
sampling0258.inflow-scan.origin              = 12120.0 4020.0 120.0  # Lidar situated 3.0 m above hub height
sampling0258.inflow-scan.periodic            = true
sampling0258.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0258.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0258.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (12120.0 m, 4660.0 m, 0.0 m) -------------
sampling0259.output_frequency                = 1
sampling0259.fields                          = velocity temperature tke
sampling0259.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0259.inflow-bc-3D.type               = PlaneSampler
sampling0259.inflow-bc-3D.num_points         = 64 64
sampling0259.inflow-bc-3D.origin             = 11740.0 4340.0 0.0
sampling0259.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0259.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0259.inflow-scan.type                = LidarSampler
sampling0259.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0259.inflow-scan.length              = 996.0
sampling0259.inflow-scan.origin              = 12120.0 4660.0 120.0  # Lidar situated 3.0 m above hub height
sampling0259.inflow-scan.periodic            = true
sampling0259.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0259.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0259.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (12120.0 m, 5300.0 m, 0.0 m) -------------
sampling0260.output_frequency                = 1
sampling0260.fields                          = velocity temperature tke
sampling0260.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0260.inflow-bc-3D.type               = PlaneSampler
sampling0260.inflow-bc-3D.num_points         = 64 64
sampling0260.inflow-bc-3D.origin             = 11740.0 4980.0 0.0
sampling0260.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0260.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0260.inflow-scan.type                = LidarSampler
sampling0260.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0260.inflow-scan.length              = 996.0
sampling0260.inflow-scan.origin              = 12120.0 5300.0 120.0  # Lidar situated 3.0 m above hub height
sampling0260.inflow-scan.periodic            = true
sampling0260.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0260.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0260.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (12120.0 m, 5940.0 m, 0.0 m) -------------
sampling0261.output_frequency                = 1
sampling0261.fields                          = velocity temperature tke
sampling0261.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0261.inflow-bc-3D.type               = PlaneSampler
sampling0261.inflow-bc-3D.num_points         = 64 64
sampling0261.inflow-bc-3D.origin             = 11740.0 5620.0 0.0
sampling0261.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0261.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0261.inflow-scan.type                = LidarSampler
sampling0261.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0261.inflow-scan.length              = 996.0
sampling0261.inflow-scan.origin              = 12120.0 5940.0 120.0  # Lidar situated 3.0 m above hub height
sampling0261.inflow-scan.periodic            = true
sampling0261.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0261.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0261.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (12120.0 m, 6580.0 m, 0.0 m) -------------
sampling0262.output_frequency                = 1
sampling0262.fields                          = velocity temperature tke
sampling0262.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0262.inflow-bc-3D.type               = PlaneSampler
sampling0262.inflow-bc-3D.num_points         = 64 64
sampling0262.inflow-bc-3D.origin             = 11740.0 6260.0 0.0
sampling0262.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0262.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0262.inflow-scan.type                = LidarSampler
sampling0262.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0262.inflow-scan.length              = 996.0
sampling0262.inflow-scan.origin              = 12120.0 6580.0 120.0  # Lidar situated 3.0 m above hub height
sampling0262.inflow-scan.periodic            = true
sampling0262.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0262.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0262.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (12120.0 m, 7220.0 m, 0.0 m) -------------
sampling0263.output_frequency                = 1
sampling0263.fields                          = velocity temperature tke
sampling0263.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0263.inflow-bc-3D.type               = PlaneSampler
sampling0263.inflow-bc-3D.num_points         = 64 64
sampling0263.inflow-bc-3D.origin             = 11740.0 6900.0 0.0
sampling0263.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0263.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0263.inflow-scan.type                = LidarSampler
sampling0263.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0263.inflow-scan.length              = 996.0
sampling0263.inflow-scan.origin              = 12120.0 7220.0 120.0  # Lidar situated 3.0 m above hub height
sampling0263.inflow-scan.periodic            = true
sampling0263.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0263.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0263.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (12120.0 m, 7860.0 m, 0.0 m) -------------
sampling0264.output_frequency                = 1
sampling0264.fields                          = velocity temperature tke
sampling0264.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0264.inflow-bc-3D.type               = PlaneSampler
sampling0264.inflow-bc-3D.num_points         = 64 64
sampling0264.inflow-bc-3D.origin             = 11740.0 7540.0 0.0
sampling0264.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0264.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0264.inflow-scan.type                = LidarSampler
sampling0264.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0264.inflow-scan.length              = 996.0
sampling0264.inflow-scan.origin              = 12120.0 7860.0 120.0  # Lidar situated 3.0 m above hub height
sampling0264.inflow-scan.periodic            = true
sampling0264.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0264.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0264.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (12120.0 m, 8500.0 m, 0.0 m) -------------
sampling0265.output_frequency                = 1
sampling0265.fields                          = velocity temperature tke
sampling0265.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0265.inflow-bc-3D.type               = PlaneSampler
sampling0265.inflow-bc-3D.num_points         = 64 64
sampling0265.inflow-bc-3D.origin             = 11740.0 8180.0 0.0
sampling0265.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0265.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0265.inflow-scan.type                = LidarSampler
sampling0265.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0265.inflow-scan.length              = 996.0
sampling0265.inflow-scan.origin              = 12120.0 8500.0 120.0  # Lidar situated 3.0 m above hub height
sampling0265.inflow-scan.periodic            = true
sampling0265.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0265.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0265.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (12120.0 m, 9140.0 m, 0.0 m) -------------
sampling0266.output_frequency                = 1
sampling0266.fields                          = velocity temperature tke
sampling0266.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0266.inflow-bc-3D.type               = PlaneSampler
sampling0266.inflow-bc-3D.num_points         = 64 64
sampling0266.inflow-bc-3D.origin             = 11740.0 8820.0 0.0
sampling0266.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0266.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0266.inflow-scan.type                = LidarSampler
sampling0266.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0266.inflow-scan.length              = 996.0
sampling0266.inflow-scan.origin              = 12120.0 9140.0 120.0  # Lidar situated 3.0 m above hub height
sampling0266.inflow-scan.periodic            = true
sampling0266.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0266.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0266.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (12120.0 m, 9780.0 m, 0.0 m) -------------
sampling0267.output_frequency                = 1
sampling0267.fields                          = velocity temperature tke
sampling0267.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0267.inflow-bc-3D.type               = PlaneSampler
sampling0267.inflow-bc-3D.num_points         = 64 64
sampling0267.inflow-bc-3D.origin             = 11740.0 9460.0 0.0
sampling0267.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0267.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0267.inflow-scan.type                = LidarSampler
sampling0267.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0267.inflow-scan.length              = 996.0
sampling0267.inflow-scan.origin              = 12120.0 9780.0 120.0  # Lidar situated 3.0 m above hub height
sampling0267.inflow-scan.periodic            = true
sampling0267.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0267.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0267.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (12120.0 m, 10420.0 m, 0.0 m) -------------
sampling0268.output_frequency                = 1
sampling0268.fields                          = velocity temperature tke
sampling0268.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0268.inflow-bc-3D.type               = PlaneSampler
sampling0268.inflow-bc-3D.num_points         = 64 64
sampling0268.inflow-bc-3D.origin             = 11740.0 10100.0 0.0
sampling0268.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0268.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0268.inflow-scan.type                = LidarSampler
sampling0268.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0268.inflow-scan.length              = 996.0
sampling0268.inflow-scan.origin              = 12120.0 10420.0 120.0  # Lidar situated 3.0 m above hub height
sampling0268.inflow-scan.periodic            = true
sampling0268.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0268.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0268.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (12120.0 m, 11060.0 m, 0.0 m) -------------
sampling0269.output_frequency                = 1
sampling0269.fields                          = velocity temperature tke
sampling0269.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0269.inflow-bc-3D.type               = PlaneSampler
sampling0269.inflow-bc-3D.num_points         = 64 64
sampling0269.inflow-bc-3D.origin             = 11740.0 10740.0 0.0
sampling0269.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0269.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0269.inflow-scan.type                = LidarSampler
sampling0269.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0269.inflow-scan.length              = 996.0
sampling0269.inflow-scan.origin              = 12120.0 11060.0 120.0  # Lidar situated 3.0 m above hub height
sampling0269.inflow-scan.periodic            = true
sampling0269.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0269.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0269.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (12120.0 m, 11700.0 m, 0.0 m) -------------
sampling0270.output_frequency                = 1
sampling0270.fields                          = velocity temperature tke
sampling0270.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0270.inflow-bc-3D.type               = PlaneSampler
sampling0270.inflow-bc-3D.num_points         = 64 64
sampling0270.inflow-bc-3D.origin             = 11740.0 11380.0 0.0
sampling0270.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0270.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0270.inflow-scan.type                = LidarSampler
sampling0270.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0270.inflow-scan.length              = 996.0
sampling0270.inflow-scan.origin              = 12120.0 11700.0 120.0  # Lidar situated 3.0 m above hub height
sampling0270.inflow-scan.periodic            = true
sampling0270.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0270.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0270.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (12120.0 m, 12340.0 m, 0.0 m) -------------
sampling0271.output_frequency                = 1
sampling0271.fields                          = velocity temperature tke
sampling0271.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0271.inflow-bc-3D.type               = PlaneSampler
sampling0271.inflow-bc-3D.num_points         = 64 64
sampling0271.inflow-bc-3D.origin             = 11740.0 12020.0 0.0
sampling0271.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0271.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0271.inflow-scan.type                = LidarSampler
sampling0271.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0271.inflow-scan.length              = 996.0
sampling0271.inflow-scan.origin              = 12120.0 12340.0 120.0  # Lidar situated 3.0 m above hub height
sampling0271.inflow-scan.periodic            = true
sampling0271.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0271.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0271.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (12120.0 m, 12980.0 m, 0.0 m) -------------
sampling0272.output_frequency                = 1
sampling0272.fields                          = velocity temperature tke
sampling0272.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0272.inflow-bc-3D.type               = PlaneSampler
sampling0272.inflow-bc-3D.num_points         = 64 64
sampling0272.inflow-bc-3D.origin             = 11740.0 12660.0 0.0
sampling0272.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0272.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0272.inflow-scan.type                = LidarSampler
sampling0272.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0272.inflow-scan.length              = 996.0
sampling0272.inflow-scan.origin              = 12120.0 12980.0 120.0  # Lidar situated 3.0 m above hub height
sampling0272.inflow-scan.periodic            = true
sampling0272.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0272.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0272.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (12120.0 m, 13620.0 m, 0.0 m) -------------
sampling0273.output_frequency                = 1
sampling0273.fields                          = velocity temperature tke
sampling0273.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0273.inflow-bc-3D.type               = PlaneSampler
sampling0273.inflow-bc-3D.num_points         = 64 64
sampling0273.inflow-bc-3D.origin             = 11740.0 13300.0 0.0
sampling0273.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0273.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0273.inflow-scan.type                = LidarSampler
sampling0273.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0273.inflow-scan.length              = 996.0
sampling0273.inflow-scan.origin              = 12120.0 13620.0 120.0  # Lidar situated 3.0 m above hub height
sampling0273.inflow-scan.periodic            = true
sampling0273.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0273.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0273.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (12120.0 m, 14260.0 m, 0.0 m) -------------
sampling0274.output_frequency                = 1
sampling0274.fields                          = velocity temperature tke
sampling0274.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0274.inflow-bc-3D.type               = PlaneSampler
sampling0274.inflow-bc-3D.num_points         = 64 64
sampling0274.inflow-bc-3D.origin             = 11740.0 13940.0 0.0
sampling0274.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0274.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0274.inflow-scan.type                = LidarSampler
sampling0274.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0274.inflow-scan.length              = 996.0
sampling0274.inflow-scan.origin              = 12120.0 14260.0 120.0  # Lidar situated 3.0 m above hub height
sampling0274.inflow-scan.periodic            = true
sampling0274.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0274.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0274.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (12120.0 m, 14900.0 m, 0.0 m) -------------
sampling0275.output_frequency                = 1
sampling0275.fields                          = velocity temperature tke
sampling0275.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0275.inflow-bc-3D.type               = PlaneSampler
sampling0275.inflow-bc-3D.num_points         = 64 64
sampling0275.inflow-bc-3D.origin             = 11740.0 14580.0 0.0
sampling0275.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0275.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0275.inflow-scan.type                = LidarSampler
sampling0275.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0275.inflow-scan.length              = 996.0
sampling0275.inflow-scan.origin              = 12120.0 14900.0 120.0  # Lidar situated 3.0 m above hub height
sampling0275.inflow-scan.periodic            = true
sampling0275.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0275.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0275.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (13120.0 m, 340.0 m, 0.0 m) -------------
sampling0276.output_frequency                = 1
sampling0276.fields                          = velocity temperature tke
sampling0276.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0276.inflow-bc-3D.type               = PlaneSampler
sampling0276.inflow-bc-3D.num_points         = 64 64
sampling0276.inflow-bc-3D.origin             = 12740.0 20.0 0.0
sampling0276.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0276.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0276.inflow-scan.type                = LidarSampler
sampling0276.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0276.inflow-scan.length              = 996.0
sampling0276.inflow-scan.origin              = 13120.0 340.0 120.0  # Lidar situated 3.0 m above hub height
sampling0276.inflow-scan.periodic            = true
sampling0276.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0276.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0276.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (13120.0 m, 980.0 m, 0.0 m) -------------
sampling0277.output_frequency                = 1
sampling0277.fields                          = velocity temperature tke
sampling0277.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0277.inflow-bc-3D.type               = PlaneSampler
sampling0277.inflow-bc-3D.num_points         = 64 64
sampling0277.inflow-bc-3D.origin             = 12740.0 660.0 0.0
sampling0277.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0277.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0277.inflow-scan.type                = LidarSampler
sampling0277.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0277.inflow-scan.length              = 996.0
sampling0277.inflow-scan.origin              = 13120.0 980.0 120.0  # Lidar situated 3.0 m above hub height
sampling0277.inflow-scan.periodic            = true
sampling0277.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0277.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0277.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (13120.0 m, 1620.0 m, 0.0 m) -------------
sampling0278.output_frequency                = 1
sampling0278.fields                          = velocity temperature tke
sampling0278.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0278.inflow-bc-3D.type               = PlaneSampler
sampling0278.inflow-bc-3D.num_points         = 64 64
sampling0278.inflow-bc-3D.origin             = 12740.0 1300.0 0.0
sampling0278.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0278.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0278.inflow-scan.type                = LidarSampler
sampling0278.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0278.inflow-scan.length              = 996.0
sampling0278.inflow-scan.origin              = 13120.0 1620.0 120.0  # Lidar situated 3.0 m above hub height
sampling0278.inflow-scan.periodic            = true
sampling0278.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0278.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0278.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (13120.0 m, 2260.0 m, 0.0 m) -------------
sampling0279.output_frequency                = 1
sampling0279.fields                          = velocity temperature tke
sampling0279.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0279.inflow-bc-3D.type               = PlaneSampler
sampling0279.inflow-bc-3D.num_points         = 64 64
sampling0279.inflow-bc-3D.origin             = 12740.0 1940.0 0.0
sampling0279.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0279.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0279.inflow-scan.type                = LidarSampler
sampling0279.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0279.inflow-scan.length              = 996.0
sampling0279.inflow-scan.origin              = 13120.0 2260.0 120.0  # Lidar situated 3.0 m above hub height
sampling0279.inflow-scan.periodic            = true
sampling0279.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0279.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0279.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (13120.0 m, 2900.0 m, 0.0 m) -------------
sampling0280.output_frequency                = 1
sampling0280.fields                          = velocity temperature tke
sampling0280.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0280.inflow-bc-3D.type               = PlaneSampler
sampling0280.inflow-bc-3D.num_points         = 64 64
sampling0280.inflow-bc-3D.origin             = 12740.0 2580.0 0.0
sampling0280.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0280.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0280.inflow-scan.type                = LidarSampler
sampling0280.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0280.inflow-scan.length              = 996.0
sampling0280.inflow-scan.origin              = 13120.0 2900.0 120.0  # Lidar situated 3.0 m above hub height
sampling0280.inflow-scan.periodic            = true
sampling0280.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0280.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0280.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (13120.0 m, 3540.0 m, 0.0 m) -------------
sampling0281.output_frequency                = 1
sampling0281.fields                          = velocity temperature tke
sampling0281.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0281.inflow-bc-3D.type               = PlaneSampler
sampling0281.inflow-bc-3D.num_points         = 64 64
sampling0281.inflow-bc-3D.origin             = 12740.0 3220.0 0.0
sampling0281.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0281.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0281.inflow-scan.type                = LidarSampler
sampling0281.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0281.inflow-scan.length              = 996.0
sampling0281.inflow-scan.origin              = 13120.0 3540.0 120.0  # Lidar situated 3.0 m above hub height
sampling0281.inflow-scan.periodic            = true
sampling0281.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0281.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0281.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (13120.0 m, 4180.0 m, 0.0 m) -------------
sampling0282.output_frequency                = 1
sampling0282.fields                          = velocity temperature tke
sampling0282.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0282.inflow-bc-3D.type               = PlaneSampler
sampling0282.inflow-bc-3D.num_points         = 64 64
sampling0282.inflow-bc-3D.origin             = 12740.0 3860.0 0.0
sampling0282.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0282.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0282.inflow-scan.type                = LidarSampler
sampling0282.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0282.inflow-scan.length              = 996.0
sampling0282.inflow-scan.origin              = 13120.0 4180.0 120.0  # Lidar situated 3.0 m above hub height
sampling0282.inflow-scan.periodic            = true
sampling0282.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0282.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0282.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (13120.0 m, 4820.0 m, 0.0 m) -------------
sampling0283.output_frequency                = 1
sampling0283.fields                          = velocity temperature tke
sampling0283.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0283.inflow-bc-3D.type               = PlaneSampler
sampling0283.inflow-bc-3D.num_points         = 64 64
sampling0283.inflow-bc-3D.origin             = 12740.0 4500.0 0.0
sampling0283.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0283.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0283.inflow-scan.type                = LidarSampler
sampling0283.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0283.inflow-scan.length              = 996.0
sampling0283.inflow-scan.origin              = 13120.0 4820.0 120.0  # Lidar situated 3.0 m above hub height
sampling0283.inflow-scan.periodic            = true
sampling0283.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0283.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0283.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (13120.0 m, 5460.0 m, 0.0 m) -------------
sampling0284.output_frequency                = 1
sampling0284.fields                          = velocity temperature tke
sampling0284.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0284.inflow-bc-3D.type               = PlaneSampler
sampling0284.inflow-bc-3D.num_points         = 64 64
sampling0284.inflow-bc-3D.origin             = 12740.0 5140.0 0.0
sampling0284.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0284.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0284.inflow-scan.type                = LidarSampler
sampling0284.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0284.inflow-scan.length              = 996.0
sampling0284.inflow-scan.origin              = 13120.0 5460.0 120.0  # Lidar situated 3.0 m above hub height
sampling0284.inflow-scan.periodic            = true
sampling0284.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0284.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0284.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (13120.0 m, 6100.0 m, 0.0 m) -------------
sampling0285.output_frequency                = 1
sampling0285.fields                          = velocity temperature tke
sampling0285.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0285.inflow-bc-3D.type               = PlaneSampler
sampling0285.inflow-bc-3D.num_points         = 64 64
sampling0285.inflow-bc-3D.origin             = 12740.0 5780.0 0.0
sampling0285.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0285.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0285.inflow-scan.type                = LidarSampler
sampling0285.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0285.inflow-scan.length              = 996.0
sampling0285.inflow-scan.origin              = 13120.0 6100.0 120.0  # Lidar situated 3.0 m above hub height
sampling0285.inflow-scan.periodic            = true
sampling0285.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0285.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0285.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (13120.0 m, 6740.0 m, 0.0 m) -------------
sampling0286.output_frequency                = 1
sampling0286.fields                          = velocity temperature tke
sampling0286.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0286.inflow-bc-3D.type               = PlaneSampler
sampling0286.inflow-bc-3D.num_points         = 64 64
sampling0286.inflow-bc-3D.origin             = 12740.0 6420.0 0.0
sampling0286.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0286.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0286.inflow-scan.type                = LidarSampler
sampling0286.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0286.inflow-scan.length              = 996.0
sampling0286.inflow-scan.origin              = 13120.0 6740.0 120.0  # Lidar situated 3.0 m above hub height
sampling0286.inflow-scan.periodic            = true
sampling0286.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0286.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0286.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (13120.0 m, 7380.0 m, 0.0 m) -------------
sampling0287.output_frequency                = 1
sampling0287.fields                          = velocity temperature tke
sampling0287.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0287.inflow-bc-3D.type               = PlaneSampler
sampling0287.inflow-bc-3D.num_points         = 64 64
sampling0287.inflow-bc-3D.origin             = 12740.0 7060.0 0.0
sampling0287.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0287.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0287.inflow-scan.type                = LidarSampler
sampling0287.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0287.inflow-scan.length              = 996.0
sampling0287.inflow-scan.origin              = 13120.0 7380.0 120.0  # Lidar situated 3.0 m above hub height
sampling0287.inflow-scan.periodic            = true
sampling0287.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0287.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0287.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (13120.0 m, 8020.0 m, 0.0 m) -------------
sampling0288.output_frequency                = 1
sampling0288.fields                          = velocity temperature tke
sampling0288.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0288.inflow-bc-3D.type               = PlaneSampler
sampling0288.inflow-bc-3D.num_points         = 64 64
sampling0288.inflow-bc-3D.origin             = 12740.0 7700.0 0.0
sampling0288.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0288.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0288.inflow-scan.type                = LidarSampler
sampling0288.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0288.inflow-scan.length              = 996.0
sampling0288.inflow-scan.origin              = 13120.0 8020.0 120.0  # Lidar situated 3.0 m above hub height
sampling0288.inflow-scan.periodic            = true
sampling0288.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0288.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0288.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (13120.0 m, 8660.0 m, 0.0 m) -------------
sampling0289.output_frequency                = 1
sampling0289.fields                          = velocity temperature tke
sampling0289.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0289.inflow-bc-3D.type               = PlaneSampler
sampling0289.inflow-bc-3D.num_points         = 64 64
sampling0289.inflow-bc-3D.origin             = 12740.0 8340.0 0.0
sampling0289.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0289.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0289.inflow-scan.type                = LidarSampler
sampling0289.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0289.inflow-scan.length              = 996.0
sampling0289.inflow-scan.origin              = 13120.0 8660.0 120.0  # Lidar situated 3.0 m above hub height
sampling0289.inflow-scan.periodic            = true
sampling0289.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0289.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0289.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (13120.0 m, 9300.0 m, 0.0 m) -------------
sampling0290.output_frequency                = 1
sampling0290.fields                          = velocity temperature tke
sampling0290.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0290.inflow-bc-3D.type               = PlaneSampler
sampling0290.inflow-bc-3D.num_points         = 64 64
sampling0290.inflow-bc-3D.origin             = 12740.0 8980.0 0.0
sampling0290.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0290.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0290.inflow-scan.type                = LidarSampler
sampling0290.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0290.inflow-scan.length              = 996.0
sampling0290.inflow-scan.origin              = 13120.0 9300.0 120.0  # Lidar situated 3.0 m above hub height
sampling0290.inflow-scan.periodic            = true
sampling0290.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0290.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0290.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (13120.0 m, 9940.0 m, 0.0 m) -------------
sampling0291.output_frequency                = 1
sampling0291.fields                          = velocity temperature tke
sampling0291.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0291.inflow-bc-3D.type               = PlaneSampler
sampling0291.inflow-bc-3D.num_points         = 64 64
sampling0291.inflow-bc-3D.origin             = 12740.0 9620.0 0.0
sampling0291.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0291.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0291.inflow-scan.type                = LidarSampler
sampling0291.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0291.inflow-scan.length              = 996.0
sampling0291.inflow-scan.origin              = 13120.0 9940.0 120.0  # Lidar situated 3.0 m above hub height
sampling0291.inflow-scan.periodic            = true
sampling0291.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0291.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0291.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (13120.0 m, 10580.0 m, 0.0 m) -------------
sampling0292.output_frequency                = 1
sampling0292.fields                          = velocity temperature tke
sampling0292.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0292.inflow-bc-3D.type               = PlaneSampler
sampling0292.inflow-bc-3D.num_points         = 64 64
sampling0292.inflow-bc-3D.origin             = 12740.0 10260.0 0.0
sampling0292.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0292.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0292.inflow-scan.type                = LidarSampler
sampling0292.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0292.inflow-scan.length              = 996.0
sampling0292.inflow-scan.origin              = 13120.0 10580.0 120.0  # Lidar situated 3.0 m above hub height
sampling0292.inflow-scan.periodic            = true
sampling0292.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0292.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0292.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (13120.0 m, 11220.0 m, 0.0 m) -------------
sampling0293.output_frequency                = 1
sampling0293.fields                          = velocity temperature tke
sampling0293.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0293.inflow-bc-3D.type               = PlaneSampler
sampling0293.inflow-bc-3D.num_points         = 64 64
sampling0293.inflow-bc-3D.origin             = 12740.0 10900.0 0.0
sampling0293.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0293.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0293.inflow-scan.type                = LidarSampler
sampling0293.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0293.inflow-scan.length              = 996.0
sampling0293.inflow-scan.origin              = 13120.0 11220.0 120.0  # Lidar situated 3.0 m above hub height
sampling0293.inflow-scan.periodic            = true
sampling0293.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0293.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0293.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (13120.0 m, 11860.0 m, 0.0 m) -------------
sampling0294.output_frequency                = 1
sampling0294.fields                          = velocity temperature tke
sampling0294.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0294.inflow-bc-3D.type               = PlaneSampler
sampling0294.inflow-bc-3D.num_points         = 64 64
sampling0294.inflow-bc-3D.origin             = 12740.0 11540.0 0.0
sampling0294.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0294.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0294.inflow-scan.type                = LidarSampler
sampling0294.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0294.inflow-scan.length              = 996.0
sampling0294.inflow-scan.origin              = 13120.0 11860.0 120.0  # Lidar situated 3.0 m above hub height
sampling0294.inflow-scan.periodic            = true
sampling0294.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0294.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0294.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (13120.0 m, 12500.0 m, 0.0 m) -------------
sampling0295.output_frequency                = 1
sampling0295.fields                          = velocity temperature tke
sampling0295.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0295.inflow-bc-3D.type               = PlaneSampler
sampling0295.inflow-bc-3D.num_points         = 64 64
sampling0295.inflow-bc-3D.origin             = 12740.0 12180.0 0.0
sampling0295.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0295.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0295.inflow-scan.type                = LidarSampler
sampling0295.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0295.inflow-scan.length              = 996.0
sampling0295.inflow-scan.origin              = 13120.0 12500.0 120.0  # Lidar situated 3.0 m above hub height
sampling0295.inflow-scan.periodic            = true
sampling0295.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0295.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0295.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (13120.0 m, 13140.0 m, 0.0 m) -------------
sampling0296.output_frequency                = 1
sampling0296.fields                          = velocity temperature tke
sampling0296.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0296.inflow-bc-3D.type               = PlaneSampler
sampling0296.inflow-bc-3D.num_points         = 64 64
sampling0296.inflow-bc-3D.origin             = 12740.0 12820.0 0.0
sampling0296.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0296.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0296.inflow-scan.type                = LidarSampler
sampling0296.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0296.inflow-scan.length              = 996.0
sampling0296.inflow-scan.origin              = 13120.0 13140.0 120.0  # Lidar situated 3.0 m above hub height
sampling0296.inflow-scan.periodic            = true
sampling0296.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0296.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0296.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (13120.0 m, 13780.0 m, 0.0 m) -------------
sampling0297.output_frequency                = 1
sampling0297.fields                          = velocity temperature tke
sampling0297.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0297.inflow-bc-3D.type               = PlaneSampler
sampling0297.inflow-bc-3D.num_points         = 64 64
sampling0297.inflow-bc-3D.origin             = 12740.0 13460.0 0.0
sampling0297.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0297.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0297.inflow-scan.type                = LidarSampler
sampling0297.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0297.inflow-scan.length              = 996.0
sampling0297.inflow-scan.origin              = 13120.0 13780.0 120.0  # Lidar situated 3.0 m above hub height
sampling0297.inflow-scan.periodic            = true
sampling0297.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0297.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0297.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (13120.0 m, 14420.0 m, 0.0 m) -------------
sampling0298.output_frequency                = 1
sampling0298.fields                          = velocity temperature tke
sampling0298.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0298.inflow-bc-3D.type               = PlaneSampler
sampling0298.inflow-bc-3D.num_points         = 64 64
sampling0298.inflow-bc-3D.origin             = 12740.0 14100.0 0.0
sampling0298.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0298.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0298.inflow-scan.type                = LidarSampler
sampling0298.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0298.inflow-scan.length              = 996.0
sampling0298.inflow-scan.origin              = 13120.0 14420.0 120.0  # Lidar situated 3.0 m above hub height
sampling0298.inflow-scan.periodic            = true
sampling0298.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0298.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0298.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (14120.0 m, 500.0 m, 0.0 m) -------------
sampling0299.output_frequency                = 1
sampling0299.fields                          = velocity temperature tke
sampling0299.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0299.inflow-bc-3D.type               = PlaneSampler
sampling0299.inflow-bc-3D.num_points         = 64 64
sampling0299.inflow-bc-3D.origin             = 13740.0 180.0 0.0
sampling0299.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0299.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0299.inflow-scan.type                = LidarSampler
sampling0299.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0299.inflow-scan.length              = 996.0
sampling0299.inflow-scan.origin              = 14120.0 500.0 120.0  # Lidar situated 3.0 m above hub height
sampling0299.inflow-scan.periodic            = true
sampling0299.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0299.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0299.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (14120.0 m, 1140.0 m, 0.0 m) -------------
sampling0300.output_frequency                = 1
sampling0300.fields                          = velocity temperature tke
sampling0300.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0300.inflow-bc-3D.type               = PlaneSampler
sampling0300.inflow-bc-3D.num_points         = 64 64
sampling0300.inflow-bc-3D.origin             = 13740.0 820.0 0.0
sampling0300.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0300.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0300.inflow-scan.type                = LidarSampler
sampling0300.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0300.inflow-scan.length              = 996.0
sampling0300.inflow-scan.origin              = 14120.0 1140.0 120.0  # Lidar situated 3.0 m above hub height
sampling0300.inflow-scan.periodic            = true
sampling0300.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0300.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0300.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (14120.0 m, 1780.0 m, 0.0 m) -------------
sampling0301.output_frequency                = 1
sampling0301.fields                          = velocity temperature tke
sampling0301.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0301.inflow-bc-3D.type               = PlaneSampler
sampling0301.inflow-bc-3D.num_points         = 64 64
sampling0301.inflow-bc-3D.origin             = 13740.0 1460.0 0.0
sampling0301.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0301.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0301.inflow-scan.type                = LidarSampler
sampling0301.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0301.inflow-scan.length              = 996.0
sampling0301.inflow-scan.origin              = 14120.0 1780.0 120.0  # Lidar situated 3.0 m above hub height
sampling0301.inflow-scan.periodic            = true
sampling0301.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0301.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0301.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (14120.0 m, 2420.0 m, 0.0 m) -------------
sampling0302.output_frequency                = 1
sampling0302.fields                          = velocity temperature tke
sampling0302.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0302.inflow-bc-3D.type               = PlaneSampler
sampling0302.inflow-bc-3D.num_points         = 64 64
sampling0302.inflow-bc-3D.origin             = 13740.0 2100.0 0.0
sampling0302.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0302.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0302.inflow-scan.type                = LidarSampler
sampling0302.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0302.inflow-scan.length              = 996.0
sampling0302.inflow-scan.origin              = 14120.0 2420.0 120.0  # Lidar situated 3.0 m above hub height
sampling0302.inflow-scan.periodic            = true
sampling0302.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0302.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0302.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (14120.0 m, 3060.0 m, 0.0 m) -------------
sampling0303.output_frequency                = 1
sampling0303.fields                          = velocity temperature tke
sampling0303.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0303.inflow-bc-3D.type               = PlaneSampler
sampling0303.inflow-bc-3D.num_points         = 64 64
sampling0303.inflow-bc-3D.origin             = 13740.0 2740.0 0.0
sampling0303.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0303.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0303.inflow-scan.type                = LidarSampler
sampling0303.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0303.inflow-scan.length              = 996.0
sampling0303.inflow-scan.origin              = 14120.0 3060.0 120.0  # Lidar situated 3.0 m above hub height
sampling0303.inflow-scan.periodic            = true
sampling0303.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0303.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0303.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (14120.0 m, 3700.0 m, 0.0 m) -------------
sampling0304.output_frequency                = 1
sampling0304.fields                          = velocity temperature tke
sampling0304.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0304.inflow-bc-3D.type               = PlaneSampler
sampling0304.inflow-bc-3D.num_points         = 64 64
sampling0304.inflow-bc-3D.origin             = 13740.0 3380.0 0.0
sampling0304.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0304.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0304.inflow-scan.type                = LidarSampler
sampling0304.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0304.inflow-scan.length              = 996.0
sampling0304.inflow-scan.origin              = 14120.0 3700.0 120.0  # Lidar situated 3.0 m above hub height
sampling0304.inflow-scan.periodic            = true
sampling0304.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0304.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0304.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (14120.0 m, 4340.0 m, 0.0 m) -------------
sampling0305.output_frequency                = 1
sampling0305.fields                          = velocity temperature tke
sampling0305.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0305.inflow-bc-3D.type               = PlaneSampler
sampling0305.inflow-bc-3D.num_points         = 64 64
sampling0305.inflow-bc-3D.origin             = 13740.0 4020.0 0.0
sampling0305.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0305.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0305.inflow-scan.type                = LidarSampler
sampling0305.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0305.inflow-scan.length              = 996.0
sampling0305.inflow-scan.origin              = 14120.0 4340.0 120.0  # Lidar situated 3.0 m above hub height
sampling0305.inflow-scan.periodic            = true
sampling0305.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0305.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0305.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (14120.0 m, 4980.0 m, 0.0 m) -------------
sampling0306.output_frequency                = 1
sampling0306.fields                          = velocity temperature tke
sampling0306.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0306.inflow-bc-3D.type               = PlaneSampler
sampling0306.inflow-bc-3D.num_points         = 64 64
sampling0306.inflow-bc-3D.origin             = 13740.0 4660.0 0.0
sampling0306.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0306.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0306.inflow-scan.type                = LidarSampler
sampling0306.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0306.inflow-scan.length              = 996.0
sampling0306.inflow-scan.origin              = 14120.0 4980.0 120.0  # Lidar situated 3.0 m above hub height
sampling0306.inflow-scan.periodic            = true
sampling0306.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0306.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0306.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (14120.0 m, 5620.0 m, 0.0 m) -------------
sampling0307.output_frequency                = 1
sampling0307.fields                          = velocity temperature tke
sampling0307.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0307.inflow-bc-3D.type               = PlaneSampler
sampling0307.inflow-bc-3D.num_points         = 64 64
sampling0307.inflow-bc-3D.origin             = 13740.0 5300.0 0.0
sampling0307.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0307.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0307.inflow-scan.type                = LidarSampler
sampling0307.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0307.inflow-scan.length              = 996.0
sampling0307.inflow-scan.origin              = 14120.0 5620.0 120.0  # Lidar situated 3.0 m above hub height
sampling0307.inflow-scan.periodic            = true
sampling0307.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0307.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0307.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (14120.0 m, 6260.0 m, 0.0 m) -------------
sampling0308.output_frequency                = 1
sampling0308.fields                          = velocity temperature tke
sampling0308.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0308.inflow-bc-3D.type               = PlaneSampler
sampling0308.inflow-bc-3D.num_points         = 64 64
sampling0308.inflow-bc-3D.origin             = 13740.0 5940.0 0.0
sampling0308.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0308.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0308.inflow-scan.type                = LidarSampler
sampling0308.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0308.inflow-scan.length              = 996.0
sampling0308.inflow-scan.origin              = 14120.0 6260.0 120.0  # Lidar situated 3.0 m above hub height
sampling0308.inflow-scan.periodic            = true
sampling0308.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0308.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0308.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (14120.0 m, 6900.0 m, 0.0 m) -------------
sampling0309.output_frequency                = 1
sampling0309.fields                          = velocity temperature tke
sampling0309.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0309.inflow-bc-3D.type               = PlaneSampler
sampling0309.inflow-bc-3D.num_points         = 64 64
sampling0309.inflow-bc-3D.origin             = 13740.0 6580.0 0.0
sampling0309.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0309.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0309.inflow-scan.type                = LidarSampler
sampling0309.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0309.inflow-scan.length              = 996.0
sampling0309.inflow-scan.origin              = 14120.0 6900.0 120.0  # Lidar situated 3.0 m above hub height
sampling0309.inflow-scan.periodic            = true
sampling0309.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0309.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0309.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (14120.0 m, 7540.0 m, 0.0 m) -------------
sampling0310.output_frequency                = 1
sampling0310.fields                          = velocity temperature tke
sampling0310.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0310.inflow-bc-3D.type               = PlaneSampler
sampling0310.inflow-bc-3D.num_points         = 64 64
sampling0310.inflow-bc-3D.origin             = 13740.0 7220.0 0.0
sampling0310.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0310.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0310.inflow-scan.type                = LidarSampler
sampling0310.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0310.inflow-scan.length              = 996.0
sampling0310.inflow-scan.origin              = 14120.0 7540.0 120.0  # Lidar situated 3.0 m above hub height
sampling0310.inflow-scan.periodic            = true
sampling0310.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0310.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0310.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (14120.0 m, 8180.0 m, 0.0 m) -------------
sampling0311.output_frequency                = 1
sampling0311.fields                          = velocity temperature tke
sampling0311.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0311.inflow-bc-3D.type               = PlaneSampler
sampling0311.inflow-bc-3D.num_points         = 64 64
sampling0311.inflow-bc-3D.origin             = 13740.0 7860.0 0.0
sampling0311.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0311.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0311.inflow-scan.type                = LidarSampler
sampling0311.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0311.inflow-scan.length              = 996.0
sampling0311.inflow-scan.origin              = 14120.0 8180.0 120.0  # Lidar situated 3.0 m above hub height
sampling0311.inflow-scan.periodic            = true
sampling0311.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0311.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0311.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (14120.0 m, 8820.0 m, 0.0 m) -------------
sampling0312.output_frequency                = 1
sampling0312.fields                          = velocity temperature tke
sampling0312.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0312.inflow-bc-3D.type               = PlaneSampler
sampling0312.inflow-bc-3D.num_points         = 64 64
sampling0312.inflow-bc-3D.origin             = 13740.0 8500.0 0.0
sampling0312.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0312.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0312.inflow-scan.type                = LidarSampler
sampling0312.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0312.inflow-scan.length              = 996.0
sampling0312.inflow-scan.origin              = 14120.0 8820.0 120.0  # Lidar situated 3.0 m above hub height
sampling0312.inflow-scan.periodic            = true
sampling0312.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0312.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0312.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (14120.0 m, 9460.0 m, 0.0 m) -------------
sampling0313.output_frequency                = 1
sampling0313.fields                          = velocity temperature tke
sampling0313.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0313.inflow-bc-3D.type               = PlaneSampler
sampling0313.inflow-bc-3D.num_points         = 64 64
sampling0313.inflow-bc-3D.origin             = 13740.0 9140.0 0.0
sampling0313.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0313.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0313.inflow-scan.type                = LidarSampler
sampling0313.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0313.inflow-scan.length              = 996.0
sampling0313.inflow-scan.origin              = 14120.0 9460.0 120.0  # Lidar situated 3.0 m above hub height
sampling0313.inflow-scan.periodic            = true
sampling0313.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0313.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0313.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (14120.0 m, 10100.0 m, 0.0 m) -------------
sampling0314.output_frequency                = 1
sampling0314.fields                          = velocity temperature tke
sampling0314.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0314.inflow-bc-3D.type               = PlaneSampler
sampling0314.inflow-bc-3D.num_points         = 64 64
sampling0314.inflow-bc-3D.origin             = 13740.0 9780.0 0.0
sampling0314.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0314.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0314.inflow-scan.type                = LidarSampler
sampling0314.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0314.inflow-scan.length              = 996.0
sampling0314.inflow-scan.origin              = 14120.0 10100.0 120.0  # Lidar situated 3.0 m above hub height
sampling0314.inflow-scan.periodic            = true
sampling0314.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0314.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0314.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (14120.0 m, 10740.0 m, 0.0 m) -------------
sampling0315.output_frequency                = 1
sampling0315.fields                          = velocity temperature tke
sampling0315.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0315.inflow-bc-3D.type               = PlaneSampler
sampling0315.inflow-bc-3D.num_points         = 64 64
sampling0315.inflow-bc-3D.origin             = 13740.0 10420.0 0.0
sampling0315.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0315.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0315.inflow-scan.type                = LidarSampler
sampling0315.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0315.inflow-scan.length              = 996.0
sampling0315.inflow-scan.origin              = 14120.0 10740.0 120.0  # Lidar situated 3.0 m above hub height
sampling0315.inflow-scan.periodic            = true
sampling0315.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0315.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0315.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (14120.0 m, 11380.0 m, 0.0 m) -------------
sampling0316.output_frequency                = 1
sampling0316.fields                          = velocity temperature tke
sampling0316.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0316.inflow-bc-3D.type               = PlaneSampler
sampling0316.inflow-bc-3D.num_points         = 64 64
sampling0316.inflow-bc-3D.origin             = 13740.0 11060.0 0.0
sampling0316.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0316.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0316.inflow-scan.type                = LidarSampler
sampling0316.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0316.inflow-scan.length              = 996.0
sampling0316.inflow-scan.origin              = 14120.0 11380.0 120.0  # Lidar situated 3.0 m above hub height
sampling0316.inflow-scan.periodic            = true
sampling0316.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0316.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0316.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (14120.0 m, 12020.0 m, 0.0 m) -------------
sampling0317.output_frequency                = 1
sampling0317.fields                          = velocity temperature tke
sampling0317.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0317.inflow-bc-3D.type               = PlaneSampler
sampling0317.inflow-bc-3D.num_points         = 64 64
sampling0317.inflow-bc-3D.origin             = 13740.0 11700.0 0.0
sampling0317.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0317.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0317.inflow-scan.type                = LidarSampler
sampling0317.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0317.inflow-scan.length              = 996.0
sampling0317.inflow-scan.origin              = 14120.0 12020.0 120.0  # Lidar situated 3.0 m above hub height
sampling0317.inflow-scan.periodic            = true
sampling0317.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0317.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0317.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (14120.0 m, 12660.0 m, 0.0 m) -------------
sampling0318.output_frequency                = 1
sampling0318.fields                          = velocity temperature tke
sampling0318.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0318.inflow-bc-3D.type               = PlaneSampler
sampling0318.inflow-bc-3D.num_points         = 64 64
sampling0318.inflow-bc-3D.origin             = 13740.0 12340.0 0.0
sampling0318.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0318.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0318.inflow-scan.type                = LidarSampler
sampling0318.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0318.inflow-scan.length              = 996.0
sampling0318.inflow-scan.origin              = 14120.0 12660.0 120.0  # Lidar situated 3.0 m above hub height
sampling0318.inflow-scan.periodic            = true
sampling0318.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0318.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0318.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (14120.0 m, 13300.0 m, 0.0 m) -------------
sampling0319.output_frequency                = 1
sampling0319.fields                          = velocity temperature tke
sampling0319.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0319.inflow-bc-3D.type               = PlaneSampler
sampling0319.inflow-bc-3D.num_points         = 64 64
sampling0319.inflow-bc-3D.origin             = 13740.0 12980.0 0.0
sampling0319.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0319.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0319.inflow-scan.type                = LidarSampler
sampling0319.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0319.inflow-scan.length              = 996.0
sampling0319.inflow-scan.origin              = 14120.0 13300.0 120.0  # Lidar situated 3.0 m above hub height
sampling0319.inflow-scan.periodic            = true
sampling0319.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0319.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0319.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (14120.0 m, 13940.0 m, 0.0 m) -------------
sampling0320.output_frequency                = 1
sampling0320.fields                          = velocity temperature tke
sampling0320.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0320.inflow-bc-3D.type               = PlaneSampler
sampling0320.inflow-bc-3D.num_points         = 64 64
sampling0320.inflow-bc-3D.origin             = 13740.0 13620.0 0.0
sampling0320.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0320.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0320.inflow-scan.type                = LidarSampler
sampling0320.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0320.inflow-scan.length              = 996.0
sampling0320.inflow-scan.origin              = 14120.0 13940.0 120.0  # Lidar situated 3.0 m above hub height
sampling0320.inflow-scan.periodic            = true
sampling0320.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0320.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0320.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (14120.0 m, 14580.0 m, 0.0 m) -------------
sampling0321.output_frequency                = 1
sampling0321.fields                          = velocity temperature tke
sampling0321.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0321.inflow-bc-3D.type               = PlaneSampler
sampling0321.inflow-bc-3D.num_points         = 64 64
sampling0321.inflow-bc-3D.origin             = 13740.0 14260.0 0.0
sampling0321.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0321.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0321.inflow-scan.type                = LidarSampler
sampling0321.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0321.inflow-scan.length              = 996.0
sampling0321.inflow-scan.origin              = 14120.0 14580.0 120.0  # Lidar situated 3.0 m above hub height
sampling0321.inflow-scan.periodic            = true
sampling0321.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0321.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0321.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (15120.0 m, 660.0 m, 0.0 m) -------------
sampling0322.output_frequency                = 1
sampling0322.fields                          = velocity temperature tke
sampling0322.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0322.inflow-bc-3D.type               = PlaneSampler
sampling0322.inflow-bc-3D.num_points         = 64 64
sampling0322.inflow-bc-3D.origin             = 14740.0 340.0 0.0
sampling0322.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0322.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0322.inflow-scan.type                = LidarSampler
sampling0322.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0322.inflow-scan.length              = 996.0
sampling0322.inflow-scan.origin              = 15120.0 660.0 120.0  # Lidar situated 3.0 m above hub height
sampling0322.inflow-scan.periodic            = true
sampling0322.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0322.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0322.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (15120.0 m, 1300.0 m, 0.0 m) -------------
sampling0323.output_frequency                = 1
sampling0323.fields                          = velocity temperature tke
sampling0323.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0323.inflow-bc-3D.type               = PlaneSampler
sampling0323.inflow-bc-3D.num_points         = 64 64
sampling0323.inflow-bc-3D.origin             = 14740.0 980.0 0.0
sampling0323.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0323.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0323.inflow-scan.type                = LidarSampler
sampling0323.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0323.inflow-scan.length              = 996.0
sampling0323.inflow-scan.origin              = 15120.0 1300.0 120.0  # Lidar situated 3.0 m above hub height
sampling0323.inflow-scan.periodic            = true
sampling0323.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0323.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0323.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (15120.0 m, 1940.0 m, 0.0 m) -------------
sampling0324.output_frequency                = 1
sampling0324.fields                          = velocity temperature tke
sampling0324.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0324.inflow-bc-3D.type               = PlaneSampler
sampling0324.inflow-bc-3D.num_points         = 64 64
sampling0324.inflow-bc-3D.origin             = 14740.0 1620.0 0.0
sampling0324.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0324.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0324.inflow-scan.type                = LidarSampler
sampling0324.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0324.inflow-scan.length              = 996.0
sampling0324.inflow-scan.origin              = 15120.0 1940.0 120.0  # Lidar situated 3.0 m above hub height
sampling0324.inflow-scan.periodic            = true
sampling0324.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0324.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0324.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (15120.0 m, 2580.0 m, 0.0 m) -------------
sampling0325.output_frequency                = 1
sampling0325.fields                          = velocity temperature tke
sampling0325.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0325.inflow-bc-3D.type               = PlaneSampler
sampling0325.inflow-bc-3D.num_points         = 64 64
sampling0325.inflow-bc-3D.origin             = 14740.0 2260.0 0.0
sampling0325.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0325.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0325.inflow-scan.type                = LidarSampler
sampling0325.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0325.inflow-scan.length              = 996.0
sampling0325.inflow-scan.origin              = 15120.0 2580.0 120.0  # Lidar situated 3.0 m above hub height
sampling0325.inflow-scan.periodic            = true
sampling0325.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0325.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0325.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (15120.0 m, 3220.0 m, 0.0 m) -------------
sampling0326.output_frequency                = 1
sampling0326.fields                          = velocity temperature tke
sampling0326.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0326.inflow-bc-3D.type               = PlaneSampler
sampling0326.inflow-bc-3D.num_points         = 64 64
sampling0326.inflow-bc-3D.origin             = 14740.0 2900.0 0.0
sampling0326.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0326.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0326.inflow-scan.type                = LidarSampler
sampling0326.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0326.inflow-scan.length              = 996.0
sampling0326.inflow-scan.origin              = 15120.0 3220.0 120.0  # Lidar situated 3.0 m above hub height
sampling0326.inflow-scan.periodic            = true
sampling0326.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0326.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0326.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (15120.0 m, 3860.0 m, 0.0 m) -------------
sampling0327.output_frequency                = 1
sampling0327.fields                          = velocity temperature tke
sampling0327.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0327.inflow-bc-3D.type               = PlaneSampler
sampling0327.inflow-bc-3D.num_points         = 64 64
sampling0327.inflow-bc-3D.origin             = 14740.0 3540.0 0.0
sampling0327.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0327.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0327.inflow-scan.type                = LidarSampler
sampling0327.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0327.inflow-scan.length              = 996.0
sampling0327.inflow-scan.origin              = 15120.0 3860.0 120.0  # Lidar situated 3.0 m above hub height
sampling0327.inflow-scan.periodic            = true
sampling0327.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0327.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0327.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (15120.0 m, 4500.0 m, 0.0 m) -------------
sampling0328.output_frequency                = 1
sampling0328.fields                          = velocity temperature tke
sampling0328.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0328.inflow-bc-3D.type               = PlaneSampler
sampling0328.inflow-bc-3D.num_points         = 64 64
sampling0328.inflow-bc-3D.origin             = 14740.0 4180.0 0.0
sampling0328.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0328.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0328.inflow-scan.type                = LidarSampler
sampling0328.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0328.inflow-scan.length              = 996.0
sampling0328.inflow-scan.origin              = 15120.0 4500.0 120.0  # Lidar situated 3.0 m above hub height
sampling0328.inflow-scan.periodic            = true
sampling0328.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0328.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0328.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (15120.0 m, 5140.0 m, 0.0 m) -------------
sampling0329.output_frequency                = 1
sampling0329.fields                          = velocity temperature tke
sampling0329.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0329.inflow-bc-3D.type               = PlaneSampler
sampling0329.inflow-bc-3D.num_points         = 64 64
sampling0329.inflow-bc-3D.origin             = 14740.0 4820.0 0.0
sampling0329.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0329.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0329.inflow-scan.type                = LidarSampler
sampling0329.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0329.inflow-scan.length              = 996.0
sampling0329.inflow-scan.origin              = 15120.0 5140.0 120.0  # Lidar situated 3.0 m above hub height
sampling0329.inflow-scan.periodic            = true
sampling0329.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0329.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0329.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (15120.0 m, 5780.0 m, 0.0 m) -------------
sampling0330.output_frequency                = 1
sampling0330.fields                          = velocity temperature tke
sampling0330.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0330.inflow-bc-3D.type               = PlaneSampler
sampling0330.inflow-bc-3D.num_points         = 64 64
sampling0330.inflow-bc-3D.origin             = 14740.0 5460.0 0.0
sampling0330.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0330.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0330.inflow-scan.type                = LidarSampler
sampling0330.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0330.inflow-scan.length              = 996.0
sampling0330.inflow-scan.origin              = 15120.0 5780.0 120.0  # Lidar situated 3.0 m above hub height
sampling0330.inflow-scan.periodic            = true
sampling0330.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0330.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0330.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (15120.0 m, 6420.0 m, 0.0 m) -------------
sampling0331.output_frequency                = 1
sampling0331.fields                          = velocity temperature tke
sampling0331.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0331.inflow-bc-3D.type               = PlaneSampler
sampling0331.inflow-bc-3D.num_points         = 64 64
sampling0331.inflow-bc-3D.origin             = 14740.0 6100.0 0.0
sampling0331.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0331.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0331.inflow-scan.type                = LidarSampler
sampling0331.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0331.inflow-scan.length              = 996.0
sampling0331.inflow-scan.origin              = 15120.0 6420.0 120.0  # Lidar situated 3.0 m above hub height
sampling0331.inflow-scan.periodic            = true
sampling0331.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0331.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0331.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (15120.0 m, 7060.0 m, 0.0 m) -------------
sampling0332.output_frequency                = 1
sampling0332.fields                          = velocity temperature tke
sampling0332.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0332.inflow-bc-3D.type               = PlaneSampler
sampling0332.inflow-bc-3D.num_points         = 64 64
sampling0332.inflow-bc-3D.origin             = 14740.0 6740.0 0.0
sampling0332.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0332.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0332.inflow-scan.type                = LidarSampler
sampling0332.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0332.inflow-scan.length              = 996.0
sampling0332.inflow-scan.origin              = 15120.0 7060.0 120.0  # Lidar situated 3.0 m above hub height
sampling0332.inflow-scan.periodic            = true
sampling0332.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0332.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0332.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (15120.0 m, 7700.0 m, 0.0 m) -------------
sampling0333.output_frequency                = 1
sampling0333.fields                          = velocity temperature tke
sampling0333.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0333.inflow-bc-3D.type               = PlaneSampler
sampling0333.inflow-bc-3D.num_points         = 64 64
sampling0333.inflow-bc-3D.origin             = 14740.0 7380.0 0.0
sampling0333.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0333.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0333.inflow-scan.type                = LidarSampler
sampling0333.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0333.inflow-scan.length              = 996.0
sampling0333.inflow-scan.origin              = 15120.0 7700.0 120.0  # Lidar situated 3.0 m above hub height
sampling0333.inflow-scan.periodic            = true
sampling0333.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0333.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0333.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (15120.0 m, 8340.0 m, 0.0 m) -------------
sampling0334.output_frequency                = 1
sampling0334.fields                          = velocity temperature tke
sampling0334.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0334.inflow-bc-3D.type               = PlaneSampler
sampling0334.inflow-bc-3D.num_points         = 64 64
sampling0334.inflow-bc-3D.origin             = 14740.0 8020.0 0.0
sampling0334.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0334.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0334.inflow-scan.type                = LidarSampler
sampling0334.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0334.inflow-scan.length              = 996.0
sampling0334.inflow-scan.origin              = 15120.0 8340.0 120.0  # Lidar situated 3.0 m above hub height
sampling0334.inflow-scan.periodic            = true
sampling0334.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0334.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0334.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (15120.0 m, 8980.0 m, 0.0 m) -------------
sampling0335.output_frequency                = 1
sampling0335.fields                          = velocity temperature tke
sampling0335.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0335.inflow-bc-3D.type               = PlaneSampler
sampling0335.inflow-bc-3D.num_points         = 64 64
sampling0335.inflow-bc-3D.origin             = 14740.0 8660.0 0.0
sampling0335.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0335.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0335.inflow-scan.type                = LidarSampler
sampling0335.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0335.inflow-scan.length              = 996.0
sampling0335.inflow-scan.origin              = 15120.0 8980.0 120.0  # Lidar situated 3.0 m above hub height
sampling0335.inflow-scan.periodic            = true
sampling0335.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0335.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0335.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (15120.0 m, 9620.0 m, 0.0 m) -------------
sampling0336.output_frequency                = 1
sampling0336.fields                          = velocity temperature tke
sampling0336.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0336.inflow-bc-3D.type               = PlaneSampler
sampling0336.inflow-bc-3D.num_points         = 64 64
sampling0336.inflow-bc-3D.origin             = 14740.0 9300.0 0.0
sampling0336.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0336.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0336.inflow-scan.type                = LidarSampler
sampling0336.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0336.inflow-scan.length              = 996.0
sampling0336.inflow-scan.origin              = 15120.0 9620.0 120.0  # Lidar situated 3.0 m above hub height
sampling0336.inflow-scan.periodic            = true
sampling0336.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0336.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0336.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (15120.0 m, 10260.0 m, 0.0 m) -------------
sampling0337.output_frequency                = 1
sampling0337.fields                          = velocity temperature tke
sampling0337.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0337.inflow-bc-3D.type               = PlaneSampler
sampling0337.inflow-bc-3D.num_points         = 64 64
sampling0337.inflow-bc-3D.origin             = 14740.0 9940.0 0.0
sampling0337.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0337.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0337.inflow-scan.type                = LidarSampler
sampling0337.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0337.inflow-scan.length              = 996.0
sampling0337.inflow-scan.origin              = 15120.0 10260.0 120.0  # Lidar situated 3.0 m above hub height
sampling0337.inflow-scan.periodic            = true
sampling0337.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0337.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0337.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (15120.0 m, 10900.0 m, 0.0 m) -------------
sampling0338.output_frequency                = 1
sampling0338.fields                          = velocity temperature tke
sampling0338.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0338.inflow-bc-3D.type               = PlaneSampler
sampling0338.inflow-bc-3D.num_points         = 64 64
sampling0338.inflow-bc-3D.origin             = 14740.0 10580.0 0.0
sampling0338.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0338.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0338.inflow-scan.type                = LidarSampler
sampling0338.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0338.inflow-scan.length              = 996.0
sampling0338.inflow-scan.origin              = 15120.0 10900.0 120.0  # Lidar situated 3.0 m above hub height
sampling0338.inflow-scan.periodic            = true
sampling0338.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0338.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0338.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (15120.0 m, 11540.0 m, 0.0 m) -------------
sampling0339.output_frequency                = 1
sampling0339.fields                          = velocity temperature tke
sampling0339.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0339.inflow-bc-3D.type               = PlaneSampler
sampling0339.inflow-bc-3D.num_points         = 64 64
sampling0339.inflow-bc-3D.origin             = 14740.0 11220.0 0.0
sampling0339.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0339.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0339.inflow-scan.type                = LidarSampler
sampling0339.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0339.inflow-scan.length              = 996.0
sampling0339.inflow-scan.origin              = 15120.0 11540.0 120.0  # Lidar situated 3.0 m above hub height
sampling0339.inflow-scan.periodic            = true
sampling0339.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0339.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0339.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (15120.0 m, 12180.0 m, 0.0 m) -------------
sampling0340.output_frequency                = 1
sampling0340.fields                          = velocity temperature tke
sampling0340.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0340.inflow-bc-3D.type               = PlaneSampler
sampling0340.inflow-bc-3D.num_points         = 64 64
sampling0340.inflow-bc-3D.origin             = 14740.0 11860.0 0.0
sampling0340.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0340.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0340.inflow-scan.type                = LidarSampler
sampling0340.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0340.inflow-scan.length              = 996.0
sampling0340.inflow-scan.origin              = 15120.0 12180.0 120.0  # Lidar situated 3.0 m above hub height
sampling0340.inflow-scan.periodic            = true
sampling0340.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0340.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0340.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (15120.0 m, 12820.0 m, 0.0 m) -------------
sampling0341.output_frequency                = 1
sampling0341.fields                          = velocity temperature tke
sampling0341.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0341.inflow-bc-3D.type               = PlaneSampler
sampling0341.inflow-bc-3D.num_points         = 64 64
sampling0341.inflow-bc-3D.origin             = 14740.0 12500.0 0.0
sampling0341.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0341.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0341.inflow-scan.type                = LidarSampler
sampling0341.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0341.inflow-scan.length              = 996.0
sampling0341.inflow-scan.origin              = 15120.0 12820.0 120.0  # Lidar situated 3.0 m above hub height
sampling0341.inflow-scan.periodic            = true
sampling0341.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0341.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0341.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (15120.0 m, 13460.0 m, 0.0 m) -------------
sampling0342.output_frequency                = 1
sampling0342.fields                          = velocity temperature tke
sampling0342.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0342.inflow-bc-3D.type               = PlaneSampler
sampling0342.inflow-bc-3D.num_points         = 64 64
sampling0342.inflow-bc-3D.origin             = 14740.0 13140.0 0.0
sampling0342.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0342.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0342.inflow-scan.type                = LidarSampler
sampling0342.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0342.inflow-scan.length              = 996.0
sampling0342.inflow-scan.origin              = 15120.0 13460.0 120.0  # Lidar situated 3.0 m above hub height
sampling0342.inflow-scan.periodic            = true
sampling0342.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0342.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0342.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (15120.0 m, 14100.0 m, 0.0 m) -------------
sampling0343.output_frequency                = 1
sampling0343.fields                          = velocity temperature tke
sampling0343.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0343.inflow-bc-3D.type               = PlaneSampler
sampling0343.inflow-bc-3D.num_points         = 64 64
sampling0343.inflow-bc-3D.origin             = 14740.0 13780.0 0.0
sampling0343.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0343.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0343.inflow-scan.type                = LidarSampler
sampling0343.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0343.inflow-scan.length              = 996.0
sampling0343.inflow-scan.origin              = 15120.0 14100.0 120.0  # Lidar situated 3.0 m above hub height
sampling0343.inflow-scan.periodic            = true
sampling0343.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0343.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0343.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

# ------------- Sampling parameters for one imaginary turbine at (15120.0 m, 14740.0 m, 0.0 m) -------------
sampling0344.output_frequency                = 1
sampling0344.fields                          = velocity temperature tke
sampling0344.labels                          = inflow-bc-3D inflow-scan

# Inflow boundary condition plane, 3D
sampling0344.inflow-bc-3D.type               = PlaneSampler
sampling0344.inflow-bc-3D.num_points         = 64 64
sampling0344.inflow-bc-3D.origin             = 14740.0 14420.0 0.0
sampling0344.inflow-bc-3D.axis1              = 0.0 630.0 0.0
sampling0344.inflow-bc-3D.axis2              = 0.0 0.0 630.0

sampling0344.inflow-scan.type                = LidarSampler
sampling0344.inflow-scan.num_points          = 83    # Range gate resolution of 12.0 m
sampling0344.inflow-scan.length              = 996.0
sampling0344.inflow-scan.origin              = 15120.0 14740.0 120.0  # Lidar situated 3.0 m above hub height
sampling0344.inflow-scan.periodic            = true
sampling0344.inflow-scan.time_table          = 0.0   0.25  0.5   0.75  1.0   1.25  1.5   1.75  2.0   2.25  2.5   2.75  3.0   3.25  3.5   3.75  4.0   4.25  4.5   4.75  5.0   5.25  5.5   5.75  6.0   6.25  6.5   6.75  7.0   7.25  7.5   7.75  8.0   8.25  8.5   8.75  9.0   9.25  9.5   9.75  10.0  10.25 10.5  10.75 11.0  11.25 11.5  11.75 12.0  12.25 12.5  12.75 13.0  13.25 13.5  13.75 14.0  14.25 14.5  14.75 15.0  15.25 15.5  15.75 16.0  18.0 
sampling0344.inflow-scan.azimuth_table       = 195.0 195.0 195.0 195.0 193.0 193.0 193.0 193.0 191.0 191.0 191.0 191.0 189.0 189.0 189.0 189.0 187.0 187.0 187.0 187.0 185.0 185.0 185.0 185.0 183.0 183.0 183.0 183.0 181.0 181.0 181.0 181.0 179.0 179.0 179.0 179.0 177.0 177.0 177.0 177.0 175.0 175.0 175.0 175.0 173.0 173.0 173.0 173.0 171.0 171.0 171.0 171.0 169.0 169.0 169.0 169.0 167.0 167.0 167.0 167.0 165.0 165.0 165.0 165.0 0.0   0.0  
sampling0344.inflow-scan.elevation_table     = 0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   0.0   45.0  45.0 

#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#              AVERAGING                #
#.......................................#


#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#            MESH REFINEMENT            #
#.......................................#


#¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨#
#               TURBINES                #
#.......................................#
