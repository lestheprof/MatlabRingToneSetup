function [signalout] = create_swoosh_up(duration,lpf_low, lpf_high, hpf_low, hpf_high, overlaplength)
%create_swoosh_up Creates a swept (upwards) bandpassed filtered white noise
%signal
%   lpf_low, lpf_high: low and high end of the lpf's
%   hpf_low, hpf_high: low and high end of the hpf's
%   overlaplength: duration of overlap between pieces: should be the same
%   as rise time and fall time
% second version: with overlaps between the pieces

SAMPLERATE = 44100 ;
% this works piecewise
piecelength = 0.02 ; %20ms
numpieces = floor(duration/piecelength) ;
piecelengthsamples = floor(piecelength * SAMPLERATE) ;
% calculate the low and high pass values for the filtering
highDelta = log(hpf_high) - log(hpf_low) ;
lowDelta = log(lpf_high) - log(lpf_low) ;
highdelta = highDelta/numpieces ; % multiplicative increment between pieces
lowdelta = lowDelta/numpieces ;
overlapsamples = floor(overlaplength * SAMPLERATE) ;
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
    % need to treat beginning and end differenty
    if (pieceno ==1) 
        ovlapstart = 0; 
    else
        ovlapstart = overlapsamples;
    end
    if (pieceno == numpieces) 
        ovlapend = 0; 
    else
        ovlapend = overlapsamples;
    end
    piece_internal = ...   % calculate a single internal piece
        bandpass_signal(wtnoise((pieceno-1) * piecelengthsamples + 1 - ovlapstart:...
        (pieceno * piecelengthsamples)+ovlapend) ,lpf, hpf) ;
    % add this part in
    signalout((pieceno-1) * piecelengthsamples + 1 - ovlapstart:(pieceno * piecelengthsamples) + ovlapend) ...
        = signalout((pieceno-1) * piecelengthsamples + 1 - ovlapstart:(pieceno * piecelengthsamples) + ovlapend) ...
        + topandtail_lin(piece_internal, overlaplength, overlaplength) ;

end
signalout = topandtail(signalout, 0.01, 0.01) ;
end

