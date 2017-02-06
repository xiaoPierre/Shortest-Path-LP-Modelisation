\Covering problem from A to J
Minimize

	obj: 3.0 X_AB + 5.0 X_AC + 4.0 X_AD + 2.0 X_CD + 7.0 X_CF + 3.0 X_CG + 3.0 X_BC + 8.0 X_BE + 5.0 X_EH + 2.0 X_EC + 4.0 X_DG + 3.0 X_GI + 2.0 X_FH + 9.0 X_FI + 5.0 X_IJ + 1.0 X_HJ

Subject To

_SommeT : T_A + T_C + T_B + T_E + T_D + T_G + T_F + T_I + T_H - sumT = 0
\\\\_Conservation of flow between the source and the destination
	_OutFlow_A  : X_AB + X_AC + X_AD - NB_FLOW = 0
	_InFlow_A  : X_IJ + X_HJ - NB_FLOW = 0
\\\\_Conservation of flow for every other vertex
	_Conserv_C	: X_CD + X_CF + X_CG - X_AC - X_BC - X_EC = 0
	_Conserv_B	: X_BC + X_BE - X_AB = 0
	_Conserv_E	: X_EH + X_EC - X_BE = 0
	_Conserv_D	: X_DG - X_AD - X_CD = 0
	_Conserv_G	: X_GI - X_CG - X_DG = 0
	_Conserv_F	: X_FH + X_FI - X_CF = 0
	_Conserv_I	: X_IJ - X_GI - X_FI = 0
	_Conserv_H	: X_HJ - X_EH - X_FH = 0
\\\\_Covering vertex
	_Covering_C	: X_AC + X_BC + X_EC >= 1
	_Covering_B	: X_AB >= 1
	_Covering_E	: X_BE >= 1
	_Covering_D	: X_AD + X_CD >= 1
	_Covering_G	: X_CG + X_DG >= 1
	_Covering_F	: X_CF >= 1
	_Covering_I	: X_GI + X_FI >= 1
	_Covering_H	: X_EH + X_FH >= 1
\\\\_Date of visit
	Visit_A : T_A = 0
	Visit_C_by_A : T_A - T_C + 1234 X_AC <= 1229.0
	Visit_C_by_B : T_B - T_C + 1234 X_BC <= 1231.0
	Visit_C_by_E : T_E - T_C + 1234 X_EC <= 1232.0
	Visit_B_by_A : T_A - T_B + 1234 X_AB <= 1231.0
	Visit_E_by_B : T_B - T_E + 1234 X_BE <= 1226.0
	Visit_D_by_A : T_A - T_D + 1234 X_AD <= 1230.0
	Visit_D_by_C : T_C - T_D + 1234 X_CD <= 1232.0
	Visit_G_by_C : T_C - T_G + 1234 X_CG <= 1231.0
	Visit_G_by_D : T_D - T_G + 1234 X_DG <= 1230.0
	Visit_F_by_C : T_C - T_F + 1234 X_CF <= 1227.0
	Visit_I_by_G : T_G - T_I + 1234 X_GI <= 1231.0
	Visit_I_by_F : T_F - T_I + 1234 X_FI <= 1225.0
	Visit_H_by_E : T_E - T_H + 1234 X_EH <= 1229.0
	Visit_H_by_F : T_F - T_H + 1234 X_FH <= 1232.0
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