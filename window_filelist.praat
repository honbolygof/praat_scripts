d$  =  "D:\KiserletiElrendezesek\IKM\stimuli\stim_rms\"
out$ = "D:\KiserletiElrendezesek\IKM\stimuli\stim_rms_window\"
Create Strings as file list... list 'd$'/*.wav
numberOfFiles = Get number of strings

clearinfo

for ifile from 1 to numberOfFiles
    select Strings list
    a$ = Get string... 'ifile'
    Read from file... 'd$''a$'
    #select Sound 'a$'
	vege = Get finishing time
	Formula... if x<0.010 then self*(x-0)/0.010 else self fi
	Formula... if x>(vege-0.010) then self*(vege-x)/0.010 else self fi
   Write to WAV file... 'out$''a$'.wav
endfor

exit vége van