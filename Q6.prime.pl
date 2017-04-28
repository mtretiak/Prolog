% CPSC 449 Assignment 1
% Question 6
% Authors: Michael Tretiak
%  Purpose: Program takes input as a number and returns if number is prime.
%Example query: prime(3). return true. prime(4). return false



%checks if X mod Y is equal to zero
%cut so prolog does not backtrack and get muliple answers
%if 0 = x mod y, we know its divisable.
div(X,Y) :-
	0 is X mod Y, !.

%make sure div(x,y) is true for all numbers less than itself
div(X,Y) :-
	X > s(Y), div(X, s(Y)).


%if prime(x) is queried, we know its prime
prime(2) :-
	true,!.
%0,1 are not prime
prime(X) :-
	X < 2,!,false.
%call div(x,2) to see if divisable by two
prime(X) :-
    %return true when x cannot be divided by 2
    %returns false when x can be deviced by 2
	not(div(X, 2)).
