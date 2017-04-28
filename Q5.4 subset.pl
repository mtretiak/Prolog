%Q5.4: Creates all sublists of a given list.
%Example query: ?-subSet([1,2,3],X). returns: [1]; [2]; [3]; [1,2]; etc.

subSet(L, S) :-%take in list and variable
 leng(L, N),%takes length of list
 tween(1, N, M),%makes sure were between values
 leng(S, M),%gets length of second list
 append([_,S,_], L).%adds to second list