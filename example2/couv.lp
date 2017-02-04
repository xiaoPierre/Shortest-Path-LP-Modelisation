\Graphe à 6 sommets : sommet s (source) ; sommet p (puits) ; sommets numérotés de 2 à 5 (sommets-tâches) 

\Minimiser le coût global
Minimize
	obj	: cout
		
Subject To
\\\\Consommation globale du chemin (valeur du chemin)
	_Cout	:  	   1 x_1_2 + 10 x_1_3
				+  1 x_2_4 +  2 x_2_5
				+  1 x_3_2 +  5 x_3_4 + 12 x_3_5
				+  1 x_4_6 
				+ 10 x_5_4 +  2 x_5_6
				- cout = 0

	_Conso	:     10 x_1_2 + 3 x_1_3
				+  1 x_2_4 + 3 x_2_5
				+  2 x_3_2 + 7 x_3_4 + 3 x_3_5
				+  7 x_4_6 
				+  1 x_5_4 +  2 x_5_6
				- conso = 0

\	_Flux	: flux = 1
	
\\\\Une unité de flot sort du sommet source s
	_FluxSortantSource : x_1_2 + x_1_3 - flux = 0
	
\\\\La quantité de flot qui arrive au puits est égale à la quantité de flot partie de la source
	_FlotEntrantPuits : x_4_6 + x_5_6 - flux = 0
		
\\\\Conservation de flux au niveau de chaque sommet interne du graphe
	_Conserv2	: x_1_2 + x_3_2 - x_2_4 - x_2_5 = 0
	_Conserv3	: x_1_3 - x_3_2 - x_3_4 - x_3_5 = 0
	_Conserv4	: x_2_4 + x_3_4 + x_5_4 - x_4_6 = 0
	_Conserv5	: x_2_5 + x_3_5 - x_5_4 - x_5_6 = 0
	
\\\\Couverture (Recouvrement / Partitionnement) de tous les sommets interne du graphe
	_Couv2	: x_1_2 + x_3_2 >= 1
	_Couv3	: x_1_3 >= 1
	_Couv4	: x_2_4 + x_3_4 + x_5_4 >= 1
	_Couv5	: x_2_5 + x_3_5 >= 1

\\\\Consommation max d'un chemin est limitée à 14
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