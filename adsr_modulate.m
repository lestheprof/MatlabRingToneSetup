function [signalout] = adsr_modulate(signal, adsrdata)
%adsr_modulate moduate signal with ADSR defined by adsrdata
%   adsrdata structure has elements
%   risetime: time to max value
%   riselevel: value compared to sustain level (assumes to be 1): should be
%   > 1
%   decaytime: time from max level to sustain
%   (no value for sustain level: this is 1
%   releasetime: time to decay from sustain to 0
% note that total signal length will be tha same as for the original
% signal. If the original signal is shorter than risetime + decaytime +
% releasetime then report an error for now
% started LSS 24 Jan 2018.
%
SAMPLERATE=44100 ;
% sanity checks
if ((adsrdata.risetime + adsrdata.decaytime + adsrdata.releasetime) * SAMPLERATE > length(signal))
    error('adsr_modulate: signal shorter then minimum adsr length') ;
end
if (adsrdata.riselevel < 1) 
    error('ADSR max level less than sustain level');
end
%
% calculate sample numbers for the peak, sustain start and sustain end
% (others are 1, length(signal)
peaksample = floor(adsrdata.risetime * SAMPLERATE) ;
sustainstartsample = floor(adsrdata.risetime * SAMPLERATE) + floor(adsrdata.decaytime * SAMPLERATE) ;
sustainendsample = length(signal) - ceil(adsrdata.releasetime * SAMPLERATE) ;
% calculate the adsr vector to poitnwise multipy the signal by
adsrvector = ones([1 length(signal)]) ;
adsrvector(1:peaksample) = ...
    ((1:peaksample) * adsrdata.riselevel/peaksample) ;
decaylength = sustainstartsample - peaksample ;
adsrvector((peaksample + 1) : sustainstartsample) = ...
    1 + ((decaylength:-1:1) * (adsrdata.riselevel - 1))/decaylength ;
adsrvector(sustainendsample:end) = (length(signal) - sustainendsample : -1 : 0)/...
    (length(signal) - sustainendsample) ;
% and convolve
signalout = signal.* adsrvector ;

end

