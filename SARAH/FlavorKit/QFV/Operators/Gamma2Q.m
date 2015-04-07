(* Code automatically generated by 'PreSARAH' *) 
(* Expressions for amplitudes are obtained by FeynArts/FormCalc *) 
(* This file is supposed to be loaded and used by SARAH *) 
(* Created at 14:19 on 14.3.2014 *) 
 
 
Print["   ... ",Gamma2Q]; 
NamesParticles =  {bar[BottomQuark], BottomQuark, Photon}; 
 NamesOperators =  {OA2qSL, OA2qSR, OA2qVL, OA2qVR}; 
 NameProcess = Gamma2Q; 
 
Generate[Gamma2Q][file_]:=Block[{i,j,k}, 
 

 (* Creating all possible processes; extract information about involved masses/couplings *) 


(* ------------------------------- *)
(* {bar[BottomQuark], BottomQuark, Photon} *)
(* ------------------------------- *)
 
GetInformtion2Fermion1BosonProcess[bar[BottomQuark],BottomQuark,Photon,Gamma2Q,file]; 
NeededMassesAll=Intersection[NeededMasses];
NeededCouplingsAll=Intersection[NeededCouplings];
WriteCodeObservablePreSARAH[Gamma2Q][NeededMassesAll,NeededCouplingsAll,TreeContributions,WaveContributions,PenguinContributions]; 
NeededMassAllSaved[Gamma2Q] = masses 
]; 

