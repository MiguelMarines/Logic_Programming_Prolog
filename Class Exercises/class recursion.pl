%counter example
count(0).

count(X):-
	NewX is X-1,
	count(NewX).

%acumulator example
get_Value(0, 0):-!.

get_Value(Count, Res):-
	NewCount is Count -1,
	get_Value(NewCount, TempRes),
	Res is TempRes +1.

% Left or Head Recursion factorial example 20 secs with 50000
factorial(1,1):-!.

factorial(X,Res):-
	NewX is X -1,
	factorial(NewX,NewRes),
	Res is NewRes *X.

% Right Tail Recursion factorial example 5 secs with 50000
factorialT(1,Res,Res):-!.

factorialT(X,Res,Temp):-
	NewX is X -1,
	NewTemp is Temp * X,
	factorialT(NewX,Res,NewTemp).	