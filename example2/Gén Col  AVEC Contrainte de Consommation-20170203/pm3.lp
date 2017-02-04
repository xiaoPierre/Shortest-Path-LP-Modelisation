\Graphe à 6 sommets : sommet s (source) ; sommet p (puits) ; sommets numérotés de 2 à 5 (sommets-tâches) 
\Problele maitre
\Minimiser le coût global
Minimize
	obj	: + 24 y_1 + 13 y_2 + 15 y_3
		
Subject To
				
\\\\Couverture : Recouvrement (>= 1) / Partitionnement (= 1)  de tous les sommets interne du graphe
	_Couv2	: 0 y_1	+ 1 y_2 + 1 y_3 >= 1
	_Couv3	: 1 y_1	+ 1 y_2 + 1 y_3 >= 1
	_Couv4	: 0 y_1	+ 1 y_2 + 0 y_3 >= 1
	_Couv5	: 1 y_1	+ 0 y_2 + 1 y_3 >= 1

Bounds
	0 <= y_1 <= 1
	0 <= y_2 <= 1
	0 <= y_3 <= 1
	
\Binaries
\	y_1 y_2 y_3
End

CPLEX> read AvecCtrConso/pm3.lp
Problem 'AvecCtrConso/pm3.lp' read.

CPLEX> opt
Dual simplex - Optimal:  Objective = 2.8000000000e+001
Solution time =    0.00 sec.  Iterations = 0 (0)
Deterministic time = 0.00 ticks  (2.69 ticks/sec)

CPLEX> dis sol dual -
Constraint Name             Dual Price
_Couv4                       13.000000
_Couv5                       24.000000
All other dual prices in the range 1-4 are 0.
