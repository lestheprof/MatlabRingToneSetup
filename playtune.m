setup ; % set a and harms: edit to alter
% can alter level note by note

% note list is for a simple monophonic soumd, with notes following each
% other
% currently note list (nl) is a cell array, with each cell element being
% 1: note name
% 2: duration in beats
% 3: ADSR array
% 4: note type: 0 silence, 1 tone, 2 bandlimited noise
% 5: Harmonic array (relative level of each harmonic) (not currently used
% in silence)
% or for bandpass noise, 1st element is fraction of pitch for bandpass
% 6: level (values are set in setup)
nl = {{'A4', 1, ap, notetype1, harms, levelminus6db}, ...
    {'D5', 1, ap, notetype1, harms, level1}, ...
    {'F#5', 1, ap, notetype1, harms, levelminus6db},...
    {'A4', 1, ap,notetype1, harms, levelminus6db}, ...
    {'D5', 1, ap, notetype1, harms, level1}, ...
    {'F#5', 1, ap, notetype1, harms, levelminus6db}, ...
    {'A4', 1, ap, notetype1, harms, levelminus6db}, ...
  {'D5', 6, ap,notetype1, harms, level1}} ; % put into a note list: edit to alter
s1 = create_tune(400, nl) ; % create the waveform: 1st param is beat rate
sound(s1, 44100) ; % play the waveform