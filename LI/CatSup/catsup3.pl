%% The catalan supermarket CATSUP is open every day during 10 hours (from 10am to 8pm).  
%% It wants to schedule the working times of its employees during a period of days.  
%%    -For each hour h in this period, CATSUP has made a prediction of the number N_h employees 
%%     that should work during hour h.  
%%    -Each employee can work at most a given number of hours per day.
%%    -Nobody works more than a given number of consecutive working days in a row.

:-dynamic(varNumber/3).
symbolicOutput(0). % set to 1 to see symbolic output only; 0 otherwise.

%%%%%%%%%%%%%%%%%%%%% toy input example:

%At hour H, exactly NH employees must work
employeesNeeded(H,NH):- HourInDay is (H-1) mod 10 + 1, needed(HourInDay,NH),!.
needed( 1,1).  % early in the morning: only 1 worker needed
needed( 2,2).
needed( 3,3).
needed( 4,4).  % central hours of the day: more workers
needed( 5,4).
needed( 6,4).
needed( 7,4).
needed( 8,3).
needed( 9,2).
needed(10,1).  % late in the day: only 1 worker needed

numEmployees(15).
numHours(100).
numDays(10).
maxConsecutiveDays(4).
maxHoursPerDay2(5).

%%%%%% Some helpful definitions to make the code cleaner:
employee(E, N):- %numEmployees(N), 
		between(1,N,E).
employee(E):- numEmployees(N), between(1,N,E).
hour(H):-         numHours(N), between(1,N,H).
day(D):-           numDays(N), between(1,N,D).
hourOfDay(H,D):- day(D), hour(H), D is 1 + (H-1) div 10.

%%%%%% writeClauses:
% We use the following types of symbolic propositional variables:
%   1. wh-I-H means: "worker I works during hour H"
%   2. wd-I-D means: "worker I works on day D"     

writeClauses(N):-     initClauseGeneration,
	%N is 7,
	relationshipBetweenVars2(N),
    maxWorkers(N),
    relationshipBetweenVars(N),
    enoughPeopleAtEachHour(N),
    notTooManyConsecutiveDays(N),
    maxHoursPerDay(N),
    true.

    
relationshipBetweenVars2(N):- employee(I, N), findall( wd-I-D, day(D), Lits ), expressOr2( w-I, Lits ), 
    %atMost(10,Lits), 
    fail.
relationshipBetweenVars2(_).

expressOr2( V, Lits ):- member(Lit,Lits), negate(Lit,NLit), writeClause([ NLit, V ]), fail.
expressOr2( _, _ ):-!.

maxWorkers(N):- findall( w-I, employee(I, N), Lits ), atLeast(N,Lits).    

%% Relationship between the variables wh and wd for each worker i: 
%% For each day d with hours h1...h10, we express wd-i-d  <->  wh-i-h1 v...v wh-i-h10.
relationshipBetweenVars(N):- employee(I, N), day(D), findall( wh-I-H, hourOfDay(H,D), Lits ), expressOr( wd-I-D, Lits ), fail.
relationshipBetweenVars(_).

%% Enough people work at each hour:
%% One cardinality constraint wh-1-h+...+wh-N-h >= N_h for each hour h
%enoughPeopleAtEachHour(N):- hour(H), employeesNeeded(H,NH), findall(wh-I-H, employee(I, N), Lits), atLeast(NH,Lits), fail.
enoughPeopleAtEachHour(N):- hour(H), employeesNeeded(H,NH), findall(wh-I-H, employee(I, N), Lits), exactly(NH,Lits), fail.
enoughPeopleAtEachHour(_).


%% No worker works on M+1 consecutive days:
%% For each worker i and day d one clause \+wd-i-d v \+wd-i-d+1 v...v \+wd-i-d+M.
notTooManyConsecutiveDays(N):- 
    maxConsecutiveDays(M), employee(I, N), day(D), DM is D+M, day(DM),
    findall( \+wd-I-Di, between(D,DM,Di), Lits ), writeClause(Lits), fail.
notTooManyConsecutiveDays(_).

maxHoursPerDay(N):- maxHoursPerDay2(M), employee(I, N), day(D), findall( wh-I-H, hourOfDay(H,D), Lits ), atMost(M,Lits), fail.
maxHoursPerDay(_).



% express that V is equivalent to the disjunction of Lits:
expressOr( V, Lits ):- member(Lit,Lits), negate(Lit,NLit), writeClause([ NLit, V ]), fail.
expressOr( V, Lits ):- negate(V,NV), writeClause([ NV | Lits ]),!.

%%%%%% Cardinality constraints on arbitrary sets of literals Lits:

exactly(K,Lits):- atLeast(K,Lits), atMost(K,Lits),!.

atMost(K,Lits):-   % l1+...+ln <= k:  in all subsets of size k+1, at least one is false:
    negateAll(Lits,NLits), 
    K1 is K+1,    subsetOfSize(K1,NLits,Clause), writeClause(Clause),fail.
atMost(_,_).

atLeast(K,Lits):-  % l1+...+ln >= k: in all subsets of size n-k+1, at least one is true:
    length(Lits,N),
    K1 is N-K+1,  subsetOfSize(K1, Lits,Clause), writeClause(Clause),fail.
atLeast(_,_).

negateAll( [], [] ).
negateAll( [Lit|Lits], [NLit|NLits] ):- negate(Lit,NLit), negateAll( Lits, NLits ),!.

