\Shortest path problem from A to J
Minimize

	obj: 3.0 X_AB + 5.0 X_AC + 4.0 X_AD + 2.0 X_CD + 7.0 X_CF + 3.0 X_CG + 3.0 X_BC + 8.0 X_BE + 5.0 X_EH + 2.0 X_EC + 4.0 X_DG + 3.0 X_GI + 2.0 X_FH + 9.0 X_FI + 5.0 X_IJ + 1.0 X_HJ

Subject To

\\\\_Conservation of flow between the source and the destination
	_OutFlow_A  : X_AB + X_AC + X_AD = 1
	_InFlow_A  : X_IJ + X_HJ = 1
\\\\_Conservation of flow for every other vertex
	_Conserv_C	: X_CD + X_CF + X_CG - X_AC - X_BC - X_EC = 0
	_Conserv_B	: X_BC + X_BE - X_AB = 0
	_Conserv_E	: X_EH + X_EC - X_BE = 0
	_Conserv_D	: X_DG - X_AD - X_CD = 0
	_Conserv_G	: X_GI - X_CG - X_DG = 0
	_Conserv_F	: X_FH + X_FI - X_CF = 0
	_Conserv_I	: X_IJ - X_GI - X_FI = 0
	_Conserv_H	: X_HJ - X_EH - X_FH = 0
Bounds
	0 <= X_AB <= 1
	0 <= X_AC <= 1
	0 <= X_AD <= 1
	0 <= X_CD <= 1
	0 <= X_CF <= 1
	0 <= X_CG <= 1
	0 <= X_BC <= 1
	0 <= X_BE <= 1
	0 <= X_EH <= 1
	0 <= X_EC <= 1
	0 <= X_DG <= 1
	0 <= X_GI <= 1
	0 <= X_FH <= 1
	0 <= X_FI <= 1
	0 <= X_IJ <= 1
	0 <= X_HJ <= 1
Binaries
	X_AB X_AC X_AD X_CD X_CF X_CG X_BC X_BE X_EH X_EC X_DG X_GI X_FH X_FI X_IJ X_HJ 
End