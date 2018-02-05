function [signalout] = create_poly_tune(beatrate, noteStructList)
%create_tune creates a signa; from nteVellList
% noteCellList defines a set of notes (not a sequence) which are created
% using createnote or createbandpassnote, and then added together
%   beatrate is the metronome setting
%   noteCellList contains a list of cells, each containing a note name, a start beat number 
% (not necessarily an integer), a
%   duration (in beats), an ADSR specification and a harmonics list (for
%   createnote) or a bandpass width (for createbandpassnote
SAMPLERATE = 44100 ;
signallengthbeats = 0 ; % in beats this time
% preallocate signalout
for noteno = 1: length(noteStructList)
    signallengthbeats = max(signallengthbeats, (noteStructList{noteno}.startbeat + noteStructList{noteno}.duration)) ;
end
signallength = signallengthbeats * (SAMPLERATE/(beatrate/60)) ;
signalout = zeros([1 signallength]) ;
startsample = 1 ;
% currently note list (nl) is a cell array, with each cell element being
% 1: note name
% 2: duration in beats
% 3: ADSR array
% 4: note type: 0 silence, 1 tone, 2 bandlimited noise
% 5: Harmonic array (relative level of each harmonic) (not currently used
% in silence)
% or for bandpass noise, 1st element is fraction of pitch for bandpass
% 6: level (values are set in setup)
for noteno = 1:length(noteStructList) % note by note
    duration = noteStructList{noteno}{2} * (60/beatrate) ; % maybe if I calculate it just once...
    switch noteStructList{noteno}{4}
        case 0 % silence
            signalout(startsample:startsample -1 + floor(SAMPLERATE * duration)) = ...
                zeros([1 floor(duration * SAMPLERATE)]) ;
        case 1 % tone
            % temporary
            % floor(SAMPLERATE * duration)
            signalout(startsample:startsample -1 + floor(SAMPLERATE * duration)) = ...
                noteStructList{noteno}{6} * createnote(noteStructList{noteno}{1}, duration, noteStructList{noteno}{3}, ...
                noteStructList{noteno}{5}) ;
        case 2 % bandpassed noise
                signalout(startsample:startsample -1 +  floor(SAMPLERATE * duration)) = ...
                          noteStructList{noteno}{6} * createbandpassnote(noteStructList{noteno}{1}, duration, ...
                          noteStructList{noteno}{3}, noteStructList{noteno}{5}(1)) ;
        otherwise
            error('create_tune: invalid note type') ;
    end
    
    startsample = startsample + (SAMPLERATE * duration) + 1 ;
end
end

