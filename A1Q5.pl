% CPSC 449 Assignment 1
% Question 5
% Authors: Michael Tretiak
%  
%  Purpose: App: check if a list2 is list1 with x on the end
%           reversed: check if list2 is list21 reversed
%           palindromic: check if a list is a palindrom, read same forwards and back
%           sublists: checks if S is a sublist of L
%              uses: conc, sublist, and setof
%           perms: checks if a list of lists is all the permutations of given list
%              uses: insert, del, setof




app([],X,[X]).%if empty list, add x to list
app([H|L1],X,[H|L2]) :- app(L1,X,L2). %take in list1 num to check and list 2
%example app([1],1,[1]) breaksdown to h1=1 (head value) l1 =[], x = 1, h2=1
% l2=[]. app([],1,[]), app([],1,[]) is not true based  on first line, returns false

reversed([],[]). %if empties, true
reversed([H|L1],L3) :- %gets head, l1 = tail, l3 = og list
  app(L2,H,L3), % check if passed lists values are on the end of l3
  reversed(L1,L2). %pass list leftovers from app
% reversed ([1],[2,1])
% not empties
% h=1 l1=[] l3 [2,1]
% app([],h,[2,1])
% app([],1,[2,1]) false
% app([],1,[2,1])
% h1 = nill x = 1 h2 = 2 l2 =[1]
% app([] , 1 , [1]) true
% reversed([],[1])
% fails empty set
% failed app, returns false


palindromic(L) :- reversed(L,L). % passes a copy of list to reversed,
                                  %if forward list is the same as reversed, return true

conc([],L,L). %checks if lists are empty
conc([X|L1],L2,[X|L3]) :- conc(L1,L2,L3).%splits list into three
%checks if L1 and L2 create L3
% example conc ([1],[2], [1,2])
% conc([],L,L) FALSE move on
% conc ([1],[2], [1,2]) x1=1,L2=[2],x2=1,l3=[2]
% conc([], [2], [2]) which matches to first case, returns true

sublist(S,L) :-
  conc(L1,L2,L),
  conc(S,L3,L2).

sublists(L,Ls) :- setof(S,sublist(S,L),Ls).

%insert(X,L1,L2) asserts that L2 is L1 with X inserted into it.
del(X,[X|T],T).
del(X,[Y|T],[Y|T2]) :-
  del(X,T,T2).
  %x=[1,2], x=1, t=2, t=[] false
  %x = [1,2] y = 1, t=2, y=1, t2=2
  %del([1,2], 2, 2)
  % x = [1,2] x=2, t=nill. t=2 false
  % x =[1,2] y=2 t=nill y=2 t2=nill
  %del([1,2], nill, nill)
  % x = [1,2] x = nill t =nill t=nill ?
  %not sure how this one works



insert(X,L,BigL) :- del(X,BigL,L).

% x=[1,2] l=[] BigL=[1,2]
%del = ([1,2],[1,2],[])


perm([],[]).% checks for empty list
perm([H|L1],L3) :-
  perm(L1,L2),
  insert(H,L2,L3).

  %perm ([[1]],[1])
  %h=[1] l1= [] l3=[1]
  %perm([],[]) true

  %perm([[1,2],[2,1]],[1,2])
  %h = [1,2] l1=[2,1] l3 = [1,2]
  %perm ([2,1],[])false move on
  %insert([1,2],[],[1,2])


perms(Ls,L) :- setof(X,perm(L,X),Ls).
