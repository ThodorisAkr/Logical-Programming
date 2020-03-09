%%%sumn/2
%%%Given a positive Number, calculating the Sum of all Integers from 1 to this Number.
sumn(1,1).

sumn(Number,Result):-
	Number > 1,
	NewN is Number-1,
	sumn(NewN,NewResult),
	Result is NewResult + Number.
	
