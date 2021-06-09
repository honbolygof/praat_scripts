
for i from 1 to 50


Read from file... D:\Documents\Experiments\fmri\presentation\picture_sound_match\stim\hang\rename\hang'i'.wav


select Sound hang'i'

vege = Get finishing time
Formula... if x<0.010 then self*(x-0)/0.010 else self fi
Formula... if x>(vege-0.010) then self*(vege-x)/0.010 else self fi

Write to WAV file... D:\Documents\Experiments\fmri\presentation\picture_sound_match\stim\hang\transform\hang'i'.wav

endfor
exit vége van