make_setoptions = function(N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,N15,N16,N17,N18,N19){

out = 'N=['
out[2] = paste(N1,';',sep='')
out[3] = paste(N2,';',sep='')
out[4] = paste(N3,';',sep='')
out[5] = paste(N4,';',sep='')
out[6] = paste(N5,';',sep='')
out[7] = paste(N6,';',sep='')
out[8] = paste(N7,';',sep='')
out[9] = paste(N8,';',sep='')
out[10] = paste(N9,';',sep='')
out[11] = paste(N10,';',sep='')
out[12] = paste(N11,';',sep='')
out[13] = paste(N12,';',sep='')
out[14] = paste(N13,';',sep='')
out[15] = paste(N14,';',sep='')
out[16] = paste(N15,';',sep='')
out[17] = paste(N16,';',sep='')
out[18] = paste(N17,';',sep='')
out[19] = paste(N18,'];',sep='')
write(out,file = paste(maindir,'SCOPE_v1.70/setoptions.m',sep=''))
}