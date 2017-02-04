\Graphe à 6 sommets : sommet s (source) ; sommet p (puits) ; sommets numérotés de 2 à 5 (sommets-tâches) 
\Problele maitre
\Minimiser le coût global
Minimize
	obj	: + 24 y_1 + 13 y_2 
		
Subject To
				
\\\\Couverture : Recouvrement (>= 1) / Partitionnement (= 1)  de tous les sommets interne du graphe
	_Couv2	: 0 y_1	+ 1 y_2 >= 1
	_Couv3	: 1 y_1	+ 1 y_2 >= 1
	_Couv4	: 0 y_1	+ 1 y_2 >= 1
	_Couv5	: 1 y_1	+ 0 y_2 >= 1

Bounds
	0 <= y_1 <= 1
	0 <= y_2 <= 1
	
\Binaries
\	y_1 y_2
End


CPLEX> read AvecCtrConso/pm2.lp

CPLEX> opt
Dual simplex - Optimal:  Objective = 3.7000000000e+001

CPLEX> dis sol dual -
Constraint Name             Dual Price
_Couv2                       13.000000
_Couv5                       24.000000
