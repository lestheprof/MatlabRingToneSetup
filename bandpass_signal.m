function signal_out = bandpass_signal(signal_in,hipass, lowpass)
%bandpass_signal bandpass signal_in
%   simple bandpass filer applied to an input signal
SAMPLERATE = 44100 ;
filter_order = 10 ;
% generate bandpass filter
BPF = fdesign.bandpass('N,F3dB1,F3dB2',filter_order, hipass, lowpass, SAMPLERATE) ;
f_BPF = design(BPF) ;
% perform the filtering
signal_out = filter(f_BPF, signal_in) ;

end

