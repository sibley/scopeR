read_output = function(loc = '~/mscripts/scope4r/SCOPE_v1.70/output/'){

library(readr)

#loc = '~/mscripts/scope4r/SCOPE_v1.70/output/standard_r_run_2018-01-25-1746/'
#loc = '~/mscripts/scope4r/SCOPE_v1.70/output/'

newloc = list.files(loc)
fullpath = paste(loc,sort(newloc[which(substr(newloc,1,4) == 'run_')],decreasing=T)[1],'/',sep='')
fullpath = '/home/sibley/scope4r/SCOPE_v1.70/output/C3_2018-01-31-0029/'

#File list
flist = list.files(path = fullpath)



#Function for the typical, 2 columns worth of header, all numerical columns type of output
#-------------------------------------#
typical = function(file,newvar){

  if(any(flist == file)){
  
    dat <- read_table(paste(fullpath,file,sep=''),col_names = FALSE, skip = 2)
  
    cnames <- as.character(read.table(paste(fullpath,file,sep=''),header = FALSE, nrow=1))
    
    colnames(dat) = cnames
  
    assign(newvar,dat,envir = .GlobalEnv)
  }
}
#newvar = 'aerodyn'
#file = 'aerodyn.dat'
#typical(file,newvar)
#-------------------------------------#

#Write a function for the vertical profiles files 

#Write a function for the files where the columns are wavelengths specified in the wl.dat file (just a list of wavelengths)

#Write a function for fluorescence files (use a different range of wavelengths)

#fluxes
typical('fluxes.dat','fluxes')

#surftemp.dat
typical('surftemp.dat','surftemp')

#aerodyn
typical('aerdyn.dat','aerodyn')

#radiation
typical('radiation.dat','radiation')



#gap - not typical!
typical('gap.dat','gap')


#BOC_irradiance - Not typical!
typical('BOC_irradiance.dat','BOC_irradiance')



}