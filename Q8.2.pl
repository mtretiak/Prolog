% CPSC 449 Assignment 1
% Question 8.2
% Authors: Code: Supplied in assignment Comments: Michael Tretiak
%  Purpose:
  % rotate(L1,N,L2) :- the list L2 is obtained from the list L1 by
  %    rotating the elements of L1 N places to the left.
  %    Examples:
  %    rotate([a,b,c,d,e,f,g,h],3,[d,e,f,g,h,a,b,c])
  %    rotate([a,b,c,d,e,f,g,h],-2,[g,h,a,b,c,d,e,f])
  %    (list,integer,list) (+,+,?)

:- ensure_loaded(p17).

rotate(L1,N,L2) :- N >= 0,%takes two lists l1 and l2 and an amount to %rotate them, when n is zero or greater
%finds the length of L1 and sets NL1 to length of L1. sets N1 to
%rotation amount mod length, then passes it to rotate_left
   length(L1,NL1), N1 is N mod NL1, rotate_left(L1,N1,L2).

%when n is less than zero
rotate(L1,N,L2) :- N < 0,
%finds the length of L1 and sets NL1 to length of L1. sets N1 to
%the lenght of the list then adds the rotation amount, then passes it to rotate_left
   length(L1,NL1), N1 is NL1 + (N mod NL1), rotate_left(L1,N1,L2).


%splits the list into two and then appends them together to create %new list
rotate_left(L,0,L).
rotate_left(L1,N,L2) :- N > 0, split(L1,N,S1,S2), append(S2,S1,L2).
