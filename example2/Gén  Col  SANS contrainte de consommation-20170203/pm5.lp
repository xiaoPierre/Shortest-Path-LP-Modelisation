\Graphe à 6 sommets : sommet s (source) ; sommet p (puits) ; sommets numérotés de 2 à 5 (sommets-tâches) 
\Problele maitre
\Minimiser le coût global
Minimize
	obj	: + 24 y_1 + 3 y_2 + 13 y_3 + 14 y_4 + 15 y_5
		
Subject To
				
\\\\Couverture : Recouvrement (>= 1) / Partitionnement (= 1)  de tous les sommets interne du graphe
	_Couv2	: 0 y_1	+ 1 y_2 + 1 y_3 + 1 y_4	+ 1 y_5	>= 1
	_Couv3	: 1 y_1	+ 0 y_2 + 1 y_3 + 0 y_4 + 1 y_5	>= 1
	_Couv4	: 0 y_1	+ 1 y_2 + 1 y_3 + 1 y_4 + 0 y_5	>= 1
	_Couv5	: 1 y_1	+ 0 y_2 + 0 y_3 + 1 y_4 + 1 y_5	>= 1

Bounds
	0 <= y_1 <= 1
	0 <= y_2 <= 1
	0 <= y_3 <= 1
	0 <= y_4 <= 1
	0 <= y_5 <= 1
	
\Binaries
\	y_1 y_2 y_3 y_4 y_5
End


CPLEX> read pm5.lp
Problem 'pm5.lp' read.
Read time = 0.00 sec. (0.00 ticks)
CPLEX> opt
Tried aggregator 1 time.
No LP presolve or aggregator reductions.
Presolve time = 0.00 sec. (0.00 ticks)

Iteration log . . .
Iteration:     1   Dual objective     =             3.000000

Dual simplex - Optimal:  Objective = 1.8000000000e+001
Solution time =    0.00 sec.  Iterations = 4 (0)
Deterministic time = 0.01 ticks  (5.66 ticks/sec)

CPLEX> dis sol dual -
Constraint Name             Dual Price
_Couv3                       10.000000
_Couv4                        3.000000
_Couv5                        5.000000
All other dual prices in the range 1-4 are 0.
CPLEX>