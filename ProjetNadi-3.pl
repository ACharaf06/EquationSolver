
% le concept est de transformer toutes les equations en un polynome=0
% Un polynome va etre represente en une liste de puissance croissante, ex: [1 0 3] signifie 1 + 3x^2
% puis appliquer les differentes techniques pour resoudre le polynome
%


to_polynome([+,A,B],R) :- to_polynome(A,AR), to_polynome(B,BR), add_polynome(AR,BR,R), !.
to_polynome([-,A,B],R) :- to_polynome(A,AR), to_polynome(B,BR), sub_polynome(AR,BR,R), !.
to_polynome([*,A,B],R) :- to_polynome(A,AR), to_polynome(B,BR), mul_polynome(AR,BR,R), !.
to_polynome([**,A,B],R) :- to_polynome(A,AR), to_polynome(B,BR), pow_polynome(AR,BR,R), !.

to_polynome(x, [0,1]) :- !.
to_polynome(N, [N]).

add_polynome([],B,B) :- !.
add_polynome(A,[],A) :- !.
add_polynome([AH|AT],[BH|BT],[H|T]) :- H is AH + BH, add_polynome(AT,BT,T).

sub_polynome([],[BH|BT],[NBH|NBT]) :- NBH is 0 - BH, sub_polynome([],BT,NBT).
sub_polynome(A,[],A) :- !.
sub_polynome([AH|AT],[BH|BT],[H|T]) :- H is AH - BH, sub_polynome(AT,BT,T).

mul_polynome_aide(_,[],[]).
mul_polynome_aide(A,[BH|BT],[ABH|ABT]) :- ABH is A * BH, mul_polynome_aide(A,BT,ABT).

mul_polynome([],_,[]).
mul_polynome([AH|AT],B,R) :- mul_polynome_aide(AH,B,F),mul_polynome(AT,B,S),add_polynome(F,[0|S],R).

pow_polynome(_,[0],[1]) :- !.
pow_polynome(P,[N],R) :- Next is N - 1, pow_polynome(P,[Next],Q), mul_polynome(P,Q,R).


% Les equations sont a present representees sous la forme d'un polynome
% Il reste plus qu'a les resoudre en utilisant la formule simple pour ceux
% du premier degree et le delta pour ceux du second



delta([C,B,A],R):-R is B*B-4*A*C.

solve_polynome([A,B],R):- R is -A/B.
solve_polynome([C,B,A],R):- delta([C,B,A],D),
    ( D>0, R is (-B-sqrt(D))/(2*A);
      D>0,  R is (-B+sqrt(D))/(2*A);
   (D=0, R is (-B-sqrt(D))/(2*A));
   (D<0, R = "Pas de solution")).


solve(A,B,R) :- to_polynome([-,A,B],X),solve_polynome(X, R).



    
    
    
    
    

