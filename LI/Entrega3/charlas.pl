datosEjemplo( [[1,2,6],[1,6,7],[2,3,8],[6,7,9],[6,8,9],[1,2,4],[3,5,6],[3,5,7],
[5,6,8],[1,6,8],[4,7,9],[4,6,9],[1,4,6],[3,6,9],[2,3,5],[1,4,5],
[1,6,7],[6,7,8],[1,2,4],[1,5,7],[2,5,6],[2,3,5],[5,7,9],[1,6,8]] ).

estudiantes(24).

capacidad(3). 


nat(0).
nat(N):- nat(N1), N is N1 + 1.

solucionOptima:-
    datosEjemplo(ListEntrada),
    nat(N),
    Grupos = [[],[],[],[],[],[],[],[],[]], 
    addCharla(Grupos, Res, ListEntrada, N, 0),
    %write(Res).
    displaySol(Res), !.
    
addCharla(G, G, [] , N, Limit):-Limit =< N.   
addCharla(Grupos, Res, [X|PeticionesRestantes],N, Limit):-
    capacidad(NumTiemposAux), NumTiempos is NumTiemposAux-1,
    permutacion(X,Perm), 
    anadirTiempo(NumTiempos, Perm, Grupos, N, Limit, N3, Res2), N3 =< N,
    addCharla(Res2, Res, PeticionesRestantes, N, N3).
    
 
anadirTiempo(Tiempo, Perm, Grupos, N, Limit, N3, Res2):- Tiempo >= 0,
	find(Perm,Tiempo,GrupoAux), Grupo is GrupoAux -1, 
	find(Grupos, Grupo, Grp),
	\+member(Tiempo,Grp), Aux = [Tiempo|Grp], N22 is Limit+1, N22 =< N,
	replace(Grupos,Grupo,Aux,Res3), Tiempo2 is Tiempo -1,
	anadirTiempo(Tiempo2, Perm, Res3, N, N22, N3, Res2). 
anadirTiempo(Tiempo, Perm, Grupos, N, Limit, N3, Res2):- Tiempo >= 0, 
	find(Perm,Tiempo,GrupoAux), Grupo is GrupoAux -1, 
	find(Grupos, Grupo, Grp),
	member(Tiempo,Grp), Tiempo2 is Tiempo -1,
	anadirTiempo(Tiempo2, Perm, Grupos, N, Limit, N3, Res2). 
anadirTiempo(-1, _, Grupos, _, Limit, Limit, Grupos).
    
    
    
    
find([X|_],0, X).
find([_|L],N, X):- 
        N1 is N-1,
        find(L,N1, X).    
        
replace([_|T], 0, X, [X|T]):- !.
replace([H|T], I, X, [H|R]):- I > -1, NI is I-1, replace(T, NI, X, R), !.
replace(L, _, _, L).
        

permutacion([],[]).
permutacion(L,[X|P]) :- pert_con_resto(X,L,R), permutacion(R,P).

pert_con_resto(X,L,Resto):- concat(L1,[X|L2],L), concat(L1,L2,Resto).

concat([],L,L).
concat([X|L1],L2,[X|L3]):- concat(L1,L2,L3).

displaySol([X|L]):-
write('Tiempos ---- A ------ B ----- C'), nl,
displayList([X|L], 1).
  

displayList([], _). 
displayList([X|L], N):- 
bubble_sort(X,Xordenat),
displayElem1(Xordenat, N), Naux is N + 1, displayList(L, Naux), !.



%%%%%%%%%%%%
displayElem1([0|L], N):-
write('Charla '),write(N),write(' ---'),
write(' Si ----'), displayElem2(L). 

displayElem1([1|L], N):-
write('Charla '),write(N),write(' ---'),
write(' No ---- Si ----'), displayElem3(L).

displayElem1([2|_], N):-
write('Charla '),write(N),write(' ---'),
write(' No ---- No ---- Si'), nl.
%%%%%%%%%%
displayElem2([]):-
write(' No ---- No'), nl.
displayElem2([1|L]):-
write(' Si ----'), displayElem3(L).
displayElem2([2|_]):-
write(' No ---- Si'), nl.
%%%%%%%%%%%%%
displayElem3([]):-
write(' No'), nl.
displayElem3([2|_]):-
write(' Si'), nl.



bubble_sort(List,Sorted):-b_sort(List,[],Sorted).
b_sort([],Acc,Acc).
b_sort([H|T],Acc,Sorted):-bubble(H,T,NT,Max),b_sort(NT,[Max|Acc],Sorted).
   
bubble(X,[],[],X).
bubble(X,[Y|T],[Y|NT],Max):-X>Y,bubble(X,T,NT,Max).
bubble(X,[Y|T],[X|NT],Max):-X=<Y,bubble(Y,T,NT,Max).


