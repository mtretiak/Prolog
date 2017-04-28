%Q5.5: Returns all permutations of a given list
%Example query: ?-perm([1,2,3],X). return: [1,2,3]; [1,3,2]; [2,1,3]; etc


perm([],[]).%if empty list
perm(L,[X|Y]):-
    perm(L,X,T),
    perm(T,Y).
perm([X|Y],X,Y).
perm([X|Y],Z,[X|T]):-
     perm(Y,Z,T).