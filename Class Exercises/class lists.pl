%initialize a list
my_list([1,2,3,4,5,76,83]).

%initialize a list and call rule
prog(X,Z):-
	my_list(X),
	sum_elements(X,Z).

%base case
sum_elements([],0).

%recursive call for parsing a list
sum_elements([H|T],Res):-
	sum_elements(T,NewRes),
	Res is NewRes + H.

%using unification cleverly (stack)
add_elements(X,Term,[X|Term]).

%mixing both stack and at the same time summing the elements
add_elements(X,Term,[X|Term],Y):-
	sum_elements([X|Term],Y).


%1 ?- sum_elements([1,2,3,46],R).
%R = 52.

%3 ?- prog(X,Z).
%X = [1, 2, 3, 4, 5, 76, 83],
%Z = 174.

%4 ?- add_elements(A,B,[1,2,3,55,66]).
%A = 1,
%B = [2, 3, 55, 66].

%5 ?- add_elements(A,B,[1,2,3,55,66],Y).
%A = 1,
%B = [2, 3, 55, 66],
%Y = 127.