% set up ADSR to some values
a.risetime = 0.005 ;
a.riselevel = 2 ;
a.decaytime = 0.007 ;
a.releasetime = 0.01 ;
ap.risetime = 0.005;
ap.riselevel = 4 ;
ap.decaytime = 0.2 ;
ap.releasetime = 0.1 ;
% set up harms to some values
% harms = [0.5 1 0.8 0.4 0.2 0.1 0.1 0.08 0.1 0.1 0.03  0.001] ;
harms = [1 0 2 0.7 0.5 0.3 0.1] ;
harms_bp = [0.04] ;
harms_piano = [1 0.9 0.8 0.5 0.2 0.3 0.1 0.1 0.1 ] ;
% levels
level1 = 1 ; % really want a level for each note.
levelminus3db = level1/sqrt(2) ; % 6db less 
levelminus6db = level1/2 ;
levelminus10db = level1/sqrt(10) ;  % 10 dB less
levelminus13db = levelminus10db/sqrt(2) ;
levelminus16db = levelminus10db/2 ;
levelminus20db = levelminus10db/sqrt(10) ;

% note types
level1 = 1 ;
notetype1 = 1 ; % harmonics based
notetype2 = 2 ; % bandpassed noise based