WriteCodeObservablePreSARAH[Gamma2Q][masses_,couplings_,tree_,wave_,penguin_] :=Block[{i,j,k,fermions,scalars}, 
 
NeededMassesAllSaved[Gamma2Q] = masses; 
NeededCouplingsAllSaved[Gamma2Q] = couplings; 
NeededCombinations[Gamma2Q] = {{3, 2}}; 
Print["     writing SPheno code for ",Gamma2Q]; 
MakeSubroutineTitle["CalculateGamma2Q",Flatten[{masses,couplings}],{"gt1","gt2","gt3","OnlySM"}, 
{"OA2qSL", "OA2qSR", "OA2qVL", "OA2qVR"},sphenoLow]; 
WriteString[sphenoLow,"! ---------------------------------------------------------------- \n"]; 
WriteString[sphenoLow,"! Code based on automatically generated SARAH extensions by 'PreSARAH' \n"]; 
WriteString[sphenoLow,"! Expressions for amplitudes are obtained by FeynArts/FormCalc \n"]; 
WriteString[sphenoLow,"! Based on user input for process Gamma2Q \n"]; 
WriteString[sphenoLow,"! 'PreSARAH' output has been generated  at 14:19 on 14.3.2014 \n"]; 
WriteString[sphenoLow,"! ---------------------------------------------------------------- \n \n"]; 
 
 
WriteString[sphenoLow,"Implicit None \n"]; 
MakeVariableList[Flatten[{couplings,masses}],",Intent(in)",sphenoLow];
WriteString[sphenoLow,"Integer,Intent(in) :: gt1, gt2,gt3 \n"];
WriteString[sphenoLow,"Integer :: gt4 \n"];
WriteString[sphenoLow,"Logical, Intent(in) :: OnlySM \n"];
WriteString[sphenoLow,"Integer :: iprop, i1, i2, i3, i4 \n"];
WriteString[sphenoLow,"Real(dp) :: MassEx1,MassEx2,MassEx3,MassEx12,MassEx22,MassEx32 \n"];
WriteString[sphenoLow,"Complex(dp), Intent(out) :: OA2qSL \n"]; 
WriteString[sphenoLow,"Complex(dp), Intent(out) :: OA2qSR \n"]; 
WriteString[sphenoLow,"Complex(dp), Intent(out) :: OA2qVL \n"]; 
WriteString[sphenoLow,"Complex(dp), Intent(out) :: OA2qVR \n"]; 
WriteString[sphenoLow,"Real(dp) ::  MP, MP2, IMP2, IMP, MFin, MFin2, IMFin, IMFin2, Finite  \n"];
WriteString[sphenoLow,"Real(dp) ::  MS1, MS12, MS2, MS22, MF1, MF12, MF2, MF22, MV1, MV12, MV2, MV22  \n"];
WriteString[sphenoLow,"Complex(dp) ::  chargefactor  \n"];
WriteString[sphenoLow,"Complex(dp) ::  coup1L, coup1R, coup2L, coup2R, coup3L, coup3R, coup3, coup4L, coup4R \n\n"];

WriteString[sphenoLow,"Complex(dp) ::  int1,int2,int3,int4,int5,int6,int7,int8 \n\n"];

WriteString[sphenoLow,"Iname=Iname+1 \n"];
WriteString[sphenoLow,"NameOfUnit(Iname)='CalculateGamma2Q' \n
"];
 
AddCalcSquaredMasses[masses,sphenoLow]; 
(* Initaliziation *)
WriteString[sphenoLow,"Finite=1._dp \n"];
WriteString[sphenoLow,"MassEx1="<>SPhenoMass[bar[BottomQuark],gt1]<>"  \n"];
WriteString[sphenoLow,"MassEx12="<>SPhenoMassSq[bar[BottomQuark],gt1]<>" \n"];
WriteString[sphenoLow,"MassEx2="<>SPhenoMass[BottomQuark,gt2]<>"  \n"];
WriteString[sphenoLow,"MassEx22="<>SPhenoMassSq[BottomQuark,gt2]<>" \n"];
WriteString[sphenoLow,"MassEx3="<>SPhenoMass[Photon,gt3]<>"  \n"];
WriteString[sphenoLow,"MassEx32="<>SPhenoMassSq[Photon,gt3]<>" \n"];
WriteString[sphenoLow,"! ------------------------------ \n "];
WriteString[sphenoLow,"! Amplitudes for external states \n "];
WriteString[sphenoLow,"! {bar[BottomQuark], BottomQuark, Photon} \n "];
WriteString[sphenoLow,"! ------------------------------ \n \n"];
WriteString[sphenoTeX,"\\section{External states: $"<>TeXOutput[{bar[BottomQuark][{gt1}], BottomQuark[{gt2}], Photon[{gt3}]}]<>"$} \n"];
WriteString[sphenoLow,"OA2qSL=0._dp \n"]; 
WriteString[sphenoLow,"OA2qSR=0._dp \n"]; 
WriteString[sphenoLow,"OA2qVL=0._dp \n"]; 
WriteString[sphenoLow,"OA2qVR=0._dp \n"]; 
WriteDiagramsObservable[Gamma2Q,tree, wave, penguin, sphenoLow];
WriteString[sphenoLow,"OA2qSL=oo16pi2*OA2qSL \n"]; 
WriteString[sphenoLow,"OA2qSR=oo16pi2*OA2qSR \n"]; 
WriteString[sphenoLow,"OA2qVL=oo16pi2*OA2qVL \n"]; 
WriteString[sphenoLow,"OA2qVR=oo16pi2*OA2qVR \n"]; 
WriteString[sphenoLow,"Iname=Iname-1\n\n"]; 
WriteString[sphenoLow,"End Subroutine CalculateGamma2Q \n\n"]; 
]; 
AddTreeResultPreSARAH[Gamma2Q][top_,type_,file_]:=Block[{}, 

 (* This routine returns the generic expression for the amplitude of a given triangle diagram *) 
 
 Switch[top,  (* Check topology *) 
  1, 
	 	 WriteString[file,"  OA2qSL=OA2qSL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  OA2qSL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qSR=OA2qSR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  OA2qSR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qVL=OA2qVL+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  OA2qVL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qVR=OA2qVR+ 0.\n" ];
	 	 WriteString[sphenoTeX,"  OA2qVR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
]; 
]; 


AddPenguinResultPreSARAH[Gamma2Q][top_,type_,file_]:=Block[{}, 

 (* This routine returns the generic expression for the amplitude of a given triangle diagram *) 
 
 Switch[top,  (* Check topology *) 
  1, 
  Switch[type,  (* Check the generic type of the diagram *) 
	SFF, 
	 	 WriteString[file,"  int1=B0(0._dp, mF12, mF22)\n" ];
	 	 WriteString[sphenoTeX,"I_1= & "<> StringReplace["B_0(0, mF12, mF22)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int2=C00m(mF22, mF12, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_2= & "<> StringReplace["C00m(mF22, mF12, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int3=C0m(mF22, mF12, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_3= & "<> StringReplace["C0m(mF22, mF12, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int4=C12m(mF22, mF12, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_4= & "<> StringReplace["C12m(mF22, mF12, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int5=C1m(mF22, mF12, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_5= & "<> StringReplace["C1m(mF22, mF12, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int6=C22m(mF22, mF12, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_6= & "<> StringReplace["C22m(mF22, mF12, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int7=C2m(mF22, mF12, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_7= & "<> StringReplace["C2m(mF22, mF12, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  OA2qSL=OA2qSL+2.*chargefactor*(coup1R*coup2L*coup3L*int4*MassEx1 - 1.*coup1L*(coup2R*coup3R*(int4 + int6 + int7)*MassEx2 + coup2L*(coup3L*int5*mF1 - 1.*coup3R*(int3 + int5 + int7)*mF2)))\n" ];
	 	 WriteString[sphenoTeX,"  OA2qSL= & "<> StringReplace["2 chargefactor (coup1R coup2L coup3L I_4 MassEx1 - coup1L (coup2R coup3R (I_4 + I_6 + I_7) MassEx2 + coup2L (coup3L I_5 mF1 - coup3R (I_3 + I_5 + I_7) mF2)))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qSR=OA2qSR+2.*chargefactor*(coup1L*coup2R*coup3R*int4*MassEx1 - 1.*coup1R*(coup2L*coup3L*(int4 + int6 + int7)*MassEx2 + coup2R*(coup3R*int5*mF1 - 1.*coup3L*(int3 + int5 + int7)*mF2)))\n" ];
	 	 WriteString[sphenoTeX,"  OA2qSR= & "<> StringReplace["2 chargefactor (coup1L coup2R coup3R I_4 MassEx1 - coup1R (coup2L coup3L (I_4 + I_6 + I_7) MassEx2 + coup2R (coup3R I_5 mF1 - coup3L (I_3 + I_5 + I_7) mF2)))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qVL=OA2qVL+chargefactor*(coup1R*MassEx1*(-1.*coup2L*coup3L*int7*MassEx2 + coup2R*(-1.*coup3R*int5*mF1 + coup3L*(int3 + int5)*mF2)) + coup1L*(coup2L*MassEx2*(-1.*coup3L*(int5 + int7)*mF1 + coup3R*(int3 + int5 + int7)*mF2) + coup2R*(coup3L*int3*mF1*mF2 + coup3R*(-1.*int1 + 2.*int2 - 1.*int5*MassEx12 + int3*MassEx22 + int5*MassEx22 + int7*MassEx22 - 1.*int3*mS12))))\n" ];
	 	 WriteString[sphenoTeX,"  OA2qVL= & "<> StringReplace["chargefactor (coup1R MassEx1 (-(coup2L coup3L I_7 MassEx2) + coup2R (-(coup3R I_5 mF1) + coup3L (I_3 + I_5) mF2)) + coup1L (coup2L MassEx2 (-(coup3L (I_5 + I_7) mF1) + coup3R (I_3 + I_5 + I_7) mF2) + coup2R (coup3L I_3 mF1 mF2 + coup3R (-I_1 + 2 I_2 - I_5 MassEx12 + I_3 MassEx22 + I_5 MassEx22 + I_7 MassEx22 - I_3 mS12))))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qVR=OA2qVR+chargefactor*(coup1L*MassEx1*(-1.*coup2R*coup3R*int7*MassEx2 + coup2L*(-1.*coup3L*int5*mF1 + coup3R*(int3 + int5)*mF2)) + coup1R*(coup2R*MassEx2*(-1.*coup3R*(int5 + int7)*mF1 + coup3L*(int3 + int5 + int7)*mF2) + coup2L*(coup3R*int3*mF1*mF2 + coup3L*(-1.*int1 + 2.*int2 - 1.*int5*MassEx12 + int3*MassEx22 + int5*MassEx22 + int7*MassEx22 - 1.*int3*mS12))))\n" ];
	 	 WriteString[sphenoTeX,"  OA2qVR= & "<> StringReplace["chargefactor (coup1L MassEx1 (-(coup2R coup3R I_7 MassEx2) + coup2L (-(coup3L I_5 mF1) + coup3R (I_3 + I_5) mF2)) + coup1R (coup2R MassEx2 (-(coup3R (I_5 + I_7) mF1) + coup3L (I_3 + I_5 + I_7) mF2) + coup2L (coup3R I_3 mF1 mF2 + coup3L (-I_1 + 2 I_2 - I_5 MassEx12 + I_3 MassEx22 + I_5 MassEx22 + I_7 MassEx22 - I_3 mS12))))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
,
	FSS, 
	 	 WriteString[file,"  int1=C00m(mF12, mS22, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_1= & "<> StringReplace["C00m(mF12, mS22, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int2=C0m(mF12, mS22, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_2= & "<> StringReplace["C0m(mF12, mS22, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int3=C11m(mF12, mS22, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_3= & "<> StringReplace["C11m(mF12, mS22, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int4=C12m(mF12, mS22, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_4= & "<> StringReplace["C12m(mF12, mS22, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int5=C1m(mF12, mS22, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_5= & "<> StringReplace["C1m(mF12, mS22, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int6=C22m(mF12, mS22, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_6= & "<> StringReplace["C22m(mF12, mS22, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int7=C2m(mF12, mS22, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_7= & "<> StringReplace["C2m(mF12, mS22, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  OA2qSL=OA2qSL+2.*chargefactor*coup3*(coup1R*coup2L*(int4 + int6 + int7)*MassEx1 + coup1L*(coup2R*(int3 + int4 + int5)*MassEx2 - 1.*coup2L*(int2 + int5 + int7)*mF1))\n" ];
	 	 WriteString[sphenoTeX,"  OA2qSL= & "<> StringReplace["2 chargefactor coup3 (coup1R coup2L (I_4 + I_6 + I_7) MassEx1 + coup1L (coup2R (I_3 + I_4 + I_5) MassEx2 - coup2L (I_2 + I_5 + I_7) mF1))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qSR=OA2qSR+2.*chargefactor*coup3*(coup1L*coup2R*(int4 + int6 + int7)*MassEx1 + coup1R*(coup2L*(int3 + int4 + int5)*MassEx2 - 1.*coup2R*(int2 + int5 + int7)*mF1))\n" ];
	 	 WriteString[sphenoTeX,"  OA2qSR= & "<> StringReplace["2 chargefactor coup3 (coup1L coup2R (I_4 + I_6 + I_7) MassEx1 + coup1R (coup2L (I_3 + I_4 + I_5) MassEx2 - coup2R (I_2 + I_5 + I_7) mF1))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qVL=OA2qVL+-2.*chargefactor*coup1L*coup2R*coup3*int1\n" ];
	 	 WriteString[sphenoTeX,"  OA2qVL= & "<> StringReplace["-2 chargefactor coup1L coup2R coup3 I_1",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qVR=OA2qVR+-2.*chargefactor*coup1R*coup2L*coup3*int1\n" ];
	 	 WriteString[sphenoTeX,"  OA2qVR= & "<> StringReplace["-2 chargefactor coup1R coup2L coup3 I_1",SA`SPhenoTeXSub]<>" \\\\ \n" ];
,
	VFF, 
	 	 WriteString[file,"  int1=B0(0._dp, mF12, mF22)\n" ];
	 	 WriteString[sphenoTeX,"I_1= & "<> StringReplace["B_0(0, mF12, mF22)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int2=C00m(mF22, mF12, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_2= & "<> StringReplace["C00m(mF22, mF12, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int3=C0m(mF22, mF12, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_3= & "<> StringReplace["C0m(mF22, mF12, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int4=C12m(mF22, mF12, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_4= & "<> StringReplace["C12m(mF22, mF12, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int5=C1m(mF22, mF12, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_5= & "<> StringReplace["C1m(mF22, mF12, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int6=C22m(mF22, mF12, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_6= & "<> StringReplace["C22m(mF22, mF12, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int7=C2m(mF22, mF12, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_7= & "<> StringReplace["C2m(mF22, mF12, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  OA2qSL=OA2qSL+-4.*chargefactor*(-1.*coup1R*coup2R*coup3R*(int4 + int7)*MassEx1 + coup1L*(coup2L*coup3L*(int4 + int6)*MassEx2 + coup2R*int7*(coup3R*mF1 + coup3L*mF2)))\n" ];
	 	 WriteString[sphenoTeX,"  OA2qSL= & "<> StringReplace["-4 chargefactor (-(coup1R coup2R coup3R (I_4 + I_7) MassEx1) + coup1L (coup2L coup3L (I_4 + I_6) MassEx2 + coup2R I_7 (coup3R mF1 + coup3L mF2)))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qSR=OA2qSR+-4.*chargefactor*(-1.*coup1L*coup2L*coup3L*(int4 + int7)*MassEx1 + coup1R*(coup2R*coup3R*(int4 + int6)*MassEx2 + coup2L*int7*(coup3L*mF1 + coup3R*mF2)))\n" ];
	 	 WriteString[sphenoTeX,"  OA2qSR= & "<> StringReplace["-4 chargefactor (-(coup1L coup2L coup3L (I_4 + I_7) MassEx1) + coup1R (coup2R coup3R (I_4 + I_6) MassEx2 + coup2L I_7 (coup3L mF1 + coup3R mF2)))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qVL=OA2qVL+chargefactor*(2.*coup1R*coup2R*coup3R*int7*MassEx1*MassEx2 + coup1L*coup2L*(2.*coup3R*int3*mF1*mF2 + coup3L*(Finite - 2.*int1 + 4.*int2 - 2.*int5*MassEx12 + 2.*int3*MassEx22 + 2.*int5*MassEx22 + 2.*int7*MassEx22 - 2.*int3*mV12)))\n" ];
	 	 WriteString[sphenoTeX,"  OA2qVL= & "<> StringReplace["chargefactor (2 coup1R coup2R coup3R I_7 MassEx1 MassEx2 + coup1L coup2L (2 coup3R I_3 mF1 mF2 + coup3L (1 - 2 I_1 + 4 I_2 - 2 I_5 MassEx12 + 2 I_3 MassEx22 + 2 I_5 MassEx22 + 2 I_7 MassEx22 - 2 I_3 mV12)))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qVR=OA2qVR+chargefactor*(2.*coup1L*coup2L*coup3L*int7*MassEx1*MassEx2 + coup1R*coup2R*(2.*coup3L*int3*mF1*mF2 + coup3R*(Finite - 2.*int1 + 4.*int2 - 2.*int5*MassEx12 + 2.*int3*MassEx22 + 2.*int5*MassEx22 + 2.*int7*MassEx22 - 2.*int3*mV12)))\n" ];
	 	 WriteString[sphenoTeX,"  OA2qVR= & "<> StringReplace["chargefactor (2 coup1L coup2L coup3L I_7 MassEx1 MassEx2 + coup1R coup2R (2 coup3L I_3 mF1 mF2 + coup3R (1 - 2 I_1 + 4 I_2 - 2 I_5 MassEx12 + 2 I_3 MassEx22 + 2 I_5 MassEx22 + 2 I_7 MassEx22 - 2 I_3 mV12)))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
,
	FSV, 
	 	 WriteString[file,"  int1=C0m(mF12, mV22, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_1= & "<> StringReplace["C0m(mF12, mV22, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int2=C1m(mF12, mV22, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_2= & "<> StringReplace["C1m(mF12, mV22, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int3=C2m(mF12, mV22, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_3= & "<> StringReplace["C2m(mF12, mV22, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  OA2qSL=OA2qSL+-2.*chargefactor*coup1L*coup2R*coup3*int2\n" ];
	 	 WriteString[sphenoTeX,"  OA2qSL= & "<> StringReplace["-2 chargefactor coup1L coup2R coup3 I_2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qSR=OA2qSR+-2.*chargefactor*coup1R*coup2L*coup3*int2\n" ];
	 	 WriteString[sphenoTeX,"  OA2qSR= & "<> StringReplace["-2 chargefactor coup1R coup2L coup3 I_2",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qVL=OA2qVL+chargefactor*(coup1R*coup2L*coup3*int3*MassEx1 - 1.*coup1L*coup3*(coup2R*int2*MassEx2 + coup2L*int1*mF1))\n" ];
	 	 WriteString[sphenoTeX,"  OA2qVL= & "<> StringReplace["chargefactor (coup1R coup2L coup3 I_3 MassEx1 - coup1L coup3 (coup2R I_2 MassEx2 + coup2L I_1 mF1))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qVR=OA2qVR+chargefactor*(coup1L*coup2R*coup3*int3*MassEx1 - 1.*coup1R*coup3*(coup2L*int2*MassEx2 + coup2R*int1*mF1))\n" ];
	 	 WriteString[sphenoTeX,"  OA2qVR= & "<> StringReplace["chargefactor (coup1L coup2R coup3 I_3 MassEx1 - coup1R coup3 (coup2L I_2 MassEx2 + coup2R I_1 mF1))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
,
	FVS, 
	 	 WriteString[file,"  int1=C0m(mF12, mS22, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_1= & "<> StringReplace["C0m(mF12, mS22, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int2=C1m(mF12, mS22, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_2= & "<> StringReplace["C1m(mF12, mS22, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int3=C2m(mF12, mS22, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_3= & "<> StringReplace["C2m(mF12, mS22, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  OA2qSL=OA2qSL+-2.*chargefactor*coup1L*coup2L*coup3*int3\n" ];
	 	 WriteString[sphenoTeX,"  OA2qSL= & "<> StringReplace["-2 chargefactor coup1L coup2L coup3 I_3",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qSR=OA2qSR+-2.*chargefactor*coup1R*coup2R*coup3*int3\n" ];
	 	 WriteString[sphenoTeX,"  OA2qSR= & "<> StringReplace["-2 chargefactor coup1R coup2R coup3 I_3",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qVL=OA2qVL+-1.*chargefactor*coup3*(coup1R*coup2R*int3*MassEx1 - 1.*coup1L*coup2L*int2*MassEx2 + coup1L*coup2R*int1*mF1)\n" ];
	 	 WriteString[sphenoTeX,"  OA2qVL= & "<> StringReplace["-(chargefactor coup3 (coup1R coup2R I_3 MassEx1 - coup1L coup2L I_2 MassEx2 + coup1L coup2R I_1 mF1))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qVR=OA2qVR+-1.*chargefactor*coup3*(coup1L*coup2L*int3*MassEx1 - 1.*coup1R*coup2R*int2*MassEx2 + coup1R*coup2L*int1*mF1)\n" ];
	 	 WriteString[sphenoTeX,"  OA2qVR= & "<> StringReplace["-(chargefactor coup3 (coup1L coup2L I_3 MassEx1 - coup1R coup2R I_2 MassEx2 + coup1R coup2L I_1 mF1))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
,
	FVV, 
	 	 WriteString[file,"  int1=B0(0._dp, mV12, mV22)\n" ];
	 	 WriteString[sphenoTeX,"I_1= & "<> StringReplace["B_0(0, mV12, mV22)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int2=C00m(mF12, mV22, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_2= & "<> StringReplace["C00m(mF12, mV22, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int3=C0m(mF12, mV22, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_3= & "<> StringReplace["C0m(mF12, mV22, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int4=C11m(mF12, mV22, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_4= & "<> StringReplace["C11m(mF12, mV22, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int5=C12m(mF12, mV22, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_5= & "<> StringReplace["C12m(mF12, mV22, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int6=C1m(mF12, mV22, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_6= & "<> StringReplace["C1m(mF12, mV22, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int7=C22m(mF12, mV22, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_7= & "<> StringReplace["C22m(mF12, mV22, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int8=C2m(mF12, mV22, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_8= & "<> StringReplace["C2m(mF12, mV22, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  OA2qSL=OA2qSL+2.*chargefactor*coup3*(coup1R*coup2R*(2.*int5 - 1.*int6 + 2.*int7)*MassEx1 + coup1L*(coup2L*(2.*int4 + 2.*int5 - 1.*int8)*MassEx2 + 3.*coup2R*(int6 + int8)*mF1))\n" ];
	 	 WriteString[sphenoTeX,"  OA2qSL= & "<> StringReplace["2 chargefactor coup3 (coup1R coup2R (2 I_5 - I_6 + 2 I_7) MassEx1 + coup1L (coup2L (2 I_4 + 2 I_5 - I_8) MassEx2 + 3 coup2R (I_6 + I_8) mF1))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qSR=OA2qSR+2.*chargefactor*coup3*(coup1L*coup2L*(2.*int5 - 1.*int6 + 2.*int7)*MassEx1 + coup1R*(coup2R*(2.*int4 + 2.*int5 - 1.*int8)*MassEx2 + 3.*coup2L*(int6 + int8)*mF1))\n" ];
	 	 WriteString[sphenoTeX,"  OA2qSR= & "<> StringReplace["2 chargefactor coup3 (coup1L coup2L (2 I_5 - I_6 + 2 I_7) MassEx1 + coup1R (coup2R (2 I_4 + 2 I_5 - I_8) MassEx2 + 3 coup2L (I_6 + I_8) mF1))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qVL=OA2qVL+chargefactor*coup3*(-3.*coup1R*MassEx1*(coup2R*(int6 + int8)*MassEx2 + coup2L*int3*mF1) - 1.*coup1L*(3.*coup2R*int3*MassEx2*mF1 + coup2L*(-1.*Finite + 2.*int1 + 4.*int2 + int8*MassEx12 + int6*MassEx22 + 2.*int3*mF12)))\n" ];
	 	 WriteString[sphenoTeX,"  OA2qVL= & "<> StringReplace["chargefactor coup3 (-3 coup1R MassEx1 (coup2R (I_6 + I_8) MassEx2 + coup2L I_3 mF1) - coup1L (3 coup2R I_3 MassEx2 mF1 + coup2L (-1 + 2 I_1 + 4 I_2 + I_8 MassEx12 + I_6 MassEx22 + 2 I_3 mF12)))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qVR=OA2qVR+chargefactor*coup3*(-3.*coup1L*MassEx1*(coup2L*(int6 + int8)*MassEx2 + coup2R*int3*mF1) - 1.*coup1R*(3.*coup2L*int3*MassEx2*mF1 + coup2R*(-1.*Finite + 2.*int1 + 4.*int2 + int8*MassEx12 + int6*MassEx22 + 2.*int3*mF12)))\n" ];
	 	 WriteString[sphenoTeX,"  OA2qVR= & "<> StringReplace["chargefactor coup3 (-3 coup1L MassEx1 (coup2L (I_6 + I_8) MassEx2 + coup2R I_3 mF1) - coup1R (3 coup2L I_3 MassEx2 mF1 + coup2R (-1 + 2 I_1 + 4 I_2 + I_8 MassEx12 + I_6 MassEx22 + 2 I_3 mF12)))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
]; 
];]; 


AddWaveResultPreSARAH[Gamma2Q][top_,type_,file_]:=Block[{}, 

 (* This routine returns the generic expression for the amplitude of a given triangle diagram *) 
 
 Switch[top,  (* Check topology *) 
  1, 
  Switch[type,  (* Check the generic type of the diagram *) 
	FS | SF , 
	 	 WriteString[file,"  int1=B0(MassEx12, mF12, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_1= & "<> StringReplace["B_0(MassEx12, mF12, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int2=B1(MassEx12, mF12, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_2= & "<> StringReplace["B_1(MassEx12, mF12, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  OA2qSL=OA2qSL+0.\n" ];
	 	 WriteString[sphenoTeX,"  OA2qSL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qSR=OA2qSR+0.\n" ];
	 	 WriteString[sphenoTeX,"  OA2qSR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qVL=OA2qVL+(chargefactor*coup3L*(-1.*coup1L*coup2R*int2*MassEx12 + coup1R*coup2R*int1*MassEx1*mF1 - 1.*coup1R*coup2L*int2*MassEx1*MFin + coup1L*coup2L*int1*mF1*MFin))/(MassEx12 - 1.*MFin2)\n" ];
	 	 WriteString[sphenoTeX,"  OA2qVL= & "<> StringReplace["(chargefactor coup3L (-(coup1L coup2R I_2 MassEx12) + coup1R coup2R I_1 MassEx1 mF1 - coup1R coup2L I_2 MassEx1 MFin + coup1L coup2L I_1 mF1 MFin))/(MassEx12 - MFin2)",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qVR=OA2qVR+(chargefactor*coup3R*(-1.*coup1R*coup2L*int2*MassEx12 + coup1L*coup2L*int1*MassEx1*mF1 - 1.*coup1L*coup2R*int2*MassEx1*MFin + coup1R*coup2R*int1*mF1*MFin))/(MassEx12 - 1.*MFin2)\n" ];
	 	 WriteString[sphenoTeX,"  OA2qVR= & "<> StringReplace["(chargefactor coup3R (-(coup1R coup2L I_2 MassEx12) + coup1L coup2L I_1 MassEx1 mF1 - coup1L coup2R I_2 MassEx1 MFin + coup1R coup2R I_1 mF1 MFin))/(MassEx12 - MFin2)",SA`SPhenoTeXSub]<>" \\\\ \n" ];
,
	FV | VF , 
	 	 WriteString[file,"  int1=B0(MassEx12, mF12, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_1= & "<> StringReplace["B_0(MassEx12, mF12, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int2=B1(MassEx12, mF12, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_2= & "<> StringReplace["B_1(MassEx12, mF12, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  OA2qSL=OA2qSL+0.\n" ];
	 	 WriteString[sphenoTeX,"  OA2qSL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qSR=OA2qSR+0.\n" ];
	 	 WriteString[sphenoTeX,"  OA2qSR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qVL=OA2qVL+(-1.*chargefactor*coup3L*(coup1R*MassEx1*(-2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)*MassEx12 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)\n" ];
	 	 WriteString[sphenoTeX,"  OA2qVL= & "<> StringReplace["-((chargefactor coup3L (coup1R MassEx1 (-2 coup2L (1 - 2 I_1) mF1 + coup2R (1 + 2 I_2) MFin) + coup1L (coup2L (1 + 2 I_2) MassEx12 - 2 coup2R (1 - 2 I_1) mF1 MFin)))/(MassEx12 - MFin2))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qVR=OA2qVR+(-1.*chargefactor*coup3R*(coup1L*MassEx1*(-2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)*MassEx12 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)\n" ];
	 	 WriteString[sphenoTeX,"  OA2qVR= & "<> StringReplace["-((chargefactor coup3R (coup1L MassEx1 (-2 coup2R (1 - 2 I_1) mF1 + coup2L (1 + 2 I_2) MFin) + coup1R (coup2R (1 + 2 I_2) MassEx12 - 2 coup2L (1 - 2 I_1) mF1 MFin)))/(MassEx12 - MFin2))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
]; 
,
  2, 
  Switch[type,  (* Check the generic type of the diagram *) 
	FS | SF , 
	 	 WriteString[file,"  int1=B0(MassEx22, mF12, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_1= & "<> StringReplace["B_0(MassEx22, mF12, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int2=B1(MassEx22, mF12, mS12)\n" ];
	 	 WriteString[sphenoTeX,"I_2= & "<> StringReplace["B_1(MassEx22, mF12, mS12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  OA2qSL=OA2qSL+0.\n" ];
	 	 WriteString[sphenoTeX,"  OA2qSL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qSR=OA2qSR+0.\n" ];
	 	 WriteString[sphenoTeX,"  OA2qSR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qVL=OA2qVL+(chargefactor*coup3L*(-1.*coup1R*coup2L*int2*MassEx22 + coup1L*coup2L*int1*MassEx2*mF1 - 1.*coup1L*coup2R*int2*MassEx2*MFin + coup1R*coup2R*int1*mF1*MFin))/(MassEx22 - 1.*MFin2)\n" ];
	 	 WriteString[sphenoTeX,"  OA2qVL= & "<> StringReplace["(chargefactor coup3L (-(coup1R coup2L I_2 MassEx22) + coup1L coup2L I_1 MassEx2 mF1 - coup1L coup2R I_2 MassEx2 MFin + coup1R coup2R I_1 mF1 MFin))/(MassEx22 - MFin2)",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qVR=OA2qVR+(chargefactor*coup3R*(-1.*coup1L*coup2R*int2*MassEx22 + coup1R*coup2R*int1*MassEx2*mF1 - 1.*coup1R*coup2L*int2*MassEx2*MFin + coup1L*coup2L*int1*mF1*MFin))/(MassEx22 - 1.*MFin2)\n" ];
	 	 WriteString[sphenoTeX,"  OA2qVR= & "<> StringReplace["(chargefactor coup3R (-(coup1L coup2R I_2 MassEx22) + coup1R coup2R I_1 MassEx2 mF1 - coup1R coup2L I_2 MassEx2 MFin + coup1L coup2L I_1 mF1 MFin))/(MassEx22 - MFin2)",SA`SPhenoTeXSub]<>" \\\\ \n" ];
,
	FV | VF , 
	 	 WriteString[file,"  int1=B0(MassEx22, mF12, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_1= & "<> StringReplace["B_0(MassEx22, mF12, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  int2=B1(MassEx22, mF12, mV12)\n" ];
	 	 WriteString[sphenoTeX,"I_2= & "<> StringReplace["B_1(MassEx22, mF12, mV12)",SA`SPhenoTeXSub]<>" \\\\ \n"];
	 	 WriteString[file,"  OA2qSL=OA2qSL+0.\n" ];
	 	 WriteString[sphenoTeX,"  OA2qSL= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qSR=OA2qSR+0.\n" ];
	 	 WriteString[sphenoTeX,"  OA2qSR= & "<> StringReplace["0",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qVL=OA2qVL+(-1.*chargefactor*coup3L*(coup1R*MassEx2*(-2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)*MassEx22 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)\n" ];
	 	 WriteString[sphenoTeX,"  OA2qVL= & "<> StringReplace["-((chargefactor coup3L (coup1R MassEx2 (-2 coup2L (1 - 2 I_1) mF1 + coup2R (1 + 2 I_2) MFin) + coup1L (coup2L (1 + 2 I_2) MassEx22 - 2 coup2R (1 - 2 I_1) mF1 MFin)))/(MassEx22 - MFin2))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
	 	 WriteString[file,"  OA2qVR=OA2qVR+(-1.*chargefactor*coup3R*(coup1L*MassEx2*(-2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)*MassEx22 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)\n" ];
	 	 WriteString[sphenoTeX,"  OA2qVR= & "<> StringReplace["-((chargefactor coup3R (coup1L MassEx2 (-2 coup2R (1 - 2 I_1) mF1 + coup2L (1 + 2 I_2) MFin) + coup1R (coup2R (1 + 2 I_2) MassEx22 - 2 coup2L (1 - 2 I_1) mF1 MFin)))/(MassEx22 - MFin2))",SA`SPhenoTeXSub]<>" \\\\ \n" ];
]; 
];]; 


