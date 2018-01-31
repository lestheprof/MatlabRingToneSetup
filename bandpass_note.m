function signalout = bandpass_note(lowpass, hipass, duration) ;
% bandpass_note creates a bandpassed white noise signal with the bandlimits
% in the paramaters, of level 1
%
SAMPLERATE = 44100 ;
% create white noise
wtnoise = wgn(1, floor(SAMPLERATE * duration),1) ;
signalout = bandpass_signal(wtnoise,lowpass, hipass) ;
end