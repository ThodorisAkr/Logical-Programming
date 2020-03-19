%%%Lists



%%%Exercise 1:The sum of all elemets in a list.

%%%sumoflist/2

sumoflist([],0).

sumoflist([H|T],Sum):-
	sumoflist(T,NewSum),
	Sum is NewSum + H.

%%%Exercise 2:Return the Element before the last element of a List.

%%%Beforelastelement/2

beforelastelement([X],X).
beforelastelement([X,_],X).

beforelastelement([_|T],Element):-
	beforelastelement(T,Element).
	
%%%Exercise 3:Check how many times a Value occurs in a List.

%%%occurs/3

occurs(_,[],0).

occurs(Value,[Value|T],Times):- 	
	occurs(Value,T,NewTimes),
	Times is NewTimes + 1.
	
occurs(Value,[H|T],Times) :-
	H \= Value,
	occurs(Value,T,NewTimes),
	Times is NewTimes.
	
	
%%%Exercise 4:Returns the Count of odd numbers in a List.
	
%%%Countodd/2

countodd([],0).

countodd([H|T],Times):-
	1 is H mod 2,
	countodd(T,NewTimes),
	Times is NewTimes + 1.


countodd([H|T],Times):-
	0 is H mod 2,
	countodd(T,NewTimes),
	Times is NewTimes.
	
%%%Exercise 5:Sum of Vowels in a list of chars.

occursin(_,[],no).
occursin(X,[X|_],yes).

occursin(Char,[H|T],Flag):-
	H \= Char,
	occursin(Char,T,Flag).

count_vowels([],0).

count_vowels([H|T],Num):-
	occursin(H,[a,e,i,o,u,y],Flag),
	Flag = yes,
	count_vowels(T,NewNum),
	Num is NewNum + 1.
	
count_vowels([H|T],Num):-
	occursin(H,[a,e,i,o,u,y],Flag),
	Flag = no,
	count_vowels(T,NewNum),
	Num is NewNum.
	

%%%Exercise 6:Sum of all even numbers of an integer list.

%%%sum_even/2

sum_even([],0).

sum_even([H|T],EvenSum):- 
	0 is H mod 2,
	sum_even(T,NewEvenSum),
	EvenSum is NewEvenSum + H.
	

sum_even([H|T],EvenSum):- 
	1 is H mod 2,
	sum_even(T,NewEvenSum),
	EvenSum is NewEvenSum.

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

























