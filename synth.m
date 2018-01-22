function signal = synth(f1,f2,l2, f3,l3, duration)
%synth generates a signal with base frequency s1, frequency modulated at s2
%by an amount l2 (in Hz),
%and amplitude modulated at f3 by an amount l3 (0 .leq. s3 .leq 1)
SAMPLERATE = 44100 ;
nosamples = duration * SAMPLERATE ;
% FM signal
% can't see how to do this in 1 line
% freq = (f1 + l2 * sin(2* pi* ([1:nosamples]/SAMPLERATE) * f2)) ;
% temp = ((2*pi*[1:nosamples]/SAMPLERATE) .* freq) ;
% signal = sin((2*pi*[1:nosamples]/SAMPLERATE) .* freq) ;
% try using fmmod
% sig_orig =  sin((2*pi*[1:nosamples]/SAMPLERATE) * f1) ;
sig_modulate = sin((2*pi*[1:nosamples]/SAMPLERATE) * f2) ;
sig_fmmod = fmmod(sig_modulate, f1,SAMPLERATE,l2) ;
% amplitude modulate it
modulation = (1 + l3 * sin((2*pi*[1:nosamples]/SAMPLERATE) * f3)) /2 ;
signal = sig_fmmod .* modulation ;

end

