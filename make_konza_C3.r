library(gdata)
source('~/scope4r/rscripts/fun/make_setoptions.r')
source('~/scope4r/rscripts/fun/make_inputdata.r')
allglobal <- function(){list2env(mget(ls(name = parent.frame()), envir = parent.frame()), envir = .GlobalEnv)}
#NOTE: working directory when scope is being run must be 
#~/mscripts/scope4r/SCOPE_v1.70/code/

#Similarly, 

#Path to main scope directory
maindir = '~/scope4r/'

#BUILD OPTIONS FILE
#--------------------------------------------------------------#
N1 = 1 		 #calc_ebal		            calculate the complete energy balance?
N2 = 1 		 #calc_vert_profiles	  	calculate vertical profiles of fluxes and temperatures?
N3 = 1 		 #calc_fluor	          	calculate chlorophyll fluorescence?
N4 = 0 		 #calc_planck	          	calculate spectrum of thermal radiation with spectral emissivity instead of broadband?
N5 = 0 		 #calc_directional		    calculate BRDF and directional temperature for many angles specified in a file. Be patient, this takes some time
N6 = 1     #calc_xanthophyllabs	  	calculate dynamic xanthopyll absorption (zeaxanthin)?
N7 = 0     #calc_PSI              0 (recommended): treat the whole fluorescence spectrum as one spectrum (new calibrated optipar), 1: differentiate PSI and PSII with Franck et al. spectra (of SCOPE 1.62 and older)
N8 = 0 		 #rt_thermal		        0: provide emissivity values as input. 1: use values from fluspect and soil at 2400 nm for the TIR range
N9 = 0  	 #calc_zo		            0: use the zo and d values provided in the inputdata, 1: calculate zo and d from the LAI, canopy height, CD1, CR, CSSOIL (recommended if LAI changes in time series)
N10 = 0    #                      0: use soil spectrum from a file, 1: simulate soil spectrum with the BSM model
N11 = 0 	 #SoilHeatMethod		    0: standard calculation of thermal inertia from soil characteristics, 1: empiricaly calibrated formula (make function), 2: as constant fraction of soil net radiation
N12 = 1 	 #Fluorescence_model		0: empirical, with sustained NPQ (fit to Flexas' data)  1: empirical, with sigmoid for Kn  2: Magnani 2012 model
N13 = 0 	 #calc_rss_rbs		      0: use resistance rss and rbs as provided in inputdata. 1:  calculate rss from soil moisture content and correct rbs for LAI (calc_rssrbs.m)
N14 = 1 	 #applTcorr		            correct Vcmax and rate constants for temperature in biochemical.m?
N15 = 0 	 #verify		              verifiy the results (compare to saved 'standard' output) to test the code for the first time?
N16 = 1 	 #saveheaders	        	  write header lines in output files?
N17 = 0 	 #makeplots 	         	  plot the results?
N18 = 1 	 #simulation		       0: individual runs. Specify one value for constant input, and an equal number (>1) of values for all input that varies between the runs.

#Build file
make_setoptions(N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,N15,N16,N17,N18,N19)
#--------------------------------------------------------------#


#BUILD INPUT FILE
#--------------------------------------------------------------#
#PROSPECT								
Cab         =	80					# ug cm-2	    Chlorophyll AB content
Cca         = 20 					# ug cm-2	    Carotenoid content, usually 25 percent of Chlorophyll
Cdm	        = 0.012				# g cm-2	    Dry matter content
Cw	        = 0.009				# cm     	    leaf water equivalent layer
Cs          =	0						# fraction	  scenecent material fraction
Cant        = 0 					# ug cm-2     Anthocyanins
N	          = 1.4					#[]	          leaf thickness parameters
rho_thermal = 0.01				#             broadband thermal reflectance
tau_thermal	= 0.01				#             broadband thermal transmittance

#Leaf_Biochemical								
Vcmo       = 55						            #umol m-2 s-1	  maximum carboxylation capacity (at optimum temperature)
m	         = 8							          #               Ball-Berry stomatal conductance parameter
BallBerry0 = 0.01                     #               Adam is not sure if this is real or not. It is not listed in assignvarnames.m. leave it be
Type	     = 0							          #               Photochemical pathway: 0=C3, 1=C4
kV	       = 0.6396					  		    #               extinction coefficient for Vcmax in the vertical (maximum at the top). 0 for uniform Vcmax
Rdparam	   = 0.015							      #               Respiration = Rdparam*Vcmcax
Tparam	   = c(0.2,0.3,281,308,328)   #		          	See PFT.xls. These are five parameters specifying the temperature response.

