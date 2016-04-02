
misioneros(3).
canibales(3).
barca(2).

camino(E,E, C,C).
camino( EstadoActual, EstadoFinal, CaminoHastaAhora, CaminoTotal ):-
	unPaso(EstadoActual, EstSiguiente),
	\+member(EstSiguiente, CaminoHastaAhora),
	camino( EstSiguiente, EstadoFinal, [EstSiguiente|CaminoHastaAhora], CaminoTotal ).


nat(0).
nat(N):- nat(N1), N is N1+1.

solucionOptima:-
	misioneros(M), canibales(CA),
	nat(N),
	camino([M,CA,0,0,0],[0,0,M,CA,1],[[M,CA,0,0,0]], C),
	length(C, N),
	write(C).

%devuelve_false_si_mueren
no_se_mata([M1,C1,M2,C2]):-
	M1>=C1, M2>=C2, !.
no_se_mata([M1,_,M2,C2]):-
	M1 = 0, M2 >= C2, !.
no_se_mata([M1,C1,M2,_]):-
	M2 = 0, M1 >= C1, !.


unPaso( [M1,C1,M2,C2, B] , EstSiguiente ):- B = 0,
	barca(N), 
	between(0,N,NM), between(0,N,NC),

	AuxM1 is M1 - NM, AuxM2 is M2 + NM, AuxM1 >= 0,
	AuxC1 is C1 - NC, AuxC2 is C2 + NC, AuxC1 >= 0,
	Aux is NM + NC, Aux > 0, N >= Aux, 
	no_se_mata( [AuxM1, AuxC1, AuxM2, AuxC2] ),
	EstSiguiente = [AuxM1, AuxC1, AuxM2, AuxC2, 1].

unPaso( [M1,C1,M2,C2, B] , EstSiguiente ):- B = 1, 
	barca(N), 
	between(0,B,NM), between(0,B,NC),

	AuxM1 is M1 + NM, AuxM2 is M2 - NM, AuxM2 >= 0,
	AuxC1 is C1 + NC, AuxC2 is C2 - NC, AuxC2 >= 0,
	Aux is NM + NC, Aux > 0, N >= Aux, 
	no_se_mata( [AuxM1, AuxC1, AuxM2, AuxC2] ),
	EstSiguiente = [AuxM1, AuxC1, AuxM2, AuxC2, 0].

	






































	
	
