%%%Cut(!) / Fail / Univ(=..) / Call / Not

%%%member_chk_one

member_chk_one(X,[X|_]):-!.
member_chk_one(X,[_|Rest]):-
	member_chk_one(X,Rest).
	
	
%%%intersect/3 using not(Too much time).

intersect([],_,[]).

intersect([X|Rest],List,[X|Solution]):-
	member(X,List),
	intersect(Rest,List,Solution).
	
intersect([X|Rest],List,[Solution]):-
	not(member(X,List)),
	intersect(Rest,List,Solution).


%%%Instead we can use cut(!).
intersect_cut([],_,[]).

intersect_cut([X|Rest],List,[X|Solution]):-
	member(X,List),
	!,
	intersect_cut(Rest,List,Solution).
	
intersect_cut([X|Rest],List,[Solution]):-
	intersect_cut(Rest,List,Solution).
	

%%%Write in the console every element of a list without using Recursion.
%%%So called Failure Driven Loop.
%%%No recursion so there is not much memory consumption except member.

write_list(List):-
	member(X,List),
	write(X),nl,
	fail.

write_list(_).
%%%Predicate Success after the fail-repeat stops.



%%%not_pred/1
%%%Success when a call fails. 
not_pred(C):-
	call(C),
	!,
	fail.

not_pred(_).

%%% Using Call and Univ

%%%list_operation,4
%%%Variable Oper is the predicate one wants to call and the rest are the arguments


list_operation(Oper,List1,List2,Result):-
	Predicate=..[Oper,List1,List2,Result],
	call(Predicate).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Some Exercises on those Prolog features:



%%%Returns the difference of the two lists.
%%%set_diff/3

set_diff([],_,[]).

set_diff([X|Rest],List,[X|Solution]):-
	not(member(X,List)),
	!,
	set_diff(Rest,List,Solution).
	
set_diff([_|Rest],List,Solution):-
	set_diff(Rest,List,Solution).
	

%%%Returns the union of two given lists.
%%%lunion/3

lunion([],List,List).
lunion([H1|Tail],List,[H1|Solution]):-
	not(member(H1,List)),!,
	lunion(Tail,List,Solution).

lunion([H1|Tail],List,Solution):-
	lunion(Tail,List,Solution).
	



%%%Max of a list without Recursion.
%%%Max/2

max_list(Max,List):-
	member(Max,List),
	not((member(Y,List),Y>Max)).
	
	

%%%Returns the unique elements of a list.
%%%Unique_element/2

unique_element(X,List):-
	delete(X,L,LRemoved),
	not(member(X,LRemoved)).




%%%Map : Apply some calulation to every member of a list e.g. square/double.
%%%map/3

square(X,R):-
	R is X*X.

double(X,R):-
	R is 2*X.

map(_,[],[]).

map(Operation,[X|Tail],[Y|ResultTail]):-
	Predicate =..[Operation,X,Y],
	call(Predicate),
	map(Operation,Tail,ResultTail).
	




%%%Reduce : Applying a calculation to every pair of a list e.g. max,min,plus,times
%%%(existing in EcliPSe Prolog).
%%%reduce/3

reduce(_,[X],X).

reduce(Operation,[Head1,Head2|Tail],Result):-
	Predicate =..[Operation,Head1,Head2,ThisResult],
	call(Predicate),
	reduce(Operation,[ThisResult|Tail],Result).
	



























