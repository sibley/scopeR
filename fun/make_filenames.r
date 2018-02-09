make_filenames = function(){
  
  out = paste('X = {',
              "'Simulation_Name','",Simulation_Name,"';",
              "'soil_file','",soil_file,"';",
              "'leaf_file','",leaf_file,"';",
              "'atmos_file','",atmos_file,"';",
              "'Dataset_dir','",Dataset_dir,"';",
              "'t_file','",t_file,"';",
              "'year_file','",year_file,"';",
              "'Rin_file','",Rin_file,"';",
              "'Rli_file','",Rli_file,"';",
              "'p_file','",p_file,"';",
              "'Ta_file','",Ta_file,"';",
              "'ea_file','",ea_file,"';",
              "'u_file','",u_file,"';",
              "'CO2_file','",CO2_file,"';",
              "'z_file','",z_file,"';",
              "'tts_file','",tts_file,"';",
              "'LAI_file','",LAI_file,"';",
              "'hc_file','",hc_file,"';",
              "'SMC_file','",SMC_file,"';",
              "'Vcmax_file','",Vcmax_file,"';",
              "'Cab_file','",Cab_file,"';",
              "'LIDF_file','",LIDF_file,
              "'};",
               sep='')
  
  write(out,file = paste(maindir,'SCOPE_v1.70/filenames.m',sep=''))
  
  
  
  
  
  
  
  
  
  
}