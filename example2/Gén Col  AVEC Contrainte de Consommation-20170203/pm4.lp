\Graphe � 6 sommets : sommet s (source) ; sommet p (puits) ; sommets num�rot�s de 2 � 5 (sommets-t�ches) 
\Problele maitre
\Minimiser le co�t global
Minimize
	obj	: + 24 y_1 + 13 y_2 + 15 y_3 + 15 y_4
		
Subject To
				
\\\\Couverture : Recouvrement (>= 1) / Partitionnement (= 1)  de tous les sommets interne du graphe
	_Couv2	: 0 y_1	+ 1 y_2 + 1 y_3 + 1 y_4	>= 1
	_Couv3	: 1 y_1	+ 1 y_2 + 1 y_3 + 1 y_4 >= 1
	_Couv4	: 0 y_1	+ 1 y_2 + 0 y_3 + 0 y_4 >= 1
	_Couv5	: 1 y_1	+ 0 y_2 + 1 y_3 + 1 y_4 >= 1

Bounds
	0 <= y_1 <= 1
	0 <= y_2 <= 1
	0 <= y_3 <= 1
	0 <= y_4 <= 1
	
\Binaries
\	y_1 y_2 y_3 y_4
End

CPLEX> read AvecCtrConso/pm4.lp

CPLEX> opt
Dual simplex - Optimal:  Objective = 2.8000000000e+001

CPLEX> dis sol dual -
Constraint Name             Dual Price
_Couv4                       13.000000
_Couv5                       15.000000
