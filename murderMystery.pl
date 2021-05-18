person(aaron).
person(duane).
person(edwin).
person(betty).
person(clara).
person(flora).

man(aaron).
man(duane).
man(edwin).

woman(betty).
woman(clara).
woman(flora).

related(aaron, betty).
related(aaron, clara).
related(betty, clara).
related(flora, duane).
related(flora, edwin).
related(duane, edwin).

doctor(aaron).
doctor(betty).
doctor(duane).

lawyer(clara).
lawyer(edwin).
lawyer(flora).

menu :- write("Clue A is If the killer and the victim were related, the killer was a man.
To see pairings type \"clue_A(K,V).\" Keep hitting the space bar to see all the pairings

Clue B If the killer and the victim were not related, the killer was a doctor.
To see pairings type \"clue_B(K,V).\" Keep hitting the space bar to see all the pairings

Clue C is If the killer and the victim had the same occupation, the victim was a man.
To see pairings type \"clue_C(K,V).\" Keep hitting the space bar to see all the pairings

Clue D If the killer and the victim had different occupations, the victim was a woman.
To see pairings type \"clue_D(K,V).\" Keep hitting the space bar to see all the pairings

Clue E If the killer and the victim were of the same sex, the killer was a lawyer.
To see pairings type \"clue_E(K,V).\" Keep hitting the space bar to see all the pairings

Clue F is If the killer and victim were different sexes, the victim was a doctor.
To see pairings type \"clue_F(K,V).\" Keep hitting the space bar to see all the pairings

Type \"menu.\" to see the clues again

OR

To guess who the killer and the victim are type \"solution.\" Enter the name of who you think 
the Killer is and who you think the Victim is in the correct order.").

clue_A(X,Y) :- related(X, Y) ; related(Y, X).

clue_B(X,Y) :- person(X), person(Y), not(related(X, Y)), not(related(Y, X)), X\=Y.
	  
clue_C(X,Y) :- doctor(X), doctor(Y), X\=Y ; lawyer(X), lawyer(Y), X\=Y.

clue_D(X,Y) :- doctor(X), lawyer(Y) ; doctor(Y), lawyer(X).
	  
clue_E(X,Y) :- man(X), man(Y), X\=Y ; woman(X), woman(Y), X\=Y.

clue_F(X,Y) :- man(X), woman(Y) ; man(Y), woman(X).

solution :- write("Who is the killer? (Enter answer ending with a period): "), read(K), 
			write("Who is the victim? (Enter answer ending with a period)"), read(V), answer(K,V).

answer(K,V) :- (clue_A(K,V) -> man(K) ; true), (clue_B(K,V) -> doctor(K) ; true), (clue_C(K,V) -> man(V) ; true),
			   (clue_D(K,V) -> woman(V) ; true), (clue_E(K,V) -> lawyer(K) ; true), (clue_F(K,V) -> doctor(V) ; true).