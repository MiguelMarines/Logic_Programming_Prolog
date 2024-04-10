% comments are written like this */

%knowledge base
% relation(a,b) can be read as relation of a to b
dad(billy,bob).
dad(bob,sue).
dad(bob,alex).
dad(alex,john).
dad(john,pete).
dad(pete,jack).
mom(ana,erika).
mom(erika,sue).
mom(sue,sussy).
mom(ana,billy).  

%simple rule, this will be true if each requirement is met
grandpa(X,Z):-
	dad(X,Y),
	dad(Y,Z);
	dad(X,Y),
	mom(Y,Z).

grandma(X,Z):-
	mom(X,Y),
	dad(Y,Z);
	mom(X,Y),
	mom(Y,Z).

granparent(X,Z):-
	grandpa(X,Z);
	grandma(X,Z).
	
%base case	
ancestor(X,Z):-
	dad(X,Z);
	mom(X,Z).

%recursive call
ancestor(X,Z):-
	(dad(X,Y);
	mom(X,Y)),
	ancestor(Y,Z).

different(X,Y):-
	X\=Y.

sibilings(X,Y):-
	(mom(Z,X),
	mom(Z,Y);
	dad(Z,X),
	dad(Z,Y)),
	X \== Y.
	
relative(X,Y):-
	X \== Y,
	((dad(Z,Y);
	dad(Z,X));
	(mom(Z,Y);
	mom(Z,X));
	(ancestor(X,Y);
	ancestor(Y,X))).