function [signalout] = create_swoosh_up(duration,lpf_low, lpf_high, hpf_low, hpf_high)
%create_swoosh_up Creates a swept (upwards) bandpassed filtered white noise
%signal
%   lpf_low, lpf_high: low and high end of the lpf's
%   hpf_low, hpf_high: low and high end of the hpf's
SAMPLERATE = 44100 ;
% this works piecewise
piecelength = 0.1 ; %20ms
numpieces = floor(duration/piecelength) ;
piecelengthsamples = floor(piecelength * SAMPLERATE) ;
% calculate the low and high pass values for the filtering
highDelta = log(hpf_high) - log(hpf_low) ;
lowDelta = log(lpf_high) - log(lpf_low) ;
highdelta = highDelta/numpieces ; % multiplicative increment between pieces
lowdelta = lowDelta/numpieces ;
% create a white noise of duration
wtnoise = wgn(1, SAMPLERATE * duration,1) ;
% normalise to max of 1
wtnoise = wtnoise/max(abs(wtnoise)) ;
% initialise signalout
signalout = zeros([1 numpieces * piecelength * SAMPLERATE]) ;
%bandpass piece by piece
for pieceno = (1:numpieces)
    %calculate bandpass parameters
    lpf = lpf_low * exp((pieceno - 1) * lowdelta) ;
    hpf = hpf_low * exp((pieceno - 1) * highdelta) ;
    signalout((pieceno-1) * piecelengthsamples + 1: (pieceno * piecelengthsamples)) = ...
        bandpass_signal(wtnoise((pieceno-1) * piecelengthsamples + 1:...
        (pieceno * piecelengthsamples)) ,lpf, hpf) ;
end
signalout = topandtail(signalout, 0.01, 0.01) ;
end

