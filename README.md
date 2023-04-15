# EquationSolver
Equations written with infix notation solver
Notre idée était de représenté les équations en des polynômes = 0,
Un polynôme va être représenté en une liste de puissance croissante,
ex: [1 0 3] signifie 1 + 3x^2=0
Les x prennent soit le valeur 1 (si le coef est non nul) ou 0 ( si le coef est nul) pour ne nous
laisser que les coef dans une liste.
Des exemples pour mieux comprendre le fonctionnement :
1/ x-4=2
Format simple :
x-4=2
x=6
Format prolog :
[-,x,4],2
On appelle to_polynome sur [ -,[-,x,4],2] (x-4-2)
On obtient la liste [-6 , 1] (ie. -6+x=0)
Solve_polynome est donc appeler avec[-[-6 , 1],0]en paramètre et donc utilise la formule
classique pour résoudre le polynôme (- -6/1=6)
solve([-,x,4],2,R).
R = 6
2/x+6=5x-6
Format simple :
x+6=5x-6
x-5x+6+6=0
-4x+12=0
x=3
Format prolog :
[[+,x,6],[-,[*,5,x],6]
On appelle to_polynome sur [-,[+,x,6],[-,[*,5,x],6]]
On obtient la liste [12 , -4] (ie. -4x+12=0)
Solve_polynome est donc appeler avec [12 , -4] en paramètre et donc utilise la formule
classique pour résoudre le polynôme (- 12/-4=3)
solve[[+,x,6],[-,[*,5,x],6,R).
R = 3
3/x^2-9=0
Format simple :
x^2-9=0
Δ=0^2-4*1*-9
x1=-3 / x2=3
Format prolog :
[-,[**,x,2],9],0
On appelle to_polynome sur [-,[-,[**,x,2],9],0]
On obtient la liste [-9,0,1] (ie. x^2-9=0)
Solve_polynome est donc appeler avec [-9,0,1] en paramètre et donc utilise le delta pour
résoudre le polynôme (
0^2-4*1*-9>0
x1=-3 , x2=3)
solve([-,[**,x,2],9],0,R).
R=-3
R=3
4/ (x-1)(x+3)-(x-1)(2x-12)=0
Format simple :
(x-1)(x+3)-(x-1)(2x-12)=0
-x^2+16x-15=0
Δ=16^2-4*-2*-15
x1=1 / x2=15
Format prolog :
[[-,[*,[-,x,1],[+,x,3]],[*,[-,x,1],[-,[*,2,x],12]]],0
On appelle to_polynome sur [ -,[-,[*,[-,x,1],[+,x,3]],[*,[-,x,1],[-,[*,2,x],12]]],0]
On obtient la liste [-15,16,-1] (ie. -x^2+16x-15=0)
Solve_polynome est donc appeler avec [-15,16,-1] en paramètre et donc utilise le delta pour
résoudre le polynôme (
Δ=16^2-4*-2*-15>0
x1=1 , x2=15 )
solve([-,[*,[-,x,1],[+,x,3]],[*,[-,x,1],[-,[*,2,x],12]]],0,R).
R=1
R=15
5/ 3x^2+5x+7=0
Format simple :
3x^2+5x+7=0
Δ=5^2-4*3*7
Pas de solution
Format prolog :
[+,[+,[*,3,[**,x,2]],[*,5,x]],7],0
On appelle to_polynome sur [ -,[+,[+,[*,3,[**,x,2]],[*,5,x]],7],0]
On obtient la liste [7,5,3] (ie. 3x^2+5x+7=0)
Solve_polynome est donc appeler avec [7,5,3] en paramètre et donc utilise le delta pour
résoudre le polynôme (
Δ=5^2-4*3*7<0
Pas de solution)
solve([+,[+,[*,3,[**,x,2]],[*,5,x]],7],0,R).
R=”pas de solution”
