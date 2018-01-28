function [signalout] = create_tune(beatrate, noteCellList)
%create_tune creates a sequence of notes
%   beatrate is the metronome setting
%   noteCellList contains a list of cells, each containing a note name, a
%   duration, an ADSR specification and a harmonics list
SAMPLERATE = 44100 ;
signallength = 0 ;
% preallocate signalout
for noteno = 1: length(noteCellList)
    signallength = signallength + SAMPLERATE * noteCellList{noteno}{2} * (60/beatrate) ;
end
signalout = zeros([1 signallength]) ;
startsample = 1 ;
for noteno = 1:length(noteCellList) % note by note
    signalout(startsample:startsample -1 + SAMPLERATE * noteCellList{noteno}{2} * (60/beatrate)) = ...
        createnote(noteCellList{noteno}{1}, noteCellList{noteno}{2} * (60/beatrate), noteCellList{noteno}{3}, ...
        noteCellList{noteno}{4}) ;
    startsample = startsample + (SAMPLERATE * noteCellList{noteno}{2} * (60/beatrate)) + 1 ;
end
end

