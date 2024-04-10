a(1).
b(1).
c(1).
 
b(2).
c(2).
d(2).
e(2).
 
f(3).

%see the different  backtracking trees that are built.
%p(X) :- b(X),c(X),d(X),e(X).

p(X) :- b(X),c(X),!,d(X),e(X).


i(1).
i(2).
j(1).
j(2).
j(3).

s(X,Y) :- q(X,Y).
s(0,0).
 
%q(X,Y) :- i(X),j(Y).
 
q(X,Y) :- i(X),!,j(Y).