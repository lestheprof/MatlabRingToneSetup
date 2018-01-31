function [signalout] = createbandpassnote(notename, duration, bpf_fraction)
%createbandpassnote create a note from white noise, bandpassed 
% Bandpass is at the pitch
%associated with the notename, with a bandpass of +/- fraction of that
%pitch. Note level is max  bas = 1
%
% get the note pitch
pitch = music.note2freq(notename) ; 
% calculate the bandpass low and high
bpf_low = pitch*(1 - bpf_fraction/2) ;
bpf_high = pitch*(1 + bpf_fraction/2) ;
% and create the signal
signalout = bandpass_note(bpf_low, bpf_high, duration) ;
% normalise to max value of 1
signalout = signalout * (1/max(abs(signalout))) ;
end

