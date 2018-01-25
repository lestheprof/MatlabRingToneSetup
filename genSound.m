function [signalOut] = genSound(duration,pitch, harmonics)
%genSound sound generation at pitch with harmonics
%   Generate a sound phase starting at 0 of durtion at pitch, with harmonic
%   content defined by harmonics array
SAMPLERATE = 44100 ; % standard sample rate

signalOut = zeros([1 duration * SAMPLERATE]) ;
% 
% normalise harmonics so that sum  is 1 
harmonics = harmonics / sum(sqrt(harmonics .* harmonics)) ;

% signal computation
for i = 1:length(harmonics)
    signalOut = signalOut + harmonics(i) * ... 
        sin(2* i * pi * pitch * ([1 : duration * SAMPLERATE] / SAMPLERATE) ) ;
end

end

