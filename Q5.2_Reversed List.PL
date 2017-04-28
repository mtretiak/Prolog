%Question 5.2: Check if list is reversed.
%sample query: ?- reversed([1,2],[2,1]). True
%reversed([1,2,3],[2,1]). False

reversed(List,Rlist):- %take in two lists
	reversed(List,Rlist,[]). %pass the twos lists and an empty list

reversed([],L,L). %checks to see if we have two empty lists
									%takes list,rlist, and empty list. if all lists are empty, returns true
reversed([H|T], L, X):- %get the head and tail,
	reversed(T,L,[H|X]).%check the head and tail


	reversed([],[]). %if both lists are empty, return true
	reversed([H|L1],L3) :- %otherwise get head, get tail (which is list l1) and create l3
	  app(L2,H,L3), %and 
	  reversed(L1,L2).
