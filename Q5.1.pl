%Question 5: Create a prolog program that checks if L2 is L1 with X added/appended on the end.
%English description is in word document


%creates new list but last value
blist([X|Xs], Ys) :-
   blist_prev(Xs, Ys, X).            

blist_prev([], [], _).
blist_prev([X1|Xs], [X0|Ys], X0) :-  
   blist_prev(Xs, Ys, X1). 

%finds last value
last(X,[X]). %X is the only element, thus true
last(X,[_|T]):- %If X is the last element of the tail, then X is the last element of list, head doesn’t matter
	last(X,T).

%checks if two lists are equal
is_equal([],[]).
is_equal([H1|T1],[H2|T2]):- H1=:=H2,is_equal(T1,T2).

%puts it all together and checks if l2 is equal to l1
%without the last digit, and that the last digit is
%X
app(L1,X,L2):-
    last(X,L2),
    blist(L2,BList),
    is_equal(L1,BList).