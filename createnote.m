function [notesignal] = createnote(notename, duration, adsr, harms)
%createnote returns signal for a single note
%   notesignal is at pitch notename (as in A4, for example)
%  of duration, using the adsr values and with
%   the harmonic content in harms
% find out the basic pitch for the note
pitch = music.note2freq(notename) ; 
notesignal = adsr_modulate(genSound(duration, pitch, harms), adsr) ;
end

