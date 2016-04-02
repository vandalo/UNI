
:-include(entradaFlow4).
:-include(displayFlow).
:-dynamic(varNumber/3).
symbolicOutput(0). % set to 1 to see symbolic output only; 0 otherwise.

%---------------------------------------%
writeClauses:- 
estat_inicial,
min_un_num_casella,
max_un_num_casella, 
no_bucle, 
no_num_repetits, 
min_color_casella, 
max_un_color_casella, 
max_un_succesor, 
succesor_mateix_color_antecesor, 
inicial_no_succesor, 
min_un_succesor, 
max_un_antecesor.
%---------------------------------------%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%Escriu_lestat_inicial c(blue,    9,1,  2,2).
estat_inicial:- c(Col, I, J, I1, J1), 
		writeClause([col-I-J-Col]), writeClause([col-I1-J1-Col]), fail. 
estat_inicial.	
	
%Min_un_color_Casella
min_color_casella:- square(I,J), 
		findall( col-I-J-Col ,color(Col), C), writeClause(C), fail.
min_color_casella.

%max_un_color_casella
max_un_color_casella:- square(I,J), color(Col1), color(Col2), Col1 \= Col2,
		writeClause( [\+col-I-J-Col1, \+col-I-J-Col2] ), fail.
max_un_color_casella.
		
%succesor_mateix_color_antecesor
succesor_mateix_color_antecesor:- square(I,J), no_es_final(I,J),
		square(A,B), es_adjacent(I,J,A,B), color(Col),
		writeClause( [\+col-I-J-Col, \+s-I-J-A-B, col-A-B-Col] ), fail.
succesor_mateix_color_antecesor.

%max_un_succesor
max_un_succesor:- square(I,J), no_es_final(I,J), square(A,B), square(A1,B1), diferent(A,B,A1,B1), 
		es_adjacent(I,J,A,B), es_adjacent(I,J,A1,B1), 
		writeClause( [\+s-I-J-A-B, \+s-I-J-A1-B1] ), fail.		
max_un_succesor.

%min_un_succesor
min_un_succesor:-
		square(I,J), no_es_final(I,J),	
		findall( s-I-J-A-B ,es_adjacent(I,J,A,B) , C), writeClause(C), fail.		
min_un_succesor.

%max_un_antecesor
max_un_antecesor:-
	square(I,J), no_es_inicial(I,J),square(A,B), square(A1,B1), diferent(A,B,A1,B1), 
	es_adjacent(I,J,A,B), es_adjacent(I,J,A1,B1), 
	writeClause( [\+s-A-B-I-J, \+s-A1-B1-I-J] ), fail.	
max_un_antecesor.

%inicial_no_succesor
inicial_no_succesor:-
	square(I,J), es_inicial(I,J), square(A,B),
	writeClause([\+s-A-B-I-J]), fail.
inicial_no_succesor.

%no_bucle
no_bucle:- square(I,J), square(A,B), 
	size(S), M is S*S, between(1,M,N), Aux is N + 1, Lim is M + 1, Aux < Lim,
	writeClause( [\+s-I-J-A-B, \+n-I-J-N, n-A-B-Aux] ),fail.
no_bucle.

%min_un_numero
min_un_num_casella:- square(I,J), size(S), M is S*S,
		findall( n-I-J-X ,between(1,M,X), C), writeClause(C), fail.
min_un_num_casella.

%max_un_numero
max_un_num_casella:- square(I,J), size(S), M is S*S, between(1,M,N1),  between(1,M,N2),  N1 < N2,
		writeClause( [\+n-I-J-N1, \+n-I-J-N2] ), fail.
max_un_num_casella.

%no_num_repetits
no_num_repetits:-
		square(I,J), square(A,B), size(S), M is S*S,
		between(1,M,K), diferent(I,J,A,B),
		writeClause( [\+n-I-J-K, \+n-A-B-K] ), fail.	
no_num_repetits.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
diferent(X,Y,X,Y):- !,
	 fail. 
