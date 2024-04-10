% Miguel Marines.
% Lab 2 Italy Paths.


% FACTS PATHS ITALY
road(placentia,ariminum).
road(ariminum,placentia).
road(placentia,genua).
road(genua,placentia).
road(genua,pisae).
road(pisae,genua).
road(genua,roma).
road(roma,genua).
road(pisae,roma).
road(roma,pisae).
road(ariminum,ancona).
road(ancona,ariminum).
road(ariminum,roma).
road(roma,ariminum).
road(ancona,castrumTruentinum).
road(castrumTruentinum,ancona).
road(castrumTruentinum,roma).
road(roma,castrumTruentinum).
road(roma,capua).
road(capua,roma).
road(brundisium,capua).
road(capua,brundisium).
road(capua,rhegium).
road(rhegium,capua).
road(rhegium,messana).
road(messana,rhegium).
road(messana,lilibeum).
road(lilibeum,messana).
road(catina,messana).
road(messana,catina).
road(catina,syracusae).
road(syracusae,catina).





% Rule Can Get To, which returns true if there is a path that starts in an
% origin city and following the directionality of the roads can get to destination city.

% Base Case.
can_get_to(X,Z):-
	road(X,Z).

% Recursive Call.
can_get_to(X,Z):-
	road(X,Y),
	can_get_to(Y,Z).





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




% Base Case.
path(Origin,Destiny,Path):-
	road(Origin,Destiny),
	Path = [Origin, Destiny].

% Recursive Call.
path(Origin,Destiny,[]):-
	road(Origin,Transition),
	addElement(Transition, [], [Transition]),
	path(Transition,Destiny,Path).

addElement(X, [], [X]). 
addElement(X, [Y | Rest], [X,Y | Rest]) :- X @< Y, !.
addElement(X, [Y | Rest1], [Y | Rest2]) :- addElement(X, Rest1, Rest2).




% Test Cases:
% can_get_to(lilibeum,capua).	->	true
% can_get_to(placentia,roma).	->	true
% can_get_to(messana,capua).	->	true
% can_get_to(roma,pisae).		->	false
% can_get_to(capua,catina).		->	false
% can_get_to(ancona,messana).	->	false



% Predicate Size, which returns the number of cities crossed in the path from
% the origin city to the destination city.

% Base Case.
size(X,Y,Z):-
	road(X,Y),
	write(X),
	tab(1),
	write(Y),
	Z is 0.

% Recursive Call.
size(X,Y,Z):-
	road(X,W),
	size(W,Y,NewZ),
	Z is NewZ + 1,
	tab(1),
	write(NewZ).

% size(pisae,roma,Z).	->	Z = 0
% size(placentia,roma,Z).	->	Z = 1
% size(placentia,castrumTruentinum,Z).	->	Z = 2
% size(lilibeum,roma,Z).	->	Z = 3
% size(syracusae,roma,Z).	->	Z = 4


% Predicate min, which returns the minimum number of three given numbers.

% Case 1
min(A,B,C,Z):-
	B >= A,
	C >= A,
	Z is A.

% Case 2
min(A,B,C,Z):-
	A >= B,
	C >= B,
	Z is B.

% Case 3
min(A,B,C,Z):-
	A >= C,
	B >= C, 
	Z is C.

% Test Cases:
% min(1,2,3,Z).	->	1
% min(2,1,3,Z).	->	1
% min(2,3,1,Z).	->	1
% min(-8,3,1,Z).	->	-8


% Predicate GDC, which returns the greatest common divisor or highest common factor
% of two numbers.

% In case the first number is 0.
gcd(0,X,X):-!.

% In case the second number is 0.
gcd(X,0,X):-!.

% In case the first number is greater than the first one.
gcd(X,Y,Z):-
	X >= Y,
	X1 is X - Y,
	gcd(X1,Y,Z).

% In case the second number is greater than the second one.
gcd(X,Y,Z):-
	X < Y,
	X1 is Y - X,
	gcd(X1,X,Z).

% Test Cases:
% gcd(4,8,Z).	->	4
% gcd(27,9,Z).	->	9
% gcd(12,4,Z).	->	4
% gcd(16,24,Z).	->	8
