make_set_parameter_filenames = function(){
  
  out = paste('X = {',
              "'Simulation_Name','",Simulation_Name,"';",
              "'soil_file','",soil_file,"';",
              "'leaf_file','",leaf_file,"';",
              "'atmos_file','",atmos_file,"';",
              '};'
              
              
              
              
              
              
              
              
              ,sep='')
  #This style works! No sked um go get um
  
  write(out,file = paste(maindir,'SCOPE_v1.70/filenames.m',sep=''))
  
  
  
  
  
  
  
  
  
  
}