diferent(_,_,_,_).


%donat_un_punt_IJ_diu_si_AB_es_adjacent
es_adjacent(I,J,A,B):-
		square(I,J), square(A,B), 
		AuxA1 is A + 1,
		AuxA1 = I, B = J.
es_adjacent(I,J,A,B):- 
		square(I,J), square(A,B),
		AuxA0 is A - 1,
		AuxA0 = I, B = J.
es_adjacent(I,J,A,B):- 
		square(I,J), square(A,B),
		AuxB1 is B + 1,
		A = I, AuxB1 = J.
es_adjacent(I,J,A,B):- 
		square(I,J), square(A,B),
		AuxB0 is B - 1,
		A = I, AuxB0 = J.

%defineix_un_quadrat
square(I,J):- size(N), between(1,N,I), between(1,N,J).

%defineix_un_color
color(Col):- c(Col,_,_,_,_).

%no_es_final
no_es_final(I,J):-
	c(_,_,_,I,J), !, fail.
no_es_final(_,_).

es_final(I,J):-
	c(_,_,_,I,J).

es_inicial(I,J):-
	c(_,I,J,_,_).


%no_es_final
no_es_inicial(I,J):-
	c(_,I,J,_,_), !, fail.
no_es_inicial(_,_).


%displaySol([]).
%displaySol([X|L]):-
%    writeSymbolic(X),write(' '),displaySol(L).

%writeSymbolic(X):-
%    num2var(X,col-I-J-C), write(col-I-J-C), nl.
%writeSymbolic(X):-
%    num2var(X,s-I-J-A-B), write(s-I-J-A-B), nl.
%writeSymbolic(_).
%writeSymbolic(X):-
%    num2var(X,n-I-J-N), write(n-I-J-N), nl.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% ========== No need to change the following: =====================================

main:- symbolicOutput(1), !, writeClauses, halt. % escribir bonito, no ejecutar
main:-  assert(numClauses(0)), assert(numVars(0)),
	tell(clauses), writeClauses, told,
	tell(header),  writeHeader,  told,
	unix('cat header clauses > infile.cnf'),
	unix('picosat -v -o model infile.cnf'),
	unix('cat model'),
	see(model), readModel(M), seen, write('volta'), nl, displaySol(M), fail.
main:-	halt.

var2num(T,N):- hash_term(T,Key), varNumber(Key,T,N),!.
var2num(T,N):- retract(numVars(N0)), N is N0+1, assert(numVars(N)), hash_term(T,Key),
	assert(varNumber(Key,T,N)), assert( num2var(N,T) ), !.

writeHeader:- numVars(N),numClauses(C),write('p cnf '),write(N), write(' '),write(C),nl.

countClause:-  retract(numClauses(N)), N1 is N+1, assert(numClauses(N1)),!.
writeClause([]):- symbolicOutput(1),!, nl.
writeClause([]):- countClause, write(0), nl.
writeClause([Lit|C]):- w(Lit), writeClause(C),!.
w( Lit ):- symbolicOutput(1), write(Lit), write(' '),!.
w(\+Var):- var2num(Var,N), write(-), write(N), write(' '),!.
w(  Var):- var2num(Var,N),           write(N), write(' '),!.
unix(Comando):-shell(Comando),!.
unix(_).

readModel(L):- get_code(Char), readWord(Char,W), readModel(L1), addIfPositiveInt(W,L1,L),!.
readModel([]).

addIfPositiveInt(W,L,[N|L]):- W = [C|_], between(48,57,C), number_codes(N,W), N>0, !.
addIfPositiveInt(_,L,L).

readWord(99,W):- repeat, get_code(Ch), member(Ch,[-1,10]), !, get_code(Ch1), readWord(Ch1,W),!.
readWord(-1,_):-!, fail. %end of file
readWord(C,[]):- member(C,[10,32]), !. % newline or white space marks end of word
readWord(Char,[Char|W]):- get_code(Char1), readWord(Char1,W), !.
%========================================================================================
