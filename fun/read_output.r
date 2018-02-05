read_output = function(loc = '~/mscripts/scope4r/SCOPE_v1.70/output/'){

library(readr)

#loc = '~/mscripts/scope4r/SCOPE_v1.70/output/standard_r_run_2018-01-25-1746/'
#loc = '~/mscripts/scope4r/SCOPE_v1.70/output/'

newloc = list.files(loc)
fullpath = paste(loc,sort(newloc[which(substr(newloc,1,4) == 'run_')],decreasing=T)[1],'/',sep='')
fullpath = '/home/yoga/home_package/C4_2018-01-31-0023/'

#File list
flist = list.files(path = fullpath)

#Function for the typical, 2 columns worth of header, all numerical columns type of output
#-------------------------------------#
typical = function(file,newvar){

  if(any(flist == file)){
  
    #dat <- read_table(paste(fullpath,file,sep=''),col_names = FALSE, skip = 2)
  
    dat <- read_table2(paste(fullpath,file,sep=''),col_names = FALSE, skip = 2)
    
    cnames <- apply(read.table(paste(fullpath,file,sep=''),header = FALSE, nrow=1),1,as.character)
    
    colnames(dat) = cnames
  
    assign(newvar,dat,envir = .GlobalEnv)
  }
}
#-------------------------------------#

#VERTPROF - function to read in outputs that give the vertical profile info
#-------------------------------------#
vertprof = function(file,newvar){
  if(any(flist == file)){
    dat <- read_table2(paste(fullpath,file,sep=''), col_names = FALSE)
    colnames(dat) = paste('layer',sprintf('%02d',1:ncol(dat)),sep='')
    assign(newvar,dat,envir = .GlobalEnv)
  }
}
#-------------------------------------#

#VERTPROF_whead - function to read in outputs that give the vertical profile info - files with headers
#-------------------------------------#
vertprof_whead = function(file,newvar){
  if(any(flist == file)){
    dat <- read_table2(paste(fullpath,file,sep=''), col_names = FALSE,skip = 2)
    colnames(dat) = paste('layer',sprintf('%02d',1:ncol(dat)),sep='')
    assign(newvar,dat,envir = .GlobalEnv)
  }
}
#-------------------------------------#

#RADSPEC - function to read in the output files with the full rad. spectrum
#------------------------------------
#read in header outside of the function
if(any(flist == 'wl.dat')){
  wl <- read_table2(paste(fullpath,'wl.dat',sep=''),col_names = FALSE, skip = 2)
  wl = wl[which(is.na(wl) == F)]
  wl = paste('nm',wl,sep='')
  }
radspec = function(file,newvar){
  if(any(flist == file)){
    dat <- read_table2(paste(fullpath,file,sep=''), col_names = FALSE, skip = 2)
    if(ncol(dat) > length(wl)){dat = dat[,1:length(wl)]}
    colnames(dat) = wl
    assign(newvar,dat,envir = .GlobalEnv)
  }
}
#-------------------------------------#

#FLUREAD - function to read in fluorescence outputs
#-------------------------------------#
fluread = function(file,newvar){
  if(any(flist == file)){
    cnames = paste('nm',640:850,sep='')
    dat <- read_table2(paste(fullpath,file,sep=''), col_names = FALSE, skip = 2)
    if(ncol(dat) > length(cnames)){dat = dat[,1:length(cnames)]}
    colnames(dat) = cnames
    assign(newvar,dat,envir = .GlobalEnv)
  }
}
#-------------------------------------#

#"typical" data files
typical('fluxes.dat','fluxes')
typical('surftemp.dat','surftemp')
typical('aerodyn.dat','aerodyn')
typical('radiation.dat','radiation')

#Vertical profile files
vertprof('layer_h.dat','layer_h')
vertprof('layer_le.dat','layer_le')
vertprof('layer_rn.dat','layer_rn')
vertprof('layer_a.dat','layer_a')
vertprof_whead('layer_aPAR.dat','layer_aPAR')
vertprof_whead('layer_aPAR_Cab.dat','layer_aPAR_Cab')
vertprof_whead('layer_NPQ.dat','layer_NPQ')
vertprof_whead('layer_fluorescence.dat','layer_fluorescence')

#full spectrum files
radspec('spectrum_hemis_optical.dat','spectrum_hemis_optical')
radspec('spectrum_obsdir_BlackBody.dat','spectrum_obsdir_BlackBody')
radspec('spectrum_obsdir_optical.dat','spectrum_obsdir_optical')
radspec('irradiance_spectra.dat','irradiance_spectra')
radspec('reflectance.dat','reflectance')
radspec('irradiance_spectra.dat','irradiance_spectra')

#flourescence spectrum files
fluread('fluorescence.dat','fluorescence')
fluread('fluorescence_emitted_by_all_leaves.dat','fluorescence_emitted_by_all_leaves')
fluread('fluorescence_emitted_by_all_photosystems.dat','fluorescence_emitted_by_all_photosystems')
fluread('fluorescence_hemis.dat','fluorescence_hemis')
fluread('fluorescence_scattered.dat','fluorescence_scattered')
fluread('fluorescence_shaded.dat','fluorescence_shaded')
fluread('fluorescence_sunlit.dat','fluorescence_sunlit')


#Read in gap layer file w/ its own commands - it has columns for sunlit, shaded and averaged leaves for each layer, including soil
#-------------------------------------#
if(any(flist == 'gap.dat')){
  gap <<- read_table2(paste(fullpath,"gap.dat",sep=''),col_names = FALSE, skip = 2)
  nlay = ncol(gap)/3
  colnames(gap) = c(paste('Sunlit_frac',sprintf('%02d',1:nlay),sep='_'),
                    paste('Viewed_frac',sprintf('%02d',1:nlay),sep='_'),
                    paste('Sunlit_viewed_frac',sprintf('%02d',1:nlay),sep='_'))
}
#-------------------------------------#

#Read in leaf temperature layer file w/ its own commands - it has columns for sunlit, shaded and averaged leaves for each layer
#-------------------------------------#
if(any(flist == 'leaftemp.dat')){
  leaftemp <<- read_table2(paste(fullpath,'leaftemp.dat',sep=''),col_names = FALSE, skip = 2)
  nlay = ncol(leaftemp)/3
  colnames(leaftemp) = c(paste('Tl_sun',sprintf('%02d',1:nlay),sep='_'),
                         paste('Tl_shade',sprintf('%02d',1:nlay),sep='_'),
                         paste('Tl_ave',sprintf('%02d',1:nlay),sep='_'))
}
#-------------------------------------#

#Read in BOC_irradiance file w/ its own commands - it has columns for shaded and average (shaded and sunlit) values
#-------------------------------------#
if(any(flist == 'BOC_irradiance.dat')){
  BOC_irradiance <<- read_table2(paste(fullpath,'BOC_irradiance.dat',sep=''),col_names = FALSE, skip = 2)
  colnames(BOC_irradance) = c(paste('shaded_',wl,sep=''),paste('ave_',wl,sep=''))
}
#-------------------------------------#

}
                                                    
    