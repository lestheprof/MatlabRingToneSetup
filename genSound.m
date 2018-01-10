function [signalOut] = genSound(duration,pitch)
%genSound Simple test of sound generation
%   Detailed explanation goes here
sampleRate = 44100 ; % standard sample rate
risetime = 0.01 ;
falltime = 0.02 ;
% signalOut = zeros([1 duration * sampleRate]) ;
% 
% simple computation
signalOut = sin(2 * pi * pitch * ([1 : duration * sampleRate] / sampleRate) ) ;
% implement rise time: modulate start by  quarter cycle of sin wave with duration
% risetime
omegarise = 1/(4 * risetime) ;
risemodulator = sin(2 * pi * omegarise * [1:risetime * sampleRate]/sampleRate) ; 
signalOut(1:length(risemodulator)) = signalOut(1:length(risemodulator)) ...
    .* risemodulator ;
% implement fall time: modulate end by 2nd pi/2 quarter cycle of sine wave.
omegafall = 1/(4 * falltime) ;
fallmodulator = sin(pi/2 + 2 * pi * omegafall * [1:falltime*sampleRate]/sampleRate) ; 
signalOut(end-length(fallmodulator) + 1: end) = signalOut(end-length(fallmodulator) + 1: end) ...
    .* fallmodulator ;
end

