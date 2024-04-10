% create the larger than rule, that recieves two numbers, and returns 
% the larger one 
% Test case:
% larger (3, 1, Y).
% Y = 3
larger(X,Y,X):- X > Y.
larger(X,Y,Y).

% create the pivoting rule, that recieves a list 
% and an element, and returns 2 lists: Lesser and Greater 
% Test case:
% pivoting (3, [1 2 4 5 6], X, Y).
% X = [1 2]
% Y = [4 5 6]
pivoting(_H,[],[],[]).
pivoting(H,[X|T],[X|L],G):-X=<H,pivoting(H,T,L,G).
pivoting(H,[X|T],L,[X|G]):-X>H,pivoting(H,T,L,G).

% create the append rule, that recieves 2 lists
% and returns all the element appneded in a 3rd list
% Test case:
% append([1 2] , [4 5 6], X).
% X = [1 2 4 5 6]
my_append([],X,X).

my_append([H|T],L,[H|Res]):-
	my_append(T,L,Res).

%create the quick_sort  rule which receives and un ordered 
%list and returns the list in correct order using quick sort algorithm
%quick_sort([10, 3, 2, 6], X).
% X= [2, 3, 6, 10]
quick_sort([],[]).
quick_sort([H|T],Sorted):-
	pivoting(H,T,L1,L2),
	quick_sort(L1,Sorted1),
	quick_sort(L2,Sorted2),
	my_append(Sorted1,[H|Sorted2], Sorted).

pivoting(_H,[],[],[]).
pivoting(H,[X|T],[X|L],G):-X=<H,pivoting(H,T,L,G).
pivoting(H,[X|T],L,[X|G]):-X>H,pivoting(H,T,L,G).