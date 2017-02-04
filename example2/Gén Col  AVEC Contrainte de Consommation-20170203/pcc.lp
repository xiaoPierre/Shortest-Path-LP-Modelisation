\Graphe à 6 sommets : sommet s (source) ; sommet p (puits) ; sommets numérotés de 2 à 5 (sommets-tâches) 

\Minimiser le coût global
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

	
\\\\Une unité de flot sort du sommet source s
	_Flux	: flux = 1
	_FluxSortantSource : x_1_2 + x_1_3 - flux = 0
	
\\\\La quantité de flot qui arrive au puits est égale à la quantité de flot partie de la source
	_FlotEntrantPuits : x_4_6 + x_5_6 - flux = 0
		
\\\\Conservation de flux au niveau de chaque sommet interne du graphe
	_Conserv2	: x_1_2 + x_3_2 - x_2_4 - x_2_5 = 0
	_Conserv3	: x_1_3 - x_3_2 - x_3_4 - x_3_5 = 0
	_Conserv4	: x_2_4 + x_3_4 + x_5_4 - x_4_6 = 0
	_Conserv5	: x_2_5 + x_3_5 - x_5_4 - x_5_6 = 0
	
\\\\Consommation max d'un chemin est limitée à 14
	_ConsoCheminLimitee	: conso <= 14

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


[ PCC (cout | conso <= 14) ]
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
All other variables in the range 1-13 are 0.
CPLEX>


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
All other variables in the range 1-13 are 0.
CPLEX>

[ PCC (cout | cons <)= 14) ]
CPLEX> read pcc.lp

CPLEX> opt
MIP - Integer optimal solution:  Objective = 1.3000000000e+001

CPLEX> dis sol var -
Incumbent solution
Variable Name           Solution Value
cout                         13.000000
x_1_3                         1.000000
x_2_4                         1.000000
x_3_2                         1.000000
x_4_6                         1.000000
conso                        13.000000
flux                          1.000000
All other variables in the range 1-13 are 0.
CPLEX>


[ PCC (consommation) ]
Problem 'pcc.lp' read.
Read time = 0.00 sec. (0.00 ticks)
CPLEX> opt
Tried aggregator 4 times.
MIP Presolve eliminated 4 rows and 6 columns.
MIP Presolve added 1 rows and 1 columns.
Aggregator did 4 substitutions.
Reduced MIP has 2 rows, 4 columns, and 6 nonzeros.
Reduced MIP has 3 binaries, 1 generals, 0 SOSs, and 0 indicators.
Presolve time = 0.02 sec. (0.05 ticks)
Found incumbent of value 15.000000 after 0.02 sec. (0.05 ticks)
Probing time = 0.00 sec. (0.00 ticks)
Tried aggregator 1 time.
MIP Presolve eliminated 1 rows and 1 columns.
MIP Presolve added 1 rows and 1 columns.
Reduced MIP has 2 rows, 4 columns, and 6 nonzeros.
Reduced MIP has 3 binaries, 1 generals, 0 SOSs, and 0 indicators.
Presolve time = 0.00 sec. (0.00 ticks)
Probing time = 0.00 sec. (0.00 ticks)
Clique table members: 1.
MIP emphasis: balance optimality and feasibility.
MIP search method: dynamic search.
Parallel mode: deterministic, using up to 4 threads.

Root node processing (before b&c):
  Real time             =    0.02 sec. (0.07 ticks)
Parallel b&c, 4 threads:
  Real time             =    0.00 sec. (0.00 ticks)
  Sync time (average)   =    0.00 sec.
  Wait time (average)   =    0.00 sec.
                          ------------
Total (root+branch&cut) =    0.02 sec. (0.07 ticks)

Solution pool: 1 solution saved.

MIP - Integer optimal solution:  Objective = 8.0000000000e+000
Solution time =    0.02 sec.  Iterations = 0  Nodes = 0
Deterministic time = 0.07 ticks  (4.48 ticks/sec)

CPLEX> dis sol var -
Incumbent solution
Variable Name           Solution Value
conso                         8.000000
cout                         24.000000
x_1_3                         1.000000
x_3_5                         1.000000
x_5_6                         1.000000
flux                          1.000000
All other variables in the range 1-13 are 0.
CPLEX>