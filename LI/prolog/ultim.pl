%ultimo(L1, P)
%et diu lultim element de la llista

concat([],L,L).
concat([X|L1],L2,[X|L3]):-concat(L1,L2,L3).


%concat(P,[X],L)
%concat([1|L1],[1],[1|2,3,4])
%concat([2|L1],[2],[2|3,4])
%concat([3|L1],[3],[3|4])
%concat([4|L1],[4],[4|])
%concat([],[4],[])
%L = 4
ultim(L,X):-concat(_,[X],L).

%invert([1,2,3], X)
%--------[L]----[X|L1]
%invert([1,2,3],[1|2,3])

%-------[X|L1]--L2--[X|L3]
%concat([1|,2,3],[1],[1,2,3])
%concat([2|3],[1],[2|3])
%concat([3|],[1],[3|])
%concat([],[1],[])
%-------L2--[X]-L
%concat([],[1],[1])
%invert([],[2,3])

invert([],[]).
invert(L,[X|L1]):-concat(L2,[X],L), invert(L2,L1).



