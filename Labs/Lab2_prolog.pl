% Miguel Marines.
% Lab 2 Prolog.



% ANY POSITIVE
% Predicate that returns true if a list contains at least one positive
% number, otherwise it returns false.


% Base Case.
any_positive([H]):- 
	H > 0,
	!.

% Recursive Call.
any_positive([H|T]):-
	H > 0 ->
	!;
	any_positive(T).


% Test Cases.
% any_positive([-1, -2, 3,-4]).		->		true
% any_positive([-1, -2, -3,-4]).		->		false



% SUBTITUTE
% Predicate to substitute specific elements of the list with
% other specific elements.


% Base Case.
substitute(_, _, [], []).

% Recursive Call.
substitute(E, S, [E|T], [S|T2]):- 
	substitute(E, S, T, T2).

% Recursive Call.
substitute(E, S, [H|T], [H|T2]):-
	H \= E,
	substitute(E, S, T, T2).


% Test Cases.
% substitute(2, 3, [1, 2, 2, 2, 3, 2], X).		->		X = [1, 3, 3, 3, 3, 3]



% ELIMINATE DUPLICATES
% Predicate to remove the duplicated elements from a list.


% Base Case.
eliminate_duplicates([], []).

% Recursive Call.
eliminate_duplicates([H|T], [H|T2]):- 
    eliminate(H, T, T3),
    eliminate_duplicates(T3, T2).


% Base Case.
eliminate(_, [], []).

% Remove head from the list.
% Recursive Call.
eliminate(X, [X|T], T2):-
	eliminate(X, T, T2).

% Remove element from tail.
% Recursive Call.
eliminate(X, [H|T], [H|T2]):-
    X \= H,
    eliminate(X, T, T2).

% Test Cases.
% eliminate_duplicates([a, a, a, a, b, c, c, a, a, d, e, e, e, e],X).
% X = [a, b, c, d, e]



% INTERSECT
% Predicate that returns the elements in common in two lists.


% Base Case.
intersect([], _, []).

% Recursive Call.
intersect([H|L1T], L2, L3):-
        memberchk(H, L2),
        !,
        L3 = [H|L3T],
        intersect(L1T, L2, L3T).

intersect([_|L1T], L2, L3):-
        intersect(L1T, L2, L3).


% Base Case.
memberchk(X, [X|_]):-
	!.

% Recursive Call.
memberchk(X,[_|T]):-
	memberchk(X, T).


% Test Cases.
% intersect([a, b, c, d], [b, d, e, f], X).		->		X = [b, d]



% INVERT
% Predicate to reverse a list.

% Base Case.
invert([],[]).

% Recursive Call.
invert([H|T], NL):-
    invert(T, NLT),
    concatenate(NLT, [H], NL).

% Base Case.
concatenate([], L, L).

% Recursive Call.
concatenate([H|T], L, [H|T2]) :-
    concatenate(T, L, T2).


% Test Cases.
% invert([a, b, e, c, e],X).		->		X = [e, c, e, b, a]



% LESS THAN
% Predicate that returns the elements in a list that are smaller
% than a given number.

% Base Case.
less_than(_, [], []).

% Recursive Call.
less_than(N, [H|T], NL):-
    (
    	H < N ->
    	NL = [H|L1T];
    	NL = L1T
    ),
    less_than(N, T, L1T).

% Test Cases.
% less_than(5, [1, 6, 5, 2, 7], X).     ->      X = [1, 2] 



% MORE THAN
% Predicate that returns the elements of alist that are greater
% than a given number.


% Base Case.
more_than(_, [], []).

% Recursive Call.
more_than(N, [H|T], NL):-
    (
    	H > N ->
    	NL = [H|L1T];
    	NL = L1T
    ),
    more_than(N, T, L1T).


% Test Case.
% more_than(5, [1, 6, 5, 2, 7], X).		->		X = [6, 7]



% ROTATE
% Predicate to rotate a list a specific number of positions

rotate(L, N, NL):-
	( N > 0 ->   
    list_length(H, N),
    list_append(T, H, NL),
    list_append(H, T, L);

    NewN is N * -1,
    list_length(T, NewN),
	list_append(H, T, L),
	list_append(T, H, NL)).

% Base Case.
list_append([], X, X).

% Recursive Call.
list_append([H|T], X, [H|T2]):-
	list_append(T, X, T2).


% Recursive Call.
list_length(X,L):-
	list_length(X,0,L).

% Base Case.
list_length([], L, L).
% Recursive Call.
list_length([_|Xs], T, L):-
	T2 is T + 1,
	list_length(Xs, T2, L).


% Test Cases.
% rotate([1, 6, 5, 2, 7], 3, X).	->	X = [2, 7, 1, 6, 5]
% rotate([1, 6, 5, 2, 7], -3, X).	->	X = [5, 2, 7, 1, 6]