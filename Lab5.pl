male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).


parent(abraham, herb).
parent(abraham, homer).
parent(mona, homer).


parent(clancy, marge).
parent(clancy, patty).
parent(clancy, selma).
parent(jackie, marge).
parent(jackie, patty).
parent(jackie, selma).


parent(homer, bart).
parent(homer, lisa).
parent(homer, maggie).
parent(marge, bart).
parent(marge, lisa).
parent(marge, maggie).


parent(selma, ling).


father(F, C) :- parent(F, C), male(F).
mother(M, C) :- parent(M, C), female(M).

son(S, P) :- parent(P, S), male(S).
daughter(D, P) :- parent(P, D), female(D).


sibling(X, Y) :- parent(P, X), parent(P, Y), X \= Y.

brother(B, X) :- sibling(B, X), male(B).
sister(S, X) :- sibling(S, X), female(S).

grandparent(G, C) :- parent(G, P), parent(P, C).
grandfather(G, C) :- grandparent(G, C), male(G).

aunt(A, N) :- parent(P, N), sister(A, P).
uncle(U, N) :- parent(P, N), brother(U, P).

cousin(X, Y) :- parent(PX, X), parent(PY, Y), sibling(PX, PY), X \= Y.

ancestor(A, D) :- parent(A, D).
ancestor(A, D) :- parent(A, X), ancestor(X, D).


% father:       ?- father(homer, bart).        -> true
%               ?- father(F, lisa).            -> F = homer ; (and so on)
% mother:       ?- mother(marge, maggie).      -> true
%               ?- mother(M, homer).           -> M = mona
% son:          ?- son(bart, homer).           -> true
%               ?- son(S, abraham).            -> S = herb ; S = homer
% daughter:     ?- daughter(lisa, marge).      -> true
%               ?- daughter(D, clancy).        -> D = marge ; patty ; selma
% brother:      ?- brother(herb, homer).       -> true
%               ?- brother(B, lisa).           -> B = bart
% sister:       ?- sister(lisa, maggie).       -> true
%               ?- sister(S, marge).           -> S = patty ; S = selma
% grandfather:  ?- grandfather(abraham, bart). -> true
%               ?- grandfather(G, ling).       -> G = clancy
% aunt:         ?- aunt(patty, bart).          -> true
%               ?- aunt(A, ling).              -> A = patty
% uncle:        ?- uncle(herb, bart).          -> true
%               ?- uncle(U, maggie).           -> U = herb
% cousin:       ?- cousin(bart, ling).         -> true
%               ?- cousin(C, lisa).            -> C = ling
% ancestor:     ?- ancestor(abraham, maggie).  -> true
%               ?- ancestor(A, ling).          -> A = selma ; clancy ; jackie