
persones([1,2,5,8,15]).


estat_ini([0,0,0,0,0]).
estat_fin([1,1,1,1,1]).

numPersonas(5).

camino(E,E, C,C).
camino( EstadoActual, EstadoFinal, CaminoHastaAhora, CaminoTotal ):-
	unPaso(EstadoActual, EstSiguiente),
	\+member(EstSiguiente, CaminoHastaAhora),
	camino( EstSiguiente, EstadoFinal, [EstSiguiente|CaminoHastaAhora], CaminoTotal ).


nat(0).
nat(N):- nat(N1), N is N1+1.

solucionOptima:-  estat_ini(I), estat_fin(F), nat(T),
	%nat(N), 
	camino( [I,d,T], [F,i,0], [I,d,T], C ),
	%length(C, N),
	write(C).

element_at(X,[X|_],1).
element_at(X,[_|L],K) :- element_at(X,L,K1), K is K1 + 1.


reverse1([],Z,Z,_,_).
reverse1([_|T],Z,Acc,N1,Elem) :- Aux is N1 - 1, Aux = 0, reverse1(T,Z,[Elem|Acc],Aux,Elem), !.
reverse1([H|T],Z,Acc,N1,Elem) :-  Aux is N1 - 1, reverse1(T,Z,[H|Acc],Aux, Elem).

reverse([],Z,Z).
reverse([H|T],Z,Acc) :- reverse(T,Z,[H|Acc]).

max(X,Y, C):-
	X < Y, C = Y.
max(X,Y, C):-
	X > Y, C = X.



unPaso( [L, d, T] , EstSiguiente ):- numPersonas(P),
	%Agafo_dos_persones_que_estan_a_la_dreta
	between(1,P,N1), element_at(Tranportat1,L,N1), Tranportat1 = 0,
	between(1,P,N2), N1 < N2, element_at(Tranportat2,L,N2), Tranportat2 = 0,
	
	%Miro_el_temps_que_tardaran_a_creuar_i_que_estigui_dins_del_rang
	persones(ListPersones), element_at(X1, ListPersones, N1), element_at(X2, ListPersones, N2), 
	Temps is max(X1,X2), TempsAux is T - Temps, TempsAux >= 0,
	
	%Generem_lestat_seguent
	reverse1(L,LResAux,[],N1,1), reverse(LResAux,LResAux2,[]),
	%write(LResAux2),
	reverse1(LResAux2,LResAux3,[],N2,1), reverse(LResAux3,LRes,[]),
	%write(LRes),
	EstSiguiente = [LRes, i, TempsAux].
	

unPaso( [L, i, T] , EstSiguiente ):- numPersonas(P),
	%Agafo_una_persones_que_estan_a_la_dreta
	between(1,P,N1), element_at(Tranportat1,L,N1), Tranportat1 = 1,	
	
	%Miro_el_temps_que_tardara_a_creuar_i_que_estigui_dins_del_rang
	persones(ListPersones), element_at(X1, ListPersones, N1), 
	Temps is X1, TempsAux is T - Temps, TempsAux >= 0,

	reverse1(L,LResAux,[],N1,0), reverse(LResAux,LRes,[]),
	%write(LRes),
	EstSiguiente = [LRes, d, TempsAux].
	




