negate(\+Lit,  Lit):-!.
negate(  Lit,\+Lit):-!.

subsetOfSize(0,_,[]):-!.
subsetOfSize(N,[X|L],[X|S]):- N1 is N-1, subsetOfSize(N1,L,S).
subsetOfSize(N,[_|L],   S ):-            subsetOfSize( N,L,S).

%%%%%% show the solution:

% displaySol(M): displays the symbolic model M (the set of true symbolic variables):
displaySol(M):- sort(M,M1), nl,nl,
		write('At each hour, who is working? '),             nl, displaySol1(M1), nl,nl,
		write('For each employee, when is (s)he working? '), nl, displaySol2(M1), !.

displaySol1(M):- hour(H),     nl, write('hour '),     write(H), write(': '), member(wh-I-H, M), write(I), write(' '), fail.
displaySol1(_):- nl,nl,!.

displaySol2(M):- employee(I), nl, write('employee '), write(I), write(' works on days:  '), 
		 member(wd-I-D, M), write(D), write(' '), fail.
displaySol2(M):- nl,nl,employee(I), nl, write('employee '), write(I), write(' works on hours: '), 
		 member(wh-I-H, M), write(H), write(' '), fail.
displaySol2(_):- nl,nl,!.

displaySol2([]).
displaySol2([wd-I-D|S]):-  write('employee '),      write(I), write(': day '),  write(D), nl, displaySol2(S).
displaySol2([wh-I-H|S]):-  write('              '), write(I), write(': hour '), write(H), nl, displaySol2(S).


%%%%%% main:
main:- numEmployees(N), NN is N div 2, main2(0,N,NN), !.
%main:-  symbolicOutput(1), !, writeClauses, halt.   % print the clauses in symbolic form and halt
main2(Min,Max,NN):-  tell(clauses), writeClauses(NN), told,          % generate the (numeric) SAT clauses and call the solver
	tell(header),  writeHeader,  told,
	numVars(N),numClauses(C),
	nl, write('For N = '), write(NN),nl,
	write(C), write(' clauses'), nl, write(N), write(' variables'), nl, 
	shell('cat header clauses > infile.cnf',_),
	shell('picosat -v -o model infile.cnf', Result),  % if sat: Result=10; if unsat: Result=20.
	treatResult(Result,Min,Max, NN),!.

treatResult(20, Min,Max,N):-Aux is Max - Min, Aux > 1, NN is (N + Max) div 2, main2(N, Max, NN), nl, halt.
treatResult(20, Min,Max,N):-Aux is Max - Min, Aux < 2, NN is N +1, main2(Min,Max, NN), nl, halt.
treatResult(10, Min,Max,N):- Aux is Max - Min, Aux > 1, NN is (Min + N) div 2, main2(Min, N, NN), nl, halt. 
treatResult(10, _,_,N):- write('Sat con N = '), write(N), shell('. Cat model',_),	see(model), symbolicModel(M), seen, displaySol(M), halt.

initClauseGeneration:-  %initialize all info about variables and clauses:
    retractall(numClauses(   _)), 
    retractall(numVars(      _)), 
    retractall(varNumber(_,_,_)),
    assert(numClauses( 0 )), 
    assert(numVars(    0 )),     !.
    
writeClause([]):- symbolicOutput(1),!, nl.
writeClause([]):- countClause, write(0), nl.
writeClause([Lit|C]):- w(Lit), writeClause(C),!.
w( Lit ):- symbolicOutput(1), write(Lit), write(' '),!.
w(\+Var):- var2num(Var,N), write(-), write(N), write(' '),!.
w(  Var):- var2num(Var,N),           write(N), write(' '),!.


% given the symbolic variable V, find its variable number N in the SAT solver:
var2num(V,N):- hash_term(V,Key), existsOrCreate(V,Key,N),!.
existsOrCreate(V,Key,N):- varNumber(Key,V,N),!.                            % V already existed with num N
existsOrCreate(V,Key,N):- newVarNumber(N), assert(varNumber(Key,V,N)), !.  % otherwise, introduce new N for V

writeHeader:- numVars(N),numClauses(C), write('p cnf '),write(N), write(' '),write(C),nl.

countClause:-     retract( numClauses(N0) ), N is N0+1, assert( numClauses(N) ),!.
newVarNumber(N):- retract( numVars(   N0) ), N is N0+1, assert(    numVars(N) ),!.
 
% Getting the symbolic model M from the output file:
symbolicModel(M):- get_code(Char), readWord(Char,W), symbolicModel(M1), addIfPositiveInt(W,M1,M),!.
symbolicModel([]).
addIfPositiveInt(W,L,[Var|L]):- W = [C|_], between(48,57,C), number_codes(N,W), N>0, varNumber(_,Var,N),!.
addIfPositiveInt(_,L,L).
readWord( 99,W):- repeat, get_code(Ch), member(Ch,[-1,10]), !, get_code(Ch1), readWord(Ch1,W),!. % skip line starting w/ c
readWord(115,W):- repeat, get_code(Ch), member(Ch,[-1,10]), !, get_code(Ch1), readWord(Ch1,W),!. % skip line starting w/ s
readWord(-1,_):-!, fail. %end of file
readWord(C,[]):- member(C,[10,32]), !. % newline or white space marks end of word
readWord(Char,[Char|W]):- get_code(Char1), readWord(Char1,W), !.
%========================================================================================
