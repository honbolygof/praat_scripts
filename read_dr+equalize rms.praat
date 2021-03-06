#this scripts takes all sounds from the directory 'd$'
#and equalizes them in RMS with prevention of clipping
#and write them to the directory 'out$'

d$  =  "/Users/honbolygo/Documents/palyazatok/actual/OTKA_NK_2011/RS_stress/inger/álszavak/segmented_all/"
out$ = "/Users/honbolygo/Documents/palyazatok/actual/OTKA_NK_2011/RS_stress/inger/álszavak/segmented_all/rms/"
Create Strings as file list... list 'd$'/*.wav
numberOfFiles = Get number of strings

#initializing the maximal possible RMS value to 1
#woud mean that the whole sound is at maximum
rms_max = 1
clearinfo


for ifile from 1 to numberOfFiles
   selectObject: "Strings list"
   a$ = Get string... 'ifile'
   Read from file... 'd$''a$'
   max = Get absolute extremum... 0 0 Sinc70
   rms = Get root-mean-square... 0 0 
   rms_max_now = (0.6/'max') * 'rms'
   if rms_max_now < rms_max
         rms_max = rms_max_now
  endif
  rms'ifile' = rms
  #remember the rms values of all files in the array rms1, rms2, rms3, ....
endfor
printline rms value for all sounds is 'rms_max'

for ifile from 1 to numberOfFiles
   selectObject: "Strings list"
   a$ = Get string... 'ifile'
   l = length(a$) -4
   a$ = left$(a$,l)
  select Sound 'a$'
  rms = rms'ifile'  
  Formula... self  * 'rms_max'/'rms'
  Write to WAV file... 'out$''a$'.wav
endfor
