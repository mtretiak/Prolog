% CPSC 449 Assignment 1
% Question 4
% Authors: Michael Tretiak
%  
%  Purpose: Part1: define a reflexive relationship
%           Part2: define a symetric relationship
%           part3: define a transitive relationship


% part 1
%% x y is reflexive if lt is x y
%% or if pair is xx
refLT(X,Y) :- lt(X,Y).
refLT(X,X).

% part 2
%% x y is symetric if lt is x y, or if lt is y x
%% X is related to B IF AND ONLY IF b is related to A
symLT(X,Y) :- lt(X,Y).
symLT(X,Y) :- lt(Y,X).

% part 3
% x y is transitive if x is y, and y is z, then x is z
% when x y if lt is x y, or x y if x z then z y
%transitive x y if lt x z when trans z y
transLTBad(X,Y) :- lt(X,Y).
transLTBad(X,Y) :-
  lt(X,Z),
  transLTBad(Z,Y).
