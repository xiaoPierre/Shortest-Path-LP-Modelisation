\Graphe � 6 sommets : sommet s (source) ; sommet p (puits) ; sommets num�rot�s de 2 � 5 (sommets-t�ches) 

\Minimiser le co�t global
Minimize
	obj	: cout
		
Subject To
\\\\Consommation globale du chemin (valeur du chemin)
	_Cout	:	- cout 
				+  1 x_1_2 + 10 x_1_3
				+  1 x_2_4 +  2 x_2_5
				+  1 x_3_2 +  5 x_3_4 + 12 x_3_5
				+  1 x_4_6 
				+ 10 x_5_4 +  2 x_5_6
				= 0

	_Conso	:	- conso
				+ 10 x_1_2 + 3 x_1_3
				+  1 x_2_4 + 3 x_2_5
				+  2 x_3_2 + 7 x_3_4 + 3 x_3_5
				+  7 x_4_6 
				+  1 x_5_4 +  2 x_5_6
				= 0

	
\\\\Une unit� de flot sort du sommet source s
	_Flux	: flux = 1
	_FluxSortantSource : x_1_2 + x_1_3 - flux = 0
	
\\\\La quantit� de flot qui arrive au puits est �gale � la quantit� de flot partie de la source
	_FlotEntrantPuits : x_4_6 + x_5_6 - flux = 0
		
\\\\Conservation de flux au niveau de chaque sommet interne du graphe
	_Conserv2	: x_1_2 + x_3_2 - x_2_4 - x_2_5 = 0
	_Conserv3	: x_1_3 - x_3_2 - x_3_4 - x_3_5 = 0
	_Conserv4	: x_2_4 + x_3_4 + x_5_4 - x_4_6 = 0
	_Conserv5	: x_2_5 + x_3_5 - x_5_4 - x_5_6 = 0
	
\\\\Consommation max d'un chemin est limit�e � 14
\	_ConsoCheminLimitee	: conso <= 14

Bounds
	0 <= x_1_2 <= 1
	0 <= x_1_3 <= 1
	0 <= x_2_4 <= 1
	0 <= x_2_5 <= 1
	0 <= x_3_2 <= 1
	0 <= x_3_4 <= 1
	0 <= x_3_5 <= 1
	0 <= x_4_6 <= 1
	0 <= x_5_4 <= 1
	0 <= x_5_6 <= 1
	0 <= cout
	0 <= conso
	0 <= flux
	
Binaries
	x_1_2 x_1_3 x_2_4 x_2_5 x_3_2 x_3_4 x_3_5 x_4_6 x_5_4 x_5_6 
	
End

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
[ PCC (cout) ]
CPLEX> read pcc.lp

CPLEX> opt
MIP - Integer optimal solution:  Objective = 3.0000000000e+000

CPLEX> dis sol var -
Incumbent solution
Variable Name           Solution Value
cout                          3.000000
x_1_2                         1.000000
x_2_4                         1.000000
x_4_6                         1.000000
conso                        18.000000
flux                          1.000000


\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
[ PCC (cout | cons <)= 14) ]
CPLEX> read pcc.lp
Problem 'pcc.lp' read.

CPLEX> opt
MIP - Integer optimal solution:  Objective = 1.3000000000e+001

Variable Name           Solution Value
cout                         13.000000
x_1_3                         1.000000
x_2_4                         1.000000
x_3_2                         1.000000
x_4_6                         1.000000
conso                        13.000000
flux                          1.000000


\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
[ PCC (consommation) ]
Problem 'pcc.lp' read.

MIP - Integer optimal solution:  Objective = 8.0000000000e+000

CPLEX> dis sol var -
Incumbent solution
Variable Name           Solution Value
conso                         8.000000
cout                         24.000000
x_1_3                         1.000000
x_3_5                         1.000000
x_5_6                         1.000000
