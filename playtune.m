setup ; % set a and harms: edit to alter
% can alter level note by note
level1 = 1 ;
notetype = 1 ;
notetype2 = 2 ;
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
nl = {{'A4', 1, a, notetype2, harms_bp, level05}, ...
    {'D5', 1, a, notetype2, harms_bp, level1}, ...
    {'F#5', 1, a, notetype2, harms_bp, level05},...
    {'A4', 1, a,notetype2, harms_bp, level05}, ...
    {'D5', 1, a, notetype2, harms_bp, level1}, ...
    {'F#5', 1, a, notetype2, harms_bp, level05}, ...
    {'A4', 1, a, notetype2, harms_bp, level05}, ...
    {'D5', 6, a,notetype2, harms_bp, level1}} ; % put into a note list: edit to alter
s1 = create_tune(300, nl) ; % create the waveform: 1st param is beat rate
sound(s1, 44100) ; % play the waveform