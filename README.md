# EquationSolver
Equations written with infix notation solver


Notre idée était de représenté les équations en des polynômes = 0,


Un polynôme va être représenté en une liste de puissance croissante,


ex: [1 0 3] signifie 1 + 3x^2=0


Les x prennent soit le valeur 1 (si le coef est non nul) ou 0 ( si le coef est nul) pour ne nous
laisser que les coef dans une liste.


Exemple pour mieux comprendre le fonctionnement :


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
