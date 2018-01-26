function [signalout] = create_tune(beatrate, noteCellList)
%create_tune creates a sequence of notes
%   beatrate is the metronome setting
%   noteCellList contains a list of cells, each containing a note name, a
%   duration, an ADSR specification and a harmonics list
SAMPLERATE = 44100 ;
signallength = 0 ;
% preallocate signalout
for noteno = 1: length(clist)
    signallength = signallength + SAMPLERATE * noteCellList{noteno}{2} * (60/beatrate) ;
end
signalout = zeros([1 signallength]) ;

end

