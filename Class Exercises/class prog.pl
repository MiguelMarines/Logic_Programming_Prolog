%*******************************************************************
% flatten(L,L1): flatten a list of atoms (atoms and numbers) L to 
% a flat list L1. 

flatten([],[]).
flatten([A|L],[A|L1]) :- 
     xatom(A), flatten(L,L1).
flatten([A|L],R) :- 
     flatten(A,A1), flatten(L,L1), append(A1,L1,R).

xatom(A) :- atom(A).
xatom(A) :- number(A).

% tests

f(I) :- flatten([2,[a]], I).
f1(I) :- flatten([2,[a],[b,5,[c],d],9], I).


%*******************************************************************
profundidad([A|_],A,1).
profundidad([H|_],A,N):-
    % H\=A,
    profundidad(H,A,R),
    N is R+1.
profundidad([H|T],A,N):-
    H\=A,
    profundidad(T,A,N).


% profundidad([2,3,4,5,[[6]],10],6,X).



%*******************************************************************

sum_nested([], Sum, Sum) :- !.

sum_nested([X|Xs], Acc, Sum) :- !,
    sum_nested(X, 0, Sum_Nested),
    Acc1 is Acc + Sum_Nested,
    sum_nested(Xs, Acc1, Sum).

sum_nested(Number, Acc, Sum) :-
    Sum is Number + Acc.

%Test Case
%sum([2,3,[4,5,[6],7],9], S).   ->    36



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Sum of the elements of a nested list.


sum_nested([], Sum, Sum) :- !.

sum_nested([X|Xs], Acc, Sum) :- !,
    sum_nested(X, 0, Sum_Nested),
    Acc1 is Acc + Sum_Nested,
    sum_nested(Xs, Acc1, Sum).

sum_nested(Number, Acc, Sum) :-
    Sum is Number + Acc.


% Test Case.
% sum_nested([2,3,[4,5,[6],7],9], 0, S).   ->    36

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
memberr(X, [X|_]).                 %X is first element
memberr(X, [L|_]) :- memberr(X, L). %X is member of first element
memberr(X, [_|T]) :- memberr(X, T). %X is member of tail