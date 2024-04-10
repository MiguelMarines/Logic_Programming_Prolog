% Miguel Marines.
% Lab 3 Prolog.


% Algorithm Merge Sort that repeatedly breaks down a list into several sublists 
% until each sublist consists of a single element and then merges those sublists
% in a sorted list.


% In case the list is empty
merge_sort([],[]).

% In case the list has a single element.
merge_sort([X],[X]).

% Recursive call, when the list has two or more elements.
merge_sort([X,Y|T],NewSL):-
	split([X,Y|T],L1,L2),
	merge_sort(L1,NewSL1),
	merge_sort(L2,NewSL2),
	merge(NewSL1,NewSL2,NewSL).


% Predicate to divide or split the list, in order to do the merge sort properly.

% In case the lists are empty
split([],[],[]).

% In case the elements have a single element.
split([X],[X],[]).

% Recursive call, when the lists have more than one element.
split([X,Y|T],[X|Tx],[Y|Ty]):-
	split(T,Tx,Ty).


% Predicate to merge the elements.

% In case of having just one element and nothing in the list.
merge(X,[],X).

% In case of having nothing in the list and just one element.
merge([],Y,Y).

% Recursive call, in case of having more than one element.
merge([X|Tx],[Y|Ty],[X|M]):-
	X < Y, merge(Tx, [Y|Ty],M).

merge([X|Tx],[Y|Ty],[X|M]):-
	X = Y, merge(Tx, [Y|Ty],M).

merge([X|Tx],[Y|Ty],[Y|M]):-
	X > Y, merge([X|Tx],Ty,M).


% Test Cases.
% merge_sort([1, 6, 2, 7], X).		->		X = [1, 2, 6, 7]
% merge_sort([13, 46, 25, 12, 27, 1],  X).		->		X = [1, 12, 13, 25, 27, 46]