#Leaf_Biochemical (magnani model)												
Tyear        = 15						 # ºC	      mean annual temperature		
beta         = 0.507				 # []    	  "fraction of photons partitioned to PSII (0.507 for C3, 0.4 for C4; Yin et al. 2006; Yin and Struik 2012)"		
kNPQs        = 0						 # [s-1]	  rate constant of sustained thermal dissipation (Porcar-Castell 2011)			
qLs	         = 1						 # []	      fraction of functional reaction centres (Porcar-Castell 2011)
stressfactor = 1			       #				  "optional input: stress factor to reduce Vcmax (for example soil moisture, leaf age). Default value = 1."	

#Fluorescence								
fqe =	0.01						       #        fluorescence quantum yield efficiency at photosystem level

#Soil								
spectrum      =	1							#                Spectrum number (column in the database soil_file)
rss           =	500						# s m-1	         soil resistance for evaporation from the pore space
rs_thermal    = 0.06					#		             broadband soil reflectance in the thermal range (1-emissivity)
cs            = 1.18E+03			# J kg-1 K-1     specific heat capacity of the soil
rhos          = 1.80E+03			# kg m-3	       specific mass of the soil
lambdas       = 1.55					# J m-1 K-1	     heat conductivity of the soil
SMC           = 0.25					#                volumetric soil moisture content in the root zone
BSMBrightness	= 0.5						#                BSM model parameter for soil brightness
BSMlat        = 25						#	               BSM model parameter 'lat'
BSMlon        = 45						#	               BSM model parameter  'long'

#Canopy								
LAI	      = 3						# m2 m-2	Leaf area index
hc	      = 2						# meter  	vegetation height
LIDFa	    = -0.35 			# 				leaf inclination
LIDFb	    = -0.15				#   			variation in leaf inclination
leafwidth =	0.1					#	meter	  leaf width

#Meteo (values in data files, in the time series option, can overrule these values)								
z	  = 10						#meter	       measurement height of meteorological data
Rin	= 600						#W m-2	       broadband incoming shortwave radiation (0.4-2.5 um)
Ta	= 20						#T             air temperature
Rli	= 300						#W m-2         broadband incoming longwave radiation (2.5-50 um)
p	  = 970						#hPa	         air pressure
ea	= 15						#hPa	         atmospheric vapour pressure
u	  = 2						  #ms-1	         wind speed at height z_
Ca	= 380						#ppm        	 atmospheric CO2 concentration
Oa	= 209						#per mille	   atmospheric O2 concentration

#Aerodynamic								
zo	   = 0.246			# meter	     roughness length for momentum of the canopy
d	     = 1.34				# meter	     displacement height
Cd	   = 0.3				#            leaf drag coefficient
rb	   = 10					# s m-1	     leaf boundary resistance
CR	   = 0.35				#            Verhoef et al. (1997)  Drag coefficient for isolated tree 
CD1	   = 20.6				#			       Verhoef et al. (1997)  fitting parameter
Psicor = 0.2				#			       Verhoef et al. (1997)  Roughness layer correction
CSSOIL = 0.01				#			       Verhoef et al. (1997) Drag coefficient for soil
rbs	   = 10					#	s m-1	     soil boundary layer resistance
rwc	   =0						# s m-1      within canopy layer resistance

#timeseries (this option is only for time series)								
startDOY = 169		# Julian day (decimal) of start of simulations
endDOY	 = 170			# Julian day (decimal) of end of simulations
LAT	     = -96.5		# decimal deg	Latitude
LON	     = 39.15			# decimal deg	Longitude
timezn 	 = 6				# hours	east of Greenwich

#Angles								
tts	     = 30				# deg	      solar zenith angle
tto	     = 0			  # deg	      observation zenith angle
psi	     = 90			  # deg     	azimuthal difference between solar and observation angle

#Build file
allglobal()
make_inputdata()
#--------------------------------------------------------------#


#Read the outputs
#--------------------------------------------------------------#






#--------------------------------------------------------------#