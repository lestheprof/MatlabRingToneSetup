setup ; % set a and harms: edit to alter
nl = {{'A4', 1, a, harms}, {'D5', 2, a, harms}} ; % put into a note list: edit to alter
s1 = create_tune(300, nl) ; % create the waveform: 1st param is beat rate
sound(s1, 44100) ; % play the waveform