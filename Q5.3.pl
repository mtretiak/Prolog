
%Q5.3: Palindromic list.
%A palindromic list is a list that is read the same forward and back.
%A list is palindromic if its first value is the same as the last, second %same as second last, etc. OR if a list is the reversed as it is normally

reversed(List,Rlist):- %take in two lists
	reversed(List,Rlist,[]).

reversed([],L,L).
reversed([H|T], L, X):-
	reversed(T,L,[H|X]).%check the head and tail

palindromic(L):-
    reversed(L,L).