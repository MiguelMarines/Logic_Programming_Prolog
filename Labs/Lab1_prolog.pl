% Miguel Marines.
% Lab 1 Prolog.


% FACTS PERSONS AND HOBBIES
hobby(juan,kaggle).
hobby(luis,hack).
hobby(elena,tennis).
hobby(midori,videogame).
hobby(simon,sail).
hobby(simon,kaggle).
hobby(laura,hack).
hobby(hans,videogame).


% Rule Compatible, which returns true if 2 persons are compatible
% given that they have a hobby in common, otherwise it returns false.

compatible(X,Y):-
	hobby(X,Z),
	hobby(Y,Z).

% Test Cases:
% compatible(juan,simon).	->	true
% compatible(luis,laura).	->	true
% compatible(elena,midori).	->	false
% compatible(simon,elena).	->	false


% FACTS PATHS THAT LEAD TO ROME
road(placentia,ariminum).
road(placentia,genua).
road(genua,pisae).
road(genua,roma).
road(pisae,roma).
road(ariminum,ancona).
road(ariminum,roma).
road(ancona,castrumTruentinum).
road(castrumTruentinum,roma).
road(lilibeum,messana).
road(syracusae,catina).
road(catina,messana).
road(messana,rhegium).
road(rhegium,capua).
road(brundisium,capua).
road(capua,roma).

% Rule Can Get To, which returns true if there is a path that starts in an
% origin city and following the directionality of the roads can get to destination city.

% Base Case.
can_get_to(X,Z):-
	road(X,Z).

% Recursive Call.
can_get_to(X,Z):-
	road(X,Y),
	can_get_to(Y,Z).

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
	Z is 0.

% Recursive Call.
size(X,Y,Z):-
	road(X,W),
	size(W,Y,NewZ),
	Z is NewZ + 1.

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
