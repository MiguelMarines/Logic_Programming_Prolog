/**
Miguel Marines
Prolog comment
Lab 0
*/

%Head Recursion factorial instructuions of the excecise

%Base case
factorial(1,1):-!.

%Recursive call
factorial(X,Res):-
	NewX is X -1,
	factorial(NewX,NewRes),
	Res is NewRes *X.
	
%Test cases for factorial head
test_factorial_H(X,Y,Z):-
	factorial(1,X),
	factorial(5,Y),	
	factorial(20,Z).
	
%Tail Recursion factorial 
factorialT(1,Res,Res):-!.

%Recursive call
factorialT(X,Res,Temp):-
	NewX is X -1,
	NewTemp is Temp * X,
	factorialT(NewX,Res,NewTemp).	

%Test cases for factorial tail
test_factorial_T(X,Y,Z):-
	factorialT(1,X),
	factorialT(5,Y),	
	factorialT(20,Z).