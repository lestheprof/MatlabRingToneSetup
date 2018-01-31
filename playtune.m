setup ; % set a and harms: edit to alter
% can alter level note by note
level1 = 1 ;
% note list is for a simple monophonic soumd, with notes following each
% other
% currently note list (nl) is a cell array, with each cell element being
% 1: note name
% 2: duration in beats
% 3: ADSR array
% 4: Harmonic array (relative level of each harmonic)
% 5: level (values are set in setup)
nl = {{'A4', 1, a, harms, level05}, {'D5', 1, a, harms, level1}, {'F#5', 1, a, harms, level05},...
    {'A4', 1, a, harms, level05}, {'D5', 1, a, harms, level1}, {'F#5', 1, a, harms, level05}, ...
    {'A4', 1, a, harms, level05}, {'D5', 6, a, harms, level1}} ; % put into a note list: edit to alter
s1 = create_tune(300, nl) ; % create the waveform: 1st param is beat rate
sound(s1, 44100) ; % play the waveform