% CPSC 449 Assignment 1
% Question 8.1
% Authors: Code: Supplied in assignment Comments: Michael Tretiak
%  10173301
%  Purpose: pack(L1,L2) :- the list L2 is obtained from the list L1 by packing
%    repeated occurrences of elements into separate sublists.


%pack "unpacks" a list into its seperate sublists of single elements,
%unless the ints show up back to back are the same
%eg. pack([1,2,3,3,4,3],X) will return ([1],[2],[3,3],[4],[3])
pack([],[]). %checks empty
pack([X|Xs],[Z|Zs]) :- transfer(X,Xs,Ys,Z), pack(Ys,Zs).
%sends x=head and xs [] as well as z=head and Ys = [] to transfer

%creates a new list for output after and if x == x then puts it in the same list
%if not calls transfer again
transfer(X,[],[],[X]).%if xs only contains x, then [x] is new list to return
transfer(X,[Y|Ys],[Y|Ys],[X]) :- X \= Y.%if x does not equal y, pack into new list
transfer(X,[X|Xs],Ys,[X|Zs]) :- transfer(X,Xs,Ys,Zs).%if they are the same, pack into same list
