(* Code automatically generated by 'PreSARAH' *) 
(* Expressions for amplitudes are obtained by FeynArts/FormCalc *) 
(* This file is supposed to be loaded and used by SARAH *) 
(* Created at 10:52 on 4.4.2014 *) 
 
 
Print["   ... ",H2l]; 
NamesParticles =  {ChargedLepton, bar[ChargedLepton], HiggsBoson}; 
 NamesOperators =  {OH2lSL, OH2lSR}; 
 NameProcess = H2l; 
 
Generate[H2l][file_]:=Block[{i,j,k}, 
 

 (* Creating all possible processes; extract information about involved masses/couplings *) 


(* ------------------------------- *)
(* {ChargedLepton, bar[ChargedLepton], HiggsBoson} *)
(* ------------------------------- *)
 
GetInformtion2Fermion1BosonProcess[ChargedLepton,bar[ChargedLepton],HiggsBoson,H2l,file]; 
NeededMassesAll=Intersection[NeededMasses];
NeededCouplingsAll=Intersection[NeededCouplings];
WriteCodeObservablePreSARAH[H2l][NeededMassesAll,NeededCouplingsAll,TreeContributions,WaveContributions,PenguinContributions,file]; 
NeededMassAllSaved[H2l] = masses 
]; 

WriteCodeObservablePreSARAH[H2l][masses_,couplings_,tree_,wave_,penguin_,file_] :=Block[{i,j,k,fermions,scalars}, 
 
NeededMassesAllSaved[H2l] = masses; 
NeededCouplingsAllSaved[H2l] = couplings; 
NeededCombinations[H2l] = {{1, 2, ALL}, {1, 3, ALL}, {2, 3, ALL}, {2, 1, ALL}, {3, 1, ALL}, {3, 2, ALL}}; 
Print["     writing SPheno code for ",H2l]; 
MakeSubroutineTitle["CalculateH2l",Flatten[{masses,couplings}],{"gt1","gt2","gt3","OnlySM"}, 
{"OH2lSL", "OH2lSR"},file]; 
WriteString[file,"! ---------------------------------------------------------------- \n"]; 
WriteString[file,"! Code based on automatically generated SARAH extensions by 'PreSARAH' \n"]; 
WriteString[file,"! Expressions for amplitudes are obtained by FeynArts/FormCalc \n"]; 
WriteString[file,"! Based on user input for process H2l \n"]; 
WriteString[file,"! 'PreSARAH' output has been generated  at 10:52 on 4.4.2014 \n"]; 
WriteString[file,"! ---------------------------------------------------------------- \n \n"]; 
 
 
WriteString[file,"Implicit None \n"]; 
MakeVariableList[Flatten[{couplings,masses}],",Intent(in)",file];
WriteString[file,"Integer,Intent(in) :: gt1, gt2,gt3 \n"];
WriteString[file,"Integer :: gt4 \n"];
WriteString[file,"Logical, Intent(in) :: OnlySM \n"];
WriteString[file,"Integer :: iprop, i1, i2, i3, i4 \n"];
WriteString[file,"Real(dp) :: MassEx1,MassEx2,MassEx3,MassEx12,MassEx22,MassEx32 \n"];
WriteString[file,"Complex(dp), Intent(out) :: OH2lSL \n"]; 
WriteString[file,"Complex(dp), Intent(out) :: OH2lSR \n"]; 
WriteString[file,"Real(dp) ::  MP, MP2, IMP2, IMP, MFin, MFin2, IMFin, IMFin2, Finite  \n"];
WriteString[file,"Real(dp) ::  MS1, MS12, MS2, MS22, MF1, MF12, MF2, MF22, MV1, MV12, MV2, MV22  \n"];
WriteString[file,"Complex(dp) ::  chargefactor  \n"];
WriteString[file,"Complex(dp) ::  coup1L, coup1R, coup2L, coup2R, coup3L, coup3R, coup3, coup4L, coup4R \n\n"];

WriteString[file,"Complex(dp) ::  int1,int2,int3,int4,int5,int6,int7,int8 \n\n"];

WriteString[file,"Iname=Iname+1 \n"];
WriteString[file,"NameOfUnit(Iname)='CalculateH2l' \n
"];
 
AddCalcSquaredMasses[masses,file]; 
(* Initaliziation *)
WriteString[file,"Finite=1._dp \n"];
WriteString[file,"MassEx1="<>SPhenoMass[ChargedLepton,gt1]<>"  \n"];
WriteString[file,"MassEx12="<>SPhenoMassSq[ChargedLepton,gt1]<>" \n"];
WriteString[file,"MassEx2="<>SPhenoMass[bar[ChargedLepton],gt2]<>"  \n"];
WriteString[file,"MassEx22="<>SPhenoMassSq[bar[ChargedLepton],gt2]<>" \n"];
WriteString[file,"MassEx3="<>SPhenoMass[HiggsBoson,gt3]<>"  \n"];
WriteString[file,"MassEx32="<>SPhenoMassSq[HiggsBoson,gt3]<>" \n"];
WriteString[file,"! ------------------------------ \n "];
WriteString[file,"! Amplitudes for external states \n "];
WriteString[file,"! {ChargedLepton, bar[ChargedLepton], HiggsBoson} \n "];
WriteString[file,"! ------------------------------ \n \n"];
WriteString[sphenoTeX,"\\section{External states: $"<>TeXOutput[{ChargedLepton[{gt1}], bar[ChargedLepton][{gt2}], HiggsBoson[{gt3}]}]<>"$} \n"];
WriteString[file,"OH2lSL=0._dp \n"]; 
WriteString[file,"OH2lSR=0._dp \n"]; 
WriteDiagramsObservable[H2l,tree, wave, penguin, file];
WriteString[file,"OH2lSL=oo16pi2*OH2lSL \n"]; 
WriteString[file,"OH2lSR=oo16pi2*OH2lSR \n"]; 
WriteString[file,"Iname=Iname-1\n\n"]; 
WriteString[file,"End Subroutine CalculateH2l \n\n"]; 
]; 
AddTreeResultPreSARAH[H2l][top_,type_,file_]:=Block[{}, 

 (* This routine returns the generic expression for the amplitude of a given triangle diagram *) 
 
 Switch[top,  (* Check topology *) 
  1, 
	 	 WriteStringFLB[file,"  OH2lSL=OH2lSL+ -1.*coup1L\n" ];
	 	 WriteString[sphenoTeX,"  OH2lSL= & "<> StringReplace["-coup1L",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  OH2lSR=OH2lSR+ -1.*coup1R\n" ];
	 	 WriteString[sphenoTeX,"  OH2lSR= & "<> StringReplace["-coup1R",SA`SPhenoTeXSub]<>" \\\\ \n" ];
]; 
]; 


AddPenguinResultPreSARAH[H2l][top_,type_,file_]:=Block[{}, 

 (* This routine returns the generic expression for the amplitude of a given triangle diagram *) 
 
 Switch[top,  (* Check topology *) 
  1, 
  Switch[type,  (* Check the generic type of the diagram *) 
	SFF, 
	 	 WriteString[file,"  int1=B0(MassEx32, mF12, mF22)\n" ];
	 	 WriteString[sphenoTeX,"I_1= & "<> StringReplace["B_0(MassEx32, mF12, mF22)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int2=C0(MassEx32, 0._dp, 0._dp, mF22, mF12, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_2= & "<> StringReplace["C_0(MassEx32, 0, 0, mF22, mF12, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteStringFLB[file,"  OH2lSL=OH2lSL+-1.*chargefactor*coup1L*coup2L*(coup3L*int2*mF1*mF2 + coup3R*(int1 + int2*mS12))\n" ];
	 	 WriteString[sphenoTeX,"  OH2lSL= & "<> StringReplace["-(chargefactor coup1L coup2L (coup3L I_2 mF1 mF2 + coup3R (I_1 + I_2 mS12)))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  OH2lSR=OH2lSR+-1.*chargefactor*coup1R*coup2R*(coup3R*int2*mF1*mF2 + coup3L*(int1 + int2*mS12))\n" ];
	 	 WriteString[sphenoTeX,"  OH2lSR= & "<> StringReplace["-(chargefactor coup1R coup2R (coup3R I_2 mF1 mF2 + coup3L (I_1 + I_2 mS12)))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
,
	FSS, 
	 	 WriteString[file,"  int1=C0(0._dp, MassEx32, 0._dp, mF12, mS22, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_1= & "<> StringReplace["C_0(0, MassEx32, 0, mF12, mS22, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteStringFLB[file,"  OH2lSL=OH2lSL+-1.*chargefactor*coup1L*coup2L*coup3*int1*mF1\n" ];
	 	 WriteString[sphenoTeX,"  OH2lSL= & "<> StringReplace["-(chargefactor coup1L coup2L coup3 I_1 mF1)",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  OH2lSR=OH2lSR+-1.*chargefactor*coup1R*coup2R*coup3*int1*mF1\n" ];
	 	 WriteString[sphenoTeX,"  OH2lSR= & "<> StringReplace["-(chargefactor coup1R coup2R coup3 I_1 mF1)",SA`SPhenoTeXSub]<>" \\\\ \n" ];
,
	VFF, 
	 	 WriteString[file,"  int1=B0(MassEx32, mF12, mF22)\n" ];
	 	 WriteString[sphenoTeX,"I_1= & "<> StringReplace["B_0(MassEx32, mF12, mF22)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int2=C0(MassEx32, 0._dp, 0._dp, mF22, mF12, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_2= & "<> StringReplace["C_0(MassEx32, 0, 0, mF22, mF12, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteStringFLB[file,"  OH2lSL=OH2lSL+2.*chargefactor*coup1L*coup2R*(2.*coup3R*int2*mF1*mF2 + coup3L*(-1.*Finite + 2.*(int1 + int2*mV12)))\n" ];
	 	 WriteString[sphenoTeX,"  OH2lSL= & "<> StringReplace["2 chargefactor coup1L coup2R (2 coup3R I_2 mF1 mF2 + coup3L (-1 + 2 (I_1 + I_2 mV12)))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  OH2lSR=OH2lSR+2.*chargefactor*coup1R*coup2L*(2.*coup3L*int2*mF1*mF2 + coup3R*(-1.*Finite + 2.*(int1 + int2*mV12)))\n" ];
	 	 WriteString[sphenoTeX,"  OH2lSR= & "<> StringReplace["2 chargefactor coup1R coup2L (2 coup3L I_2 mF1 mF2 + coup3R (-1 + 2 (I_1 + I_2 mV12)))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
,
	FSV, 
	 	 WriteString[file,"  int1=B0(MassEx32, mS12, mV22)\n" ];
	 	 WriteString[sphenoTeX,"I_1= & "<> StringReplace["B_0(MassEx32, mS12, mV22)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int2=C0(0._dp, MassEx32, 0._dp, mF12, mV22, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_2= & "<> StringReplace["C_0(0, MassEx32, 0, mF12, mV22, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteStringFLB[file,"  OH2lSL=OH2lSL+chargefactor*coup1L*coup2R*coup3*(int1 + int2*mF12)\n" ];
	 	 WriteString[sphenoTeX,"  OH2lSL= & "<> StringReplace["chargefactor coup1L coup2R coup3 (I_1 + I_2 mF12)",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  OH2lSR=OH2lSR+chargefactor*coup1R*coup2L*coup3*(int1 + int2*mF12)\n" ];
	 	 WriteString[sphenoTeX,"  OH2lSR= & "<> StringReplace["chargefactor coup1R coup2L coup3 (I_1 + I_2 mF12)",SA`SPhenoTeXSub]<>" \\\\ \n" ];
,
	FVS, 
	 	 WriteString[file,"  int1=B0(MassEx32, mS22, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_1= & "<> StringReplace["B_0(MassEx32, mS22, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int2=C0(0._dp, MassEx32, 0._dp, mF12, mS22, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_2= & "<> StringReplace["C_0(0, MassEx32, 0, mF12, mS22, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteStringFLB[file,"  OH2lSL=OH2lSL+-1.*chargefactor*coup1L*coup2L*coup3*(int1 + int2*mF12)\n" ];
	 	 WriteString[sphenoTeX,"  OH2lSL= & "<> StringReplace["-(chargefactor coup1L coup2L coup3 (I_1 + I_2 mF12))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  OH2lSR=OH2lSR+-1.*chargefactor*coup1R*coup2R*coup3*(int1 + int2*mF12)\n" ];
	 	 WriteString[sphenoTeX,"  OH2lSR= & "<> StringReplace["-(chargefactor coup1R coup2R coup3 (I_1 + I_2 mF12))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
,
	FVV, 
	 	 WriteString[file,"  int1=C0(0._dp, MassEx32, 0._dp, mF12, mV22, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_1= & "<> StringReplace["C_0(0, MassEx32, 0, mF12, mV22, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteStringFLB[file,"  OH2lSL=OH2lSL+-4.*chargefactor*coup1L*coup2R*coup3*int1*mF1\n" ];
	 	 WriteString[sphenoTeX,"  OH2lSL= & "<> StringReplace["-4 chargefactor coup1L coup2R coup3 I_1 mF1",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  OH2lSR=OH2lSR+-4.*chargefactor*coup1R*coup2L*coup3*int1*mF1\n" ];
	 	 WriteString[sphenoTeX,"  OH2lSR= & "<> StringReplace["-4 chargefactor coup1R coup2L coup3 I_1 mF1",SA`SPhenoTeXSub]<>" \\\\ \n" ];
]; 
];]; 


AddWaveResultPreSARAH[H2l][top_,type_,file_]:=Block[{}, 

 (* This routine returns the generic expression for the amplitude of a given triangle diagram *) 
 
 Switch[top,  (* Check topology *) 
  1, 
  Switch[type,  (* Check the generic type of the diagram *) 
	FS | SF , 
	 	 WriteString[file,"  int1=B0(MassEx12, mF12, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_1= & "<> StringReplace["B_0(MassEx12, mF12, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int2=B1(MassEx12, mF12, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_2= & "<> StringReplace["B_1(MassEx12, mF12, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteStringFLB[file,"  OH2lSL=OH2lSL+(chargefactor*coup3L*(coup1L*coup2R*int2*MassEx12 - 1.*coup1R*coup2R*int1*MassEx1*mF1 + coup1R*coup2L*int2*MassEx1*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))/(MassEx12 - 1.*MFin2)\n" ];
	 	 WriteString[sphenoTeX,"  OH2lSL= & "<> StringReplace["(chargefactor coup3L (coup1L coup2R I_2 MassEx12 - coup1R coup2R I_1 MassEx1 mF1 + coup1R coup2L I_2 MassEx1 MFin - coup1L coup2L I_1 mF1 MFin))/(MassEx12 - MFin2)",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  OH2lSR=OH2lSR+(chargefactor*coup3R*(coup1R*coup2L*int2*MassEx12 - 1.*coup1L*coup2L*int1*MassEx1*mF1 + coup1L*coup2R*int2*MassEx1*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))/(MassEx12 - 1.*MFin2)\n" ];
	 	 WriteString[sphenoTeX,"  OH2lSR= & "<> StringReplace["(chargefactor coup3R (coup1R coup2L I_2 MassEx12 - coup1L coup2L I_1 MassEx1 mF1 + coup1L coup2R I_2 MassEx1 MFin - coup1R coup2R I_1 mF1 MFin))/(MassEx12 - MFin2)",SA`SPhenoTeXSub]<>" \\\\ \n" ];
,
	FV | VF , 
	 	 WriteString[file,"  int1=B0(MassEx12, mF12, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_1= & "<> StringReplace["B_0(MassEx12, mF12, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int2=B1(MassEx12, mF12, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_2= & "<> StringReplace["B_1(MassEx12, mF12, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteStringFLB[file,"  OH2lSL=OH2lSL+(chargefactor*coup3L*(coup1R*MassEx1*(-2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)*MassEx12 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)\n" ];
	 	 WriteString[sphenoTeX,"  OH2lSL= & "<> StringReplace["(chargefactor coup3L (coup1R MassEx1 (-2 coup2L (1 - 2 I_1) mF1 + coup2R (1 + 2 I_2) MFin) + coup1L (coup2L (1 + 2 I_2) MassEx12 - 2 coup2R (1 - 2 I_1) mF1 MFin)))/(MassEx12 - MFin2)",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  OH2lSR=OH2lSR+(chargefactor*coup3R*(coup1L*MassEx1*(-2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)*MassEx12 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)\n" ];
	 	 WriteString[sphenoTeX,"  OH2lSR= & "<> StringReplace["(chargefactor coup3R (coup1L MassEx1 (-2 coup2R (1 - 2 I_1) mF1 + coup2L (1 + 2 I_2) MFin) + coup1R (coup2R (1 + 2 I_2) MassEx12 - 2 coup2L (1 - 2 I_1) mF1 MFin)))/(MassEx12 - MFin2)",SA`SPhenoTeXSub]<>" \\\\ \n" ];
]; 
,
  2, 
  Switch[type,  (* Check the generic type of the diagram *) 
	FS | SF , 
	 	 WriteString[file,"  int1=B0(MassEx22, mF12, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_1= & "<> StringReplace["B_0(MassEx22, mF12, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int2=B1(MassEx22, mF12, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_2= & "<> StringReplace["B_1(MassEx22, mF12, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteStringFLB[file,"  OH2lSL=OH2lSL+(chargefactor*coup3L*(coup1L*coup2R*int2*MassEx22 - 1.*coup1R*coup2R*int1*MassEx2*mF1 + coup1R*coup2L*int2*MassEx2*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))/(MassEx22 - 1.*MFin2)\n" ];
	 	 WriteString[sphenoTeX,"  OH2lSL= & "<> StringReplace["(chargefactor coup3L (coup1L coup2R I_2 MassEx22 - coup1R coup2R I_1 MassEx2 mF1 + coup1R coup2L I_2 MassEx2 MFin - coup1L coup2L I_1 mF1 MFin))/(MassEx22 - MFin2)",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  OH2lSR=OH2lSR+(chargefactor*coup3R*(coup1R*coup2L*int2*MassEx22 - 1.*coup1L*coup2L*int1*MassEx2*mF1 + coup1L*coup2R*int2*MassEx2*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))/(MassEx22 - 1.*MFin2)\n" ];
	 	 WriteString[sphenoTeX,"  OH2lSR= & "<> StringReplace["(chargefactor coup3R (coup1R coup2L I_2 MassEx22 - coup1L coup2L I_1 MassEx2 mF1 + coup1L coup2R I_2 MassEx2 MFin - coup1R coup2R I_1 mF1 MFin))/(MassEx22 - MFin2)",SA`SPhenoTeXSub]<>" \\\\ \n" ];
,
	FV | VF , 
	 	 WriteString[file,"  int1=B0(MassEx22, mF12, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_1= & "<> StringReplace["B_0(MassEx22, mF12, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int2=B1(MassEx22, mF12, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_2= & "<> StringReplace["B_1(MassEx22, mF12, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteStringFLB[file,"  OH2lSL=OH2lSL+(chargefactor*coup3L*(coup1L*MassEx2*(-2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)*MassEx22 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)\n" ];
	 	 WriteString[sphenoTeX,"  OH2lSL= & "<> StringReplace["(chargefactor coup3L (coup1L MassEx2 (-2 coup2R (1 - 2 I_1) mF1 + coup2L (1 + 2 I_2) MFin) + coup1R (coup2R (1 + 2 I_2) MassEx22 - 2 coup2L (1 - 2 I_1) mF1 MFin)))/(MassEx22 - MFin2)",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteStringFLB[file,"  OH2lSR=OH2lSR+(chargefactor*coup3R*(coup1R*MassEx2*(-2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)*MassEx22 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)\n" ];
	 	 WriteString[sphenoTeX,"  OH2lSR= & "<> StringReplace["(chargefactor coup3R (coup1R MassEx2 (-2 coup2L (1 - 2 I_1) mF1 + coup2R (1 + 2 I_2) MFin) + coup1L (coup2L (1 + 2 I_2) MassEx22 - 2 coup2R (1 - 2 I_1) mF1 MFin)))/(MassEx22 - MFin2)",SA`SPhenoTeXSub]<>" \\\\ \n" ];
]; 
];]; 


