\Graphe à 6 sommets : sommet s (source) ; sommet p (puits) ; sommets numérotés de 2 à 5 (sommets-tâches) 
\Problele maitre
\Minimiser le coût global
Minimize
	obj	: + 24 y_1 + 3 y_2 
		
Subject To
				
\\\\Couverture : Recouvrement (>= 1) / Partitionnement (= 1)  de tous les sommets interne du graphe
	_Couv2	: 0 y_1	+ 1 y_2 >= 1
	_Couv3	: 1 y_1	+ 0 y_2 >= 1
	_Couv4	: 0 y_1	+ 1 y_2 >= 1
	_Couv5	: 1 y_1	+ 0 y_2 >= 1

Bounds
	0 <= y_1 <= 1
	0 <= y_2 <= 1
	
\Binaries
\	y_1 y_2
End

CPLEX> read pm2.lp
Problem 'pm2.lp' read.
Read time = 0.00 sec. (0.00 ticks)

CPLEX> opt
Tried aggregator 1 time.
LP Presolve eliminated 4 rows and 2 columns.
All rows and columns eliminated.
Presolve time = 0.00 sec. (0.00 ticks)
Dual simplex - Optimal:  Objective = 2.7000000000e+001
Solution time =    0.00 sec.  Iterations = 0 (0)
Deterministic time = 0.00 ticks  (2.18 ticks/sec)

CPLEX> dis sol dual -
Constraint Name             Dual Price
_Couv2                        3.000000
_Couv3                       24.000000
All other dual prices in the range 1-4 are 0.
