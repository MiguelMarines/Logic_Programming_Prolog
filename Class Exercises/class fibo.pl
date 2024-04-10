%base cases
fibo_H(1,1).
fibo_H(2,1).

%recursive call
fibo_H(X,R):-
	X1 is X-1,
	X2 is X-2,
	fibo(X1,R1),
	fibo(X2,R2),
	R is R1 + R2.
	


%base cases
fibo_T(0,Res,_,Res).

%recursive call
fibo_T(X,T1,T2,Res):-
	X > 0,
	X1 is X-1,
	NT is T1+T2,
	fibo_T(X1, T2, NT, Res).