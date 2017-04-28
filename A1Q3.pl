% CPSC 449 Assignment 1
% Question 3
% Authors: Michael Tretiak
%  Purpose: create a prolog application that returns true when given number is
%             odd, and false when not odd



%% We know suc zero is odd (one)
odd(suc(zero)).
%%if odd suc suc can be unified with odd x, x is odd
odd(suc(suc(X))) :- odd(X).
