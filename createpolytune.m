function [signalout, notecellstruct] = createpolytune(beatrate)
%playpolytune creates a signal for the tune in notecellstruct at beatrate
%   returns both the signal and the notecellstruct for possible re-use
%   sets up adsr value etc internally
%
% set up the values that will be used in the note cellstruct
% set up ADSR to some values
a.risetime = 0.005 ;
a.riselevel = 2 ;
a.decaytime = 0.007 ;
a.releasetime = 0.01 ;
% second adsr set of values
ap.risetime = 0.005;
ap.riselevel = 4 ;
ap.decaytime = 0.2 ;
ap.releasetime = 0.03 ;
% set up harms to some values
% harms = [0.5 1 0.8 0.4 0.2 0.1 0.1 0.08 0.1 0.1 0.03  0.001] ;
harms = [1 0 2 0.7 0.5 0.3 0.1] ;
harms_piano = [1 0.9 0.8 0.5 0.2 0.3 0.1 0.1 0.1 ] ;
harms_single = 1 ; % single harmonic
% bandwith
bandwidth = 0.04 ; % for bandpassed noise notes
% levels
level1 = 1 ; % really want a level for each note.
levelminus3db = level1/sqrt(2) ; % 6db less 
levelminus6db = level1/2 ;
levelminus10db = level1/sqrt(10) ;  % 10 dB less
levelminus13db = levelminus10db/sqrt(2) ;
levelminus16db = levelminus10db/2 ;
levelminus20db = levelminus10db/sqrt(10) ;

% note types
notetype1 = 1 ; % harmonics based
notetype2 = 2 ; % bandpassed noise based

% notecellstruct is a cell array, with each member having fields
% notename, startbeat, duration, adsr vector, notetype, harmonic content (for
% notetype = 1), bandpasswidth (for note type 2) , level. The values for
% these are set up in the code above (which migh be better as a separate
% function).
notecellstruct{1}.notename ='A4' ;
notecellstruct{1}.startbeat = 1 ;
notecellstruct{1}.duration = 2.5 ;
notecellstruct{1}.adsr = a ;
notecellstruct{1}.notetype = notetype1 ;
notecellstruct{1}.harmonics = harms ;
notecellstruct{1}.bandwith = bandwidth ;
notecellstruct{1}.level = levelminus6db ;

signalout = create_poly_tune(beatrate, notecellstruct) ;

end

