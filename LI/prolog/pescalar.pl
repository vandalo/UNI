%pescalar(L1,L2,P)
%te exit si L1 i L2 són del mateix temany
%P es el producte escalar de L1 i L2

pescalar([],[],0).
pescalar([X|L1],[Y|L2],P):-pescalar(L1,L2,P1),	P is X*Y+P1.
