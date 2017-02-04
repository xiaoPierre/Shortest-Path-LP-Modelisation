\Problème de Plus court chemin A -> J 
Minimize
	obj: 3 X_AB + 5 X_AC + 4 X_AD + 8 X_BE + 3 X_BC + 2 X_CD + 7 X_CF + 3 X_CG + 4 X_DG + 2 X_EC + 5 X_EH + 2 X_FH + 9 X_FI + 3 X_GI + 1 X_HJ + 5 X_IJ

Subject To

\\\\_Conservation de flux entre l'origine et la destination
	_FluxSortant_A	: X_AB + X_AC + X_AD = 1
	_FluxEntrant_J	: X_HJ + X_IJ = 1

\\\\_Conservation du flux	
	_Conserv_B	: X_AB - X_BC - X_BE = 0
	_Conserv_C	: X_AC + X_BC + X_EC - X_CD - X_CF - X_CG = 0
	_Conserv_D	: X_AD + X_CD - X_DG = 0
	_Conserv_E	: X_BE - X_EC - X_EH = 0
	_Conserv_F	: X_CF - X_FH - X_FI = 0
	_Conserv_G	: X_CG + X_DG - X_GI = 0
	_Conserv_H	: X_EH + X_FH - X_HJ = 0
	_Conserv_I	: X_FI + X_GI - X_IJ = 0
	
Bounds
	0 <= X_AB <= 1
	0 <= X_AC <= 1
	0 <= X_AD <= 1
	0 <= X_BE <= 1
	0 <= X_BC <= 1
	0 <= X_CD <= 1
	0 <= X_CF <= 1
	0 <= X_CG <= 1
	0 <= X_DG <= 1
	0 <= X_EC <= 1
	0 <= X_EH <= 1
	0 <= X_FH <= 1
	0 <= X_FI <= 1
	0 <= X_GI <= 1
	0 <= X_HJ <= 1
	0 <= X_IJ <= 1

Binaries
	X_AB X_AC X_AD X_BE X_BC X_CD X_CF X_CG X_DG X_EC X_EH X_FH X_FI X_GI X_HJ X_IJ
	
End
