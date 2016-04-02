%prod(L,P)

%te exit si P es el producte de tots els elements de L o ve si P es una 
%variable el resultado de todo los productos.

prod([], 1).
prod([X|L], N):-prod(L, N1), N is N1 * X.
