% CPSC 449 Assignment 1
% Question 9
% Authors: Code: Supplied in assignment Comments: Michael Tretiak
%  Purpose: This program shows relations of a family. A fact database has been
%           provided
%     example query: father(X,Y) will return pairs, one father, and the fathers
%               child.

father(X, Y):-
   man(X),
   parent(X, Y).

mother(X,Y) :-
   woman(X),
   parent(X, Y).

married(X,Y):-
    likes(X,Y),
    likes(Y,X).

aunt(X,Y):-
    woman(X),
    sister(X, Z),
    parent(Z,Y).

aunt(X,Y):-
    woman(X),
    married(X,R),
    sibling(R,G),
    parent(G,Y).

uncle(X,Y):-
    man(X),
    brother(X,Z),
    parent(Z,Y).
uncle(X,Y):-
    man(X),
    married(X,R),
    sibling(R,G),
    parent(G,Y).

sibling(B,G) :-
    parent(P,B),
    parent(P,G),
    B\=G.

cousin(X,Y) :-
    parent(M,X),
    parent(D,Y),
    sibling(M,D),
    X\=Y.

grandparent(X, Y):-
   parent(X, P),
   parent(P, Y).



sister(X,Y) :-
   woman(X),
   mother(M, X),
   father(F, X),
   mother(M, Y),
   father(F, Y),
   X\=Y.

brother(X,Y):-
    man(X),
    father(F,X),
    mother(M,X),
    father(F,Y),
    mother(M,Y),
    X\=Y.

extended_relative(X,Y):-
    greatGrandparent(X,Y);
    secondCousin(X,Y).


wealthy_family(X,Y):-
    extended_relative(X,Y),
    wealthy(X).



greatGrandparent(X,Y):-
    parent(X,M),
    grandparent(M,Y).

secondCousin(X,Y):-
    cousin(X,G),
    parent(G,Y).


relative_of(X,Y):-
    grandparent(X,Y);
    parent(X,Y);
    sister(X,Y);
    brother(X,Y);
    uncle(X,Y);
    aunt(X,Y);
    cousin(X,Y);
	married(X,Y).

man(adam).
man(peter).
man(paul).
man(carlos).
man(willem).
man(mike).
man(greg).
man(ken).
man(craig).
man(reid).
man(willam).
man(bob).
man(joe).
man(pat).
man(ron).

woman(don).
woman(rana).
woman(marry).
woman(eve).
woman(greta).
woman(lisa).
woman(gail).
woman(tory).
woman(joc).
woman(terry).
woman(sue).
woman(jan).

wealthy(willam).
wealthy(bob).


likes(greta,carlos).
likes(carlos,greta).
likes(ken,terry).
likes(terry,ken).
likes(ron,rana).
likes(rana,ron).
likes(don,craig).
likes(craig,don).

parent(bob,willam).
parent(sue,willam).
parent(adam, peter).
parent(eve, peter).
parent(adam, paul).
parent(marry, paul).
parent(adam, willem).
parent(adam, lisa).
parent(eve, willem).
parent(eve, lisa).
parent(greta, adam).
parent(carlos, adam).
parent(gail,mike).
parent(greg,mike).
parent(gail,tory).
parent(greg,tory).
parent(craig,reid).

parent(joe,pat).
parent(pat,bob).
parent(ken,joc).
parent(ken,gail).
parent(ken,craig).
parent(ken,rana).
parent(terry,rana).
parent(terry,gail).
parent(terry,joc).
parent(terry,craig).
parent(joe,ken).
parent(jan,ken).
