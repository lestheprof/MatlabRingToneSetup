function [signalOut] = topandtail_lin(signal, risetime,falltime)
%topandtail tops and tails a signal,linear rise and fall time
%   signal length is calculated, for the sample rate
SAMPLERATE = 44100 ; % assumed. Could be made a paramater.
signallength = length(signal)/SAMPLERATE ;
if (signallength < (risetime + falltime))
    % probably an error
    error ('topandtail: signal length less than risetime + falltime') ;
else
    signalOut = signal ;
    % risetime
%     omegarise = 1/(4 * risetime) ;
%     risemodulator = sin(2 * pi * omegarise * [1:risetime * SAMPLERATE]/SAMPLERATE) ;
    risemodulator = [1:risetime * SAMPLERATE]/(risetime * SAMPLERATE) ;
    signalOut(1:length(risemodulator)) = signalOut(1:length(risemodulator)) ...
        .* risemodulator ;
    % implement fall time: modulate end by 2nd pi/2 quarter cycle of sine wave.
%     omegafall = 1/(4 * falltime) ;
%     fallmodulator = sin(pi/2 + 2 * pi * omegafall * [1:falltime*SAMPLERATE]/SAMPLERATE) ;
    fallmodulator = [falltime*SAMPLERATE:-1: 1]/(falltime*SAMPLERATE) ;
    signalOut(end-length(fallmodulator) + 1: end) = signalOut(end-length(fallmodulator) + 1: end) ...
        .* fallmodulator ;
end

end

