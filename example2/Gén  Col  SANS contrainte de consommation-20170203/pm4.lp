\Graphe à 6 sommets : sommet s (source) ; sommet p (puits) ; sommets numérotés de 2 à 5 (sommets-tâches) 
\Problele maitre
\Minimiser le coût global
Minimize
	obj	: + 24 y_1 + 3 y_2 + 13 y_3 + 14 y_4
		
Subject To
				
\\\\Couverture : Recouvrement (>= 1) / Partitionnement (= 1)  de tous les sommets interne du graphe
	_Couv2	: 0 y_1	+ 1 y_2 + 1 y_3 + 1 y_4	>= 1
	_Couv3	: 1 y_1	+ 0 y_2 + 1 y_3 + 0 y_4 >= 1
	_Couv4	: 0 y_1	+ 1 y_2 + 1 y_3 + 1 y_4 >= 1
	_Couv5	: 1 y_1	+ 0 y_2 + 0 y_3 + 1 y_4 >= 1

Bounds
	0 <= y_1 <= 1
	0 <= y_2 <= 1
	0 <= y_3 <= 1
	0 <= y_4 <= 1
	
\Binaries
\	y_1 y_2 y_3 y_4
End


CPLEX> read pm4.lp
Problem 'pm4.lp' read.
Read time = 0.00 sec. (0.00 ticks)
CPLEX> opt
Tried aggregator 1 time.
LP Presolve eliminated 1 rows and 0 columns.
Reduced LP has 3 rows, 4 columns, and 7 nonzeros.
Presolve time = 0.00 sec. (0.00 ticks)

Iteration log . . .
Iteration:     1   Dual objective     =            13.000000

Dual simplex - Optimal:  Objective = 2.5500000000e+001
Solution time =    0.00 sec.  Iterations = 3 (0)
Deterministic time = 0.01 ticks  (7.05 ticks/sec)

CPLEX> dis sol dual -
Constraint Name             Dual Price
_Couv3                       11.500000
_Couv4                        1.500000
_Couv5                       12.500000
All other dual prices in the range 1-4 are 0.
CPLEX>