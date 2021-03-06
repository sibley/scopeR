make_inputdata = function(){

  BallBerry = 0
  
 out = paste(
    'Cab',paste(Cab,collapse=' '),
    'Cca',paste(Cca,collapse=' '),
    'Cdm',paste(Cdm,collapse=' '),
    'Cw',paste(Cw,collapse=' '),
    'Cs',paste(Cs,collapse=' '),
    'Cant',paste(Cant,collapse=' '),
    'N',paste(N,collapse=' '),
    'rho_thermal',paste(rho_thermal,collapse=' '),
    'tau_thermal',paste(tau_thermal,collapse=' '),
    'Vcmo',paste(Vcmo,collapse=' '),
    'm',paste(m,collapse=' '),
    'BallBerry',paste(BallBerry,collapse=' '),
    'Type',paste(Type,collapse=' '),
    'kV',paste(kV,collapse=' '),
    'Rdparam',paste(Rdparam,collapse=' '),
    'Tparam',paste(Tparam,collapse=' '),
    'Tyear',paste(Tyear,collapse=' '),
    'beta',paste(beta,collapse=' '),
    'kNPQs',paste(kNPQs,collapse=' '),
    'qLs',paste(qLs,collapse=' '),
    'stressfactor',paste(stressfactor,collapse=' '),
    'fqe',paste(fqe,collapse=' '),
    'spectrum',paste(spectrum,collapse=' '),
    'rss',paste(rss,collapse=' '),
    'rs_thermal',paste(rs_thermal,collapse=' '),
    'cs',paste(cs,collapse=' '),
    'rhos',paste(rhos,collapse=' '),
    'lambdas',paste(lambdas,collapse=' '),
    'SMC',paste(SMC,collapse=' '),
    'BSMBrightness',paste(BSMBrightness,collapse=' '),
    'BSMlat',paste(BSMlat,collapse=' '),
    'BSMlon',paste(BSMlon,collapse=' '),
    'LAI',paste(LAI,collapse=' '),
    'hc',paste(hc,collapse=' '),
    'LIDFa',paste(LIDFa,collapse=' '),
    'LIDFb',paste(LIDFb,collapse=' '),
    'leafwidth',paste(leafwidth,collapse=' '),
    'z',paste(z,collapse=' '),
    'Rin',paste(Rin,collapse=' '),
    'Ta',paste(Ta,collapse=' '),
    'Rli',paste(Rli,collapse=' '),
    'p',paste(p,collapse=' '),
    'ea',paste(ea,collapse=' '),
    'u',paste(u,collapse=' '),
    'Ca',paste(Ca,collapse=' '),
    'Oa',paste(Oa,collapse=' '),
    'zo',paste(zo,collapse=' '),
    'd',paste(d,collapse=' '),
    'Cd',paste(Cd,collapse=' '),
    'rb',paste(rb,collapse=' '),
    'CR',paste(CR,collapse=' '),
    'CD1',paste(CD1,collapse=' '),
    'Psicor',paste(Psicor,collapse=' '),
    'CSSOIL',paste(CSSOIL,collapse=' '),
    'rbs',paste(rbs,collapse=' '),
    'rwc',paste(rwc,collapse=' '),
    'startDOY',paste(startDOY,collapse=' '),
    'endDOY',paste(endDOY,collapse=' '),
    'LAT',paste(LAT,collapse=' '),
    'LON',paste(LON,collapse=' '),
    'timezn',paste(timezn,collapse=' '),
    'tts',paste(tts,collapse=' '),
    'tto',paste(tto,collapse=' '),
    'psi',paste(psi,collapse=' '),
    'ENDFILE',sep = ' ')


write(out,file = paste(maindir,'SCOPE_v1.70/inputdata.txt',sep=''))
}