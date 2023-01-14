/* exercicio a */

%% MALES

male(frank).
male(phil).
male(jay).
male(dylan).
male(george).
male(javier).
male(merle).
male(mitchell).
male(joe).
male(manny).
male(cameron).
male(rexford).
male(luke).
male(bo).
male(calhoun).


%% FEMALES

female(grace).
female(claire).
female(gloria).
female(barb).
female(pameron).
female(haley).
female(poppy).
female(alex).
female(lily).
female(dede).

%% KIDS 

parent(grace, phil).
parent(frank, phil).

parent(dede, claire).
parent(jay, claire).

parent(dede, mitchell).
parent(jay, mitchell).

parent(jay, joe).
parent(gloria, joe).

parent(gloria, manny).
parent(javier, manny).

parent(barb, cameron).
parent(merle, cameron).

parent(barb, pameron).
parent(merle, pameron).

parent(pameron, calhoun).
parent(bo, calhoun).

parent(cameron, lily).
parent(mitchell, lily).

parent(cameron, rexford).
parent(mitchell, rexford).

parent(phil, haley).
parent(claire, haley).

parent(phil, alex).
parent(claire, alex).

parent(phil, luke).
parent(claire, luke).

parent(dylan, george).
parent(haley, george).

parent(dylan, poppy).
parent(haley, poppy).

/* exercicio b 

i)      female(haley).
ii)     male(gil).
iii)    parent(frank, phil).
iv)     parent(X, claire).
v)      parent(gloria, X).
vi)     grandparent(jay, X).
vii)    grandparent(X , lily).
viii)   parent(alex, X).
ix)     parent(jay, X), \+ parent(gloria, X).

*/

/* exercicio c
*/

father(X, Y):-
    male(X),
    parent(X,Y).

grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

grandmother(X, Y) :-
    female(X),
    grandparent(X, Y).

sibilings(X, Y):-
    parent(Z, X),
    parent(Z, Y), 
    parent(D, X),
    parent(D, Y),
    Z \= D,
    X \= Y.

halfsibilings(X,Y):-
    parent(Z, X),
    parent(Z, Y),
    \+ sibilings(X,Y),
    X \= Y.

cousins(X, Y):-
    grandparent(Z, X),
    grandparent(Z, Y),
    \+ sibilings(X, Y),
    \+ halfsibilings(X, Y),
    X \= Y.
    
uncle_aunt(X, Y):-
    parent(X, Z),
    cousins(Z, Y),
    \+ parent(X, Y);

    parent(D, Y),
    sibilings(X, D),
    \+ parent(X, Y).

uncle(X, Y):-
    uncle_aunt(X, Y),
    male(X).

aunt(X, Y):-
    uncle_aunt(X, Y),
    female(X).

/*
 exercicio d
    cousins(haley, lily).
    father(X, luke).
    uncle(X, lily).
    grandmother(X, _).
    sibilings(X, Y).
    halfsibilings(X, Y).
*/

/*
 exercicio e
*/

marry(jay, dede, 1968).
marry(jay, gloria, 2008).
divorce(jay, dede, 2003).

divorce(X, Y, Z) :- divorce(Y, X, Z).
marry(X, Y, Z) :- marry(Y, X, Z).

