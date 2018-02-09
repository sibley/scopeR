library(gdata)
library(readr)
library(R.matlab)
source('~/scope4r/scopeR/fun/make_setoptions.r')
source('~/scope4r/scopeR/fun/make_inputdata.r')
source('~/scope4r/scopeR/fun/read_output.r')
source('~/scope4r/scopeR/fun/make_filenames.r')


read_output(loc = '~/scope4r/SCOPE_v1.70/output/WR_noco2/',fullprovided = T)


tid = which(fluxes$t >= 175 & fluxes$t < 181)
TS = fluxes$t[tid]

plot(x = TS,
     y = pars_and_input$Ta[tid],
     ylim = range(leaftemp[tid,],na.rm=T),
     xlab = 'DOY',
     ylab = 'T (deg C)',
     main = 'Wind River',
     lwd = 2,
     type = 'l',
     col = 'blue')

lines(x = TS, y = leaftemp$X1[tid],col = 'darkgreen',lwd=2)
lines(x = TS, y = leaftemp$X61[tid],col = 'green',lwd = 2)
legend(x = 'topleft',lwd=2,lty=1,legend = c('Tair','Tleaf (Sunlit)', 'Tleaf (Shaded)'),col = c('Blue','Darkgreen','Green'))


plot(x = TS,
     y = leaftemp$X1[tid],
     ylim = range(leaftemp[tid,],na.rm=T),
     xlab = 'DOY',
     ylab = 'T (deg C)',
     main = 'Leaf Temperatures - Shaded',
     type = 'l',
     lwd = 2,
     col = 'Darkgreen')

plotcolors = list(color = colorRampPalette(c('darkgreen','green'))(60))

for(i in 61:120){
  lines(x = TS,
        y = leaftemp[tid,i][[1]],
        col = plotcolors$color[i-60])
}


plot(x = TS,
     y = as.numeric(layer_h[tid,1][[1]]),
     #ylim = range(layer_h[tid,],na.rm=T),
     xlab = 'DOY',
     ylab = 'Sensible heat flux (W/m2)',
     main = 'Sensible heat by layer',
     type = 'l',
     lwd = 2,
     col = 'darkgreen')

plotcolors = list(color = colorRampPalette(c('darkgreen','green'))(60))

for(i in 2:60){
  lines(x = TS,
        y = layer_h[tid,i][[1]],
        col = plotcolors$color[i])
}


fluxes_noco = fluxes

read_output(loc = '~/scope4r/SCOPE_v1.70/output/WR_wco2/',fullprovided = T)

plot(x = fluxes_noco$Actot[tid],
     y = fluxes$Actot[tid],
     xlab = 'No CO2 data run',
     ylab = 'W/ CO2 data run',
     main = 'Actot (umol m-2 s-1)'
     )
lines(x = seq(-100,100),y = seq(-100,100),lwd = 2,col = 'darkgrey')


plot(x = fluxes_noco$fluortot[tid],
     y = fluxes$fluortot[tid],
     xlab = 'No CO2 data run',
     ylab = 'W/ CO2 data run',
     main = 'Ch Fluorescence at TOC (W/m2)'
)
lines(x = seq(-100,100),y = seq(-100,100),lwd = 2,col = 'darkgrey')





