\Graphe � 6 sommets : sommet 1 (source) ; sommet 6 (puits) ; sommets num�rot�s de 2 � 5 (sommets-t�ches) 
\CRij = Cij - Ui [Cout R�duit (i,j) = Cout (i,j) - Variable Duale (i)
\Minimiser le co�t reduit du chemin
Minimize
	obj	: 
			+  1 x_1_2 + 10 x_1_3
			-  2 x_2_4 -  1 x_2_5
			- 23 x_3_2 - 19 x_3_4 - 12 x_3_5
			+  1 x_4_6 
			+ 10 x_5_4 +  2 x_5_6
		
Subject To
\\\\Consommation globale du chemin (valeur du chemin)
	_Cout	:	- coutO
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
	0 <= coutO
	0 <= conso
	0 <= flux
	
Binaries
	x_1_2 x_1_3 x_2_4 x_2_5 x_3_2 x_3_4 x_3_5 x_4_6 x_5_4 x_5_6 
	
End



CPLEX> read SansCtrConso/pa3.lp

CPLEX> opt
MIP - Integer optimal solution:  Objective = -1.4000000000e+001

CPLEX> dis sol var -
Incumbent solution
Variable Name           Solution Value
x_1_3                         1.000000
x_2_4                         1.000000
x_3_2                         1.000000
x_4_6                         1.000000
coutO                        13.000000
conso                        13.000000
flux                          1.000000
