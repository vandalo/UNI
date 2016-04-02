
cuboA(5).
cuboB(8).

camino(E,E, C,C).
camino( EstadoActual, EstadoFinal, CaminoHastaAhora, CaminoTotal ):-
	unPaso(EstadoActual, EstSiguiente),
	\+member(EstSiguiente, CaminoHastaAhora),
	camino( EstSiguiente, EstadoFinal, [EstSiguiente|CaminoHastaAhora], CaminoTotal ).


nat(0).
nat(N):- nat(N1), N is N1+1.

solucionOptima:-
	nat(N),
	camino([0,0],[0,4],[[0,0]], C),
	length(C, N),
	write(C).


getSegundoElemento([_,Y], Snd):-
	Snd = Y.


getPrimerElemento([X,_], Frs):-
	Frs = X.
	

min(X,Y, C):-
	X < Y, C = X.
min(X,Y, C):-
	X > Y, C = Y.

max(X,Y, C):-
	X < Y, C = Y.
max(X,Y, C):-
	X > Y, C = X.


%Llenar_A
unPaso( EstadoActual, EstSiguiente ):- 
	cuboA(A), getSegundoElemento(EstadoActual, Snd),
	EstSiguiente = [A, Snd].

%Llenar_B
unPaso( EstadoActual, EstSiguiente ):- 
	cuboB(B), getPrimerElemento(EstadoActual, Frs),
	EstSiguiente = [Frs ,B].

%Vaciar_A
unPaso( EstadoActual, EstSiguiente ):- 
	getSegundoElemento(EstadoActual, Snd),
	EstSiguiente = [0, Snd].

%Variar_B
unPaso( EstadoActual, EstSiguiente ):- 
	getPrimerElemento(EstadoActual, Frs),
	EstSiguiente = [Frs ,0].

%A->B
unPaso( EstadoActual, EstSiguiente ):- 
	cuboB(B), getSegundoElemento(EstadoActual, Snd), getPrimerElemento(EstadoActual, Frs),
	FAux is Frs - (B-Snd), FBAux is Snd+Frs,
	max(FAux, 0, MinA),
	min(FBAux,B, MinB),
	EstSiguiente = [MinA, MinB].

%B->A
unPaso( EstadoActual, EstSiguiente ):- 
	cuboA(A), getSegundoElemento(EstadoActual, Snd), getPrimerElemento(EstadoActual, Frs),
	FBAux is Snd - (A-Frs), FAux is Frs+Snd,
	min(FAux, A, MinA),
	max(FBAux,0, MinB),
	EstSiguiente = [MinA, MinB].
