exemple:- backpack([_,_,_,_,_,_]).

backpack(L):-
	L = [A,B,C,D,E,F],
	L ins 0..80, 1*A + 2*B + 3*C + 5*D + 6*E + 7*F #=< 80,
	labeling( [max( 1*A + 4*B + 7*C + 11*D + 14*E + 15*F ) ], L), write(L), nl,!.







