%¿Qué dígitos diferentes tenemos que asignar a las letras 
% S,E,N,D,M,O,R,Y, de manera que se cumpla la suma 
% S E N D + M O R E = M O N E Y? (Ojo: usa clpfd!). 

exemple:-
	leters([_,_,_,_,_,_,_,_]).

leters(L):-
	L = [S,E,N,D,M,O,R,Y],
	L ins 0..9, S*1000 + E*100 + N*10 +D + M*1000 + O*100 + R*10 + E #= M*10000 + O*1000 + N*100 + E*10 + Y,
	all_different(L),
	label(L),
	write(L), nl,!.
	



