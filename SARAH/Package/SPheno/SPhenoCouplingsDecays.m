(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



GenerateSPhenoRunningCouplingsDecay:=Block[{i,currentRegime,readRegime},
Print["--------------------------------------"];
Print["Writing file for running couplings in decays "];
Print["--------------------------------------"];

$sarahCurrentSPhenoDir=ToFileName[{$sarahCurrentOutputDir,"SPheno"}];
sphenoCoup=OpenWrite[ToFileName[$sarahCurrentSPhenoDir,"CouplingsForDecays_"<>ModelName<>".f90"]];


Print["Writing Module Header"];

WriteCopyRight[sphenoCoup];





WriteString[sphenoCoup,"Module CouplingsForDecays_"<>ModelName<>"\n \n"];
WriteString[sphenoCoup, "Use Control \n"];
WriteString[sphenoCoup, "Use Model_Data_"<>ModelName<>" \n"];
If[NonSUSYModel=!=True,
WriteString[sphenoCoup, "Use RGEs_"<>ModelName<>" \n"];
];
WriteString[sphenoCoup, "Use Couplings_"<>ModelName<>" \n"];
WriteString[sphenoCoup, "Use LoopCouplings_"<>ModelName<>" \n"];
WriteString[sphenoCoup,"Use Tadpoles_"<>ModelName<>" \n "];
WriteString[sphenoCoup, "Use SusyMasses_"<>ModelName<>" \n"];
(* WriteString[sphenoCoup, "Use LoopMasses_"<>ModelName<>" \n"]; *)
WriteString[sphenoCoup, "Use Mathematics, Only: CompareMatrices, Adjungate \n \n"];

WriteString[sphenoCoup, "Use StandardModel \n"];

WriteString[sphenoCoup, "Contains \n \n "];


WriteString[sphenoCoup,"\n \n"];

Print["Writing running couplings"];
For[i=1,i<=Length[savedDecayInfos],
GenerateRunningCouplings[savedDecayInfos[[i,1]],Flatten[savedDecayInfos[[i,2]]],"2B"];
i++;];

For[i=1,i<=Length[savedDecayInfos3Body],
GenerateRunningCouplings[savedDecayInfos3Body[[i,1]],savedDecayInfos3Body[[i,3]],"3B"];
i++;];


(*
For[i=1,i<=Length[savedDecayInfos3Body],
For[j=1,j<=Length[Last[savedDecayInfos3Body[[i]]]],
GenerateRunningCouplings[savedDecayInfos3Body[[i,1]],Flatten[Last[savedDecayInfos3Body[[i]]][[j]]],"3B"<>"_"<>ToString[j]];
j++;];
i++;];
*)

WriteString[sphenoCoup,"Function NFlav(m_in) \n"];
WriteString[sphenoCoup,"Implicit None \n"];
WriteString[sphenoCoup,"Real(dp), Intent(in) :: m_in \n"];
WriteString[sphenoCoup,"Real(dp) :: NFlav \n"];
WriteString[sphenoCoup,"If (m_in.lt.mf_d(3)) Then \n"];
WriteString[sphenoCoup,"  NFlav = 4._dp \n"];
WriteString[sphenoCoup,"Else If (m_in.lt.mf_u(3)) Then \n"];
WriteString[sphenoCoup,"  NFlav = 5._dp \n"];
WriteString[sphenoCoup,"Else \n"];
WriteString[sphenoCoup,"  NFlav = 6._dp \n"];
WriteString[sphenoCoup,"End if \n"];
WriteString[sphenoCoup,"End Function\n\n"];

AppendSourceCode["RunSM.f90",sphenoCoup];



WriteString[sphenoCoup,"End Module CouplingsForDecays_"<>ModelName<>"\n"];
Close[sphenoCoup];
];


GenerateRunningCouplings[particle_,couplings_,suffix_]:=Block[{i,j,i1,i2,i3,temp,res,alreadyCalculated, SPhenoCouplings},
MakeSubroutineTitle["CouplingsFor_"<>SPhenoForm[particle]<>"_decays_"<>suffix,Flatten[{Map[ToExpression[SPhenoForm[#]<>"input"]&,Join[NewMassParameters,listAllParametersAndVEVs]],couplings}],{"m_in","i1"},{"deltaM"},sphenoCoup]; 
WriteString[sphenoCoup, "Implicit None \n\n"];
WriteString[sphenoCoup,"Real(dp), Intent(in) :: m_in \n"];
WriteString[sphenoCoup,"Real(dp), Intent(in) :: deltaM \n"];
WriteString[sphenoCoup,"Integer, Intent(in) :: i1 \n"];
MakeVariableList[Map[ToExpression[SPhenoForm[#]<>"input"]&,listAllParametersAndVEVs],",Intent(in)",sphenoCoup];
MakeVariableList[Map[ToExpression[SPhenoForm[#]<>"input"]&,NewMassParameters],",Intent(in)",sphenoCoup];
MakeVariableList[listAllParametersAndVEVs,"",sphenoCoup];
MakeVariableList[couplings,",Intent(out)",sphenoCoup];
If[NonSUSYModel=!=True,
WriteString[sphenoCoup,"Real(dp) ::  g1D("<>ToString[numberAllwithVEVs]<>") \n"];
];
WriteString[sphenoCoup,"Integer :: i2, i3, gt1, gt2, gt3, kont \n"];
MakeVariableList[NewMassParameters,"",sphenoCoup];
(* MakeVariableList[NewParametersFromTadpoles,"",sphenoCoup]; *)
If[particle===HiggsBoson  || particle === PseudoScalar,
MakeVariableList[NeededRatiosLoopCouplings,"",sphenoCoup];
MakeVariableList[NeededRatiosLoopCouplingsPseudo,"",sphenoCoup];
WriteString[sphenoCoup,"Complex(dp) :: coup \n"];
WriteString[sphenoCoup,"Real(dp) :: vev, rq, rsq \n"];
];
WriteString[sphenoCoup,"Real(dp) :: gSM(11), sinW2, dt, tz, Qin \n"];

WriteString[sphenoCoup, "Iname = Iname + 1 \n"];
WriteString[sphenoCoup, "NameOfUnit(Iname) = 'Couplings_"<>SPhenoForm[particle]<>"_"<>suffix<>"'\n \n"];

WriteString[sphenoCoup,"sinW2=1._dp-mW2/mZ2 \n"];

For[i=1,i<=Length[listAllParametersAndVEVs],
WriteString[sphenoCoup,SPhenoForm[listAllParametersAndVEVs[[i]]]<>" = "<>SPhenoForm[listAllParametersAndVEVs[[i]]]<>"input \n"];
i++;];

WriteString[sphenoCoup,"Qin=sqrt(getRenormalizationScale()) \n"];

If[NonSUSYModel=!=True,
WriteGUTnormalization[sphenoCoup];
MakeCall["ParametersToG"<>ToString[numberAllwithVEVs],listAllParametersAndVEVs,{},{"g1D"},sphenoCoup];

(* Add check if running up or down ! *)

WriteString[sphenoCoup,"If ((m_in.le.Qin).and.(RunningCouplingsDecays)) Then \n"];
WriteString[sphenoCoup,"  tz=Log(m_in/Qin) \n"];
WriteString[sphenoCoup,"  If (m_in.le.mz) tz=Log(mz/Qin)  \n"];
WriteString[sphenoCoup,"  dt=tz/50._dp \n"];
WriteString[sphenoCoup,"  Call odeint(g1D,"<>ToString[numberAllwithVEVs]<>",0._dp,tz,deltaM,dt,0._dp,rge"<>ToString[numberAllwithVEVs]<>",kont)\n\n"];
(*
WriteString[sphenoCoup, "Else \n"];
WriteString[sphenoCoup,"  tz=Log(Qin/m_in) \n"];
WriteString[sphenoCoup,"  dt=tz/50._dp \n"];
WriteString[sphenoCoup,"  Call odeint(g1D,"<>ToString[numberAllwithVEVs]<>",tz,0._dp,deltaM,dt,0._dp,rge"<>ToString[numberAllwithVEVs]<>",kont)\n\n"];
*)
WriteString[sphenoCoup, "End if \n"];

MakeCall["GToParameters"<>ToString[numberAllwithVEVs],listAllParametersAndVEVs,{"g1D"},{},sphenoCoup];
WriteRemoveGUTnormalization[sphenoCoup];
];

(* Check if SM-like particle or heavier than SUSY scale *)

 If[AddSMrunning=!=False, 
If[getRParity[particle,SA`CurrentStates]===1,

WriteString[sphenoCoup,"If (m_in.le.Qin) Then \n"];
WriteString[sphenoCoup,"  If (m_in.le.mz) Then \n"];
If[AddOHDM=!=True,
WriteString[sphenoCoup,"    Call RunSM(mz,deltaM,"<>SPhenoForm[VEVSM2]<>"/"<>SPhenoForm[VEVSM1]<>","<>SPhenoForm[hyperchargeCoupling]<>","<>SPhenoForm[leftCoupling]<>","<>SPhenoForm[strongCoupling]<>","<>SPhenoForm[UpYukawa]<>","<>SPhenoForm[DownYukawa]<>","<>SPhenoForm[ElectronYukawa]<>","<>SPhenoForm[VEVSM1]<>","<>SPhenoForm[VEVSM2]<>") \n"];,
WriteString[spheno,"Call RunSMohdm(mz,deltaM, "<>SPhenoForm[hyperchargeCoupling]<>","<>SPhenoForm[leftCoupling]<>","<>SPhenoForm[strongCoupling]<>","<>SPhenoForm[UpYukawa]<>","<>SPhenoForm[DownYukawa]<>","<>SPhenoForm[ElectronYukawa]<>","<>SPhenoForm[VEVSM]<>") \n"];
];
WriteString[sphenoCoup,"  Else \n"];
If[AddOHDM=!=True,
WriteString[sphenoCoup,"    Call RunSM(m_in,deltaM,"<>SPhenoForm[VEVSM2]<>"/"<>SPhenoForm[VEVSM1]<>","<>SPhenoForm[hyperchargeCoupling]<>","<>SPhenoForm[leftCoupling]<>","<>SPhenoForm[strongCoupling]<>","<>SPhenoForm[UpYukawa]<>","<>SPhenoForm[DownYukawa]<>","<>SPhenoForm[ElectronYukawa]<>","<>SPhenoForm[VEVSM1]<>","<>SPhenoForm[VEVSM2]<>") \n"];,
WriteString[spheno,"Call RunSMohdm(m_in,deltaM, "<>SPhenoForm[hyperchargeCoupling]<>","<>SPhenoForm[leftCoupling]<>","<>SPhenoForm[strongCoupling]<>","<>SPhenoForm[UpYukawa]<>","<>SPhenoForm[DownYukawa]<>","<>SPhenoForm[ElectronYukawa]<>","<>SPhenoForm[VEVSM]<>") \n"];
];
WriteString[sphenoCoup,"  End if \n"];
WriteString[sphenoCoup,"End if \n"];

];
]; 


WriteTadpoleSolution[sphenoCoup];

(* Check if Higgs boson to calculate the effective couplings *)


WriteString[sphenoCoup,"! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- \n"];


MakeCall["TreeMasses",Join[NewMassParameters,Join[listVEVs,listAllParameters]],{},{".True.","kont"},sphenoCoup];

If[FreeQ[ParameterDefinitions,"Scalar-Mixing-Matrix"]==False,
WriteString[sphenoCoup,SPhenoForm[HiggsMixingMatrix] <>" = "<> SPhenoForm[HiggsMixingMatrix]<>"input \n"];
];
If[FreeQ[ParameterDefinitions,"Pseudo-Scalar-Mixing-Matrix"]==False,
WriteString[sphenoCoup,SPhenoForm[PseudoScalarMixingMatrix] <>" = "<> SPhenoForm[PseudoScalarMixingMatrix]<>"input \n"];
];

If[(particle===HiggsBoson || particle == PseudoScalar) && suffix ==="2B",
SPhenoCouplings= Select[SPhenoCouplingsAll,(FreeQ[couplings,#[[2,2]]]==False)&];

For[i=1,i<=Length[SPhenoCouplings],
If[Length[SPhenoCouplings[[i,2]]]==2,
WriteString[sphenoCoup, ToString[SPhenoCouplings[[i,2,2]]] <> " = 0._dp \n"];,
WriteString[sphenoCoup, ToString[SPhenoCouplings[[i,2,2]]] <> " = 0._dp \n"];
WriteString[sphenoCoup, ToString[SPhenoCouplings[[i,2,3]]] <> " = 0._dp \n"];
];

OpenDoes[{getIndexRangeSPheno[SPhenoCouplings[[i,2,2]]]},sphenoCoup];

cNames="";
For[i1=2,i1<=Length[SPhenoCouplings[[i,2]]],
cNames = cNames <> ToString[SPhenoCouplings[[i,2,i1]]] <> AddDimNames2[SPhenoCouplings[[i,2,i1]]]<>","; 
i1++;];

cNames = StringDrop[cNames,-1];

MakeCall[SPhenoCouplings[[i,2,1]]<>"T",Join[SPhenoCouplings[[i,3]],SPhenoCouplings[[i,4]]],{},{cNames},sphenoCoup];

CloseDoes[sphenoCoup];

WriteString[sphenoCoup,"\n\n"];

i++;];

Clear[i1,i2,i3,i4];


WriteString[sphenoCoup, "vev = "<>SPhenoForm[2Sqrt[- Vertex[{VectorW,conj[VectorW]}][[2,1]]/leftCoupling^2] /. sum[a_,b_,c_,d_]:>Sum[d,{a,b,c}]] <>"\n"];


(* couplings have to be weightet with doublet-fraction! *)

If[FreeQ[couplings,cplHiggsWWvirt]==False,WriteString[sphenoCoup, "cplHiggsWWvirt = " <>ToString[getSPhenoCoupling[C[HiggsBoson,VectorW,conj[VectorW]],SPhenoCouplingsAll][[1,1]]] <>"/vev \n"];];

If[FreeQ[couplings,cplHiggsZZvirt]==False, 
If[FreeQ[ParameterDefinitions,"Weinberg-Angle"]==False ,
WriteString[sphenoCoup, "cplHiggsZZvirt = " <>ToString[getSPhenoCoupling[C[HiggsBoson,VectorZ,VectorZ],SPhenoCouplingsAll][[1,1]]] <>"*Sqrt(7._dp/12._dp-10._dp/9._dp*Sin("<>SPhenoForm[Weinberg]<>")**2+40._dp/27._dp*Sin("<>SPhenoForm[Weinberg]<>")**4)/vev \n \n\n"];,
WriteString[sphenoCoup, "cplHiggsZZvirt = " <>ToString[getSPhenoCoupling[C[HiggsBoson,VectorZ,VectorZ],SPhenoCouplingsAll][[1,1]]] <>"*Sqrt(7._dp/12._dp-10._dp/9._dp*0.22290_dp+40._dp/27._dp*(0.22290_dp)**2)/vev \n \n\n"];

];
];
];

If[particle===HiggsBoson && suffix ==="2B",
WriteScalarHiggsCouplingsRatio[sphenoCoup, SA`CurrentStates, Table[SPhenoCouplingsAll[[i,1,1]],{i,1,Length[SPhenoCouplingsAll]}]];
WriteString[sphenoCoup, "rq = 1._dp - oo4pi2*"<>SPhenoForm[strongCoupling]<>"**2 \n"];
WriteString[sphenoCoup, "rsq = 1._dp + 2._dp*oo3pi2*"<>SPhenoForm[strongCoupling]<>"**2\n"];

(* MakeCall["CoupHiggsToPhoton",Flatten[{NeededRatiosLoopCouplingsPhoton,NeededMassesLoopPhoton}],{SPhenoMass[HiggsBoson,i1]},{"rq","rsq","coup"},sphenoCoup]; *)
MakeCall["CoupHiggsToPhoton",Flatten[{NeededRatiosLoopCouplingsPhoton,NeededMassesLoopPhoton}],{"m_in","i1"},{"rq","rsq","coup"},sphenoCoup];
If[getGenSPheno[HiggsBoson]>1,addgen="(i1)";,addgen="";];
(* WriteString[sphenoCoup,"cplHiggsPP"<>addgen<>" = coup*oo4pi*(1._dp-mW2/mZ2)*"<>SPhenoForm[leftCoupling]<>"**2 \n"];  *)
WriteString[sphenoCoup,"cplHiggsPP"<>addgen<>" = coup*Alpha \n"]; 
WriteString[sphenoCoup,"CoupHPP"<>addgen<>" = coup \n"];
(* MakeCall["CoupHiggsToPhotonSM",Flatten[{NeededMassesLoopPhoton}],{SPhenoMass[HiggsBoson,i1]},{"rq","coup"},sphenoCoup]; *)
MakeCall["CoupHiggsToPhotonSM",Flatten[{NeededMassesLoopPhoton}],{"m_in"},{"rq","coup"},sphenoCoup];
(* WriteString[sphenoCoup,"ratioPP"<>addgen<>" = Abs(cplHiggsPP"<>addgen<>"/(coup*oo4pi*(1._dp-mW2/mZ2)*"<>SPhenoForm[leftCoupling]<>"**2))**2 \n"]; *)
WriteString[sphenoCoup,"ratioPP"<>addgen<>" = Abs(cplHiggsPP"<>addgen<>"/(coup*Alpha))**2 \n"];

WriteString[sphenoCoup, "rq = rsq \n"];

(* MakeCall["CoupHiggsToGluon",Flatten[{NeededRatiosLoopCouplingsGluon,NeededMassesLoopGluon}],{SPhenoMass[HiggsBoson,i1]},{"rq","rsq","coup"},sphenoCoup]; *)
MakeCall["CoupHiggsToGluon",Flatten[{NeededRatiosLoopCouplingsGluon,NeededMassesLoopGluon}],{"m_in","i1"},{"rq","rsq","coup"},sphenoCoup];
(* WriteString[sphenoCoup,"cplHiggsGG"<>addgen<>" = coup*oo4pi*"<>SPhenoForm[strongCoupling]<>"**2\n"];  *)
WriteString[sphenoCoup,"cplHiggsGG"<>addgen<>" = coup*AlphaS_MZ \n"]; 
WriteString[sphenoCoup,"CoupHGG"<>addgen<>" = coup \n"];
(* MakeCall["CoupHiggsToGluonSM",Flatten[{NeededMassesLoopGluon}],{SPhenoMass[HiggsBoson,i1]},{"rq","coup"},sphenoCoup]; *)
MakeCall["CoupHiggsToGluonSM",Flatten[{NeededMassesLoopGluon}],{"m_in"},{"rq","coup"},sphenoCoup];
(* WriteString[sphenoCoup,"ratioGG"<>addgen<>" = Abs(cplHiggsGG"<>addgen<>"/(coup*oo4pi*"<>SPhenoForm[strongCoupling]<>"**2))**2 \n"]; *)
WriteString[sphenoCoup,"coup = coup*Sqrt(1._dp + 12._dp*oo48pi2*(95._dp/4._dp - 7._dp/6._dp*NFlav(m_in)) *"<>SPhenoForm[strongCoupling]<>"**2) \n"];
WriteString[sphenoCoup,"cplHiggsGG"<>addgen<>" = cplHiggsGG"<>addgen<>"*Sqrt(1._dp + 12._dp*oo48pi2*(95._dp/4._dp - 7._dp/6._dp*NFlav(m_in)) *"<>SPhenoForm[strongCoupling]<>"**2) \n"];
WriteString[sphenoCoup,"ratioGG"<>addgen<>" = Abs(cplHiggsGG"<>addgen<>"/(coup*AlphaS_MZ))**2 \n"];



WriteHiggsBoundsRatiosScalar[sphenoCoup, SA`CurrentStates, Table[SPhenoCouplingsAll[[i,1,1]],{i,1,Length[SPhenoCouplingsAll]}]];


WriteString[sphenoCoup,"If (i1.eq.1) Then \n"];
If[FreeQ[namesAll,SPhenoCoupling[CS[HiggsBoson,PseudoScalar,VectorZ]]]==False && (getGenSPhenoStart[PseudoScalar]<=getGenSPheno[PseudoScalar]),
WriteString[sphenoCoup,"CPL_A_H_Z = Abs(Transpose("<>ToString[SPhenoCoupling[CS[HiggsBoson,PseudoScalar,VectorZ]]]<>")**2/("<>ToString[leftCoupling]<>"**2/(cos("<>SPhenoForm[Weinberg]<>")*4._dp)))\n"];,
If[FreeQ[namesAll,SPhenoCoupling[CS[PseudoScalar,HiggsBoson,VectorZ]]]==False && getGen[PseudoScalar]>1 && (getGenSPhenoStart[PseudoScalar]<=getGenSPheno[PseudoScalar]),
WriteString[sphenoCoup,"CPL_A_H_Z = Abs("<>ToString[SPhenoCoupling[CS[PseudoScalar,HiggsBoson,VectorZ]]]<>"**2/("<>ToString[leftCoupling]<>"**2/(cos("<>SPhenoForm[Weinberg]<>")*4._dp)))\n"];,
If[FreeQ[ParticleDefinitions[SPheno`Eigenstates],"Higgs"]===False && FreeQ[ParticleDefinitions[SPheno`Eigenstates],"Pseudo-Scalar Higgs"]===False,
WriteString[sphenoCoup,"CPL_A_H_Z = 0 \n"];
];
];
];

If[FreeQ[namesAll,SPhenoCoupling[CS[HiggsBoson,HiggsBoson,VectorZ]]]==False,
WriteString[sphenoCoup,"CPL_H_H_Z = Abs("<>ToString[SPhenoCoupling[CS[HiggsBoson,HiggsBoson,VectorZ]]]<>"**2/("<>ToString[leftCoupling]<>"**2/(cos("<>SPhenoForm[Weinberg]<>")*4._dp)))\n"];,
If[FreeQ[ParticleDefinitions[SPheno`Eigenstates],"Higgs"]===False,
WriteString[sphenoCoup,"CPL_H_H_Z = 0._dp \n"];
];
];
WriteString[sphenoCoup,"End if \n"];
];


If[particle===PseudoScalar && suffix ==="2B",
WritePseudoScalarCouplingsRatio[sphenoCoup,SA`CurrentStates, Table[SPhenoCouplingsAll[[i,1,1]],{i,1,Length[SPhenoCouplingsAll]}]];
If[getGenSPheno[PseudoScalar]>1,addgen="(i1)";,addgen="";];
MakeCall["CoupPseudoHiggsToPhoton",Flatten[{NeededRatiosLoopCouplingsPhotonPseudo,NeededMassesLoopPhoton}],{"m_in","i1"},{"coup"},sphenoCoup];
(* WriteString[sphenoCoup,"cplPseudoHiggsPP"<>addgen<>" = coup*oo4pi*(1._dp-mW2/mZ2)*"<>SPhenoForm[leftCoupling]<>"**2 \n"];  *)
WriteString[sphenoCoup,"cplPseudoHiggsPP"<>addgen<>" = 2._dp*coup*Alpha \n"]; 
WriteString[sphenoCoup,"CoupAPP"<>addgen<>" = 2._dp*coup \n"];
MakeCall["CoupPseudoHiggsToPhotonSM",Flatten[{NeededMassesLoopPhoton}],{"m_in"},{"coup"},sphenoCoup];
WriteString[sphenoCoup,"ratioPPP"<>addgen<>" = Abs(cplPseudoHiggsPP"<>addgen<>"/(2._dp*coup*oo4pi*(1._dp-mW2/mZ2)*"<>SPhenoForm[leftCoupling]<>"**2))**2 \n"]; 

MakeCall["CoupPseudoHiggsToGluon",Flatten[{NeededRatiosLoopCouplingsGluonPseudo,NeededMassesLoopGluon}],{SPhenoMass[HiggsBoson,i1],"i1"},{"coup"},sphenoCoup];
WriteString[sphenoCoup,"cplPseudoHiggsGG"<>addgen<>" = 2._dp*coup*AlphaS_MZ \n"]; 
WriteString[sphenoCoup,"CoupAGG"<>addgen<>" = 2._dp*coup \n"];
MakeCall["CoupPseudoHiggsToGluonSM",Flatten[{NeededMassesLoopGluon}],{"m_in"},{"coup"},sphenoCoup];
WriteString[sphenoCoup,"ratioPGG"<>addgen<>" = Abs(cplPseudoHiggsGG"<>addgen<>"/(2._dp*coup*oo4pi*"<>SPhenoForm[strongCoupling]<>"**2))**2 \n"]; 
WriteString[sphenoCoup, "\n"];
WriteHiggsBoundsRatiosPseudoScalar[sphenoCoup, SA`CurrentStates, Table[SPhenoCouplingsAll[[i,1,1]],{i,1,Length[SPhenoCouplingsAll]}]];


WriteString[sphenoCoup, "If (i1.eq."<>ToString[getGenSPhenoStart[PseudoScalar]]<>") Then \n"];
If[FreeQ[namesAll,SPhenoCoupling[CS[PseudoScalar,PseudoScalar,VectorZ]]]==False,
WriteString[sphenoBR,"CPL_A_A_Z = Abs("<>ToString[SPhenoCoupling[CS[PseudoScalar,PseudoScalar,VectorZ]]]<>"**2/("<>ToString[leftCoupling]<>"**2/(cos("<>SPhenoForm[Weinberg]<>")*4._dp)))\n"];,
If[FreeQ[ParticleDefinitions[SPheno`Eigenstates],"Pseudo-Scalar Higgs"]===False,
WriteString[sphenoBR,"CPL_A_A_Z = 0._dp \n"];
];
];
WriteString[sphenoCoup, "End if \n"];

];


(* WriteString[sphenoCoup,"! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- \n"];
For[i=1,i<=Length[NewMassParameters],
If[Length[getDimSPheno[NewMassParameters[[i]]]]==2 && FreeQ[{ElectronMatrixL, ElectronMatrixR, UpMatrixR, UpMatrixL, DownMatrixR,DownMatrixL,HiggsMixingMatrix},NewMassParameters[[i]]],
WriteString[sphenoCoup,SPhenoForm[NewMassParameters[[i]]] <>" = "<> SPhenoForm[NewMassParameters[[i]]]<>"input \n"];
];
i++;]; *)

WriteString[sphenoCoup,"! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- \n"];
For[i=1,i<=Length[NewMassParameters],
If[Length[getDimSPheno[NewMassParameters[[i]]]]==2 && FreeQ[{ElectronMatrixL, ElectronMatrixR, UpMatrixR, UpMatrixL, DownMatrixR,DownMatrixL},NewMassParameters[[i]]],
WriteString[sphenoCoup,SPhenoForm[NewMassParameters[[i]]] <>" = "<> SPhenoForm[NewMassParameters[[i]]]<>"input \n"];
];
i++;];

SPhenoCouplings= Select[SPhenoCouplingsAll,(FreeQ[couplings,#[[2,2]]]==False)&];

For[i=1,i<=Length[SPhenoCouplings],
If[Length[SPhenoCouplings[[i,2]]]==2,
WriteString[sphenoCoup, ToString[SPhenoCouplings[[i,2,2]]] <> " = 0._dp \n"];,
WriteString[sphenoCoup, ToString[SPhenoCouplings[[i,2,2]]] <> " = 0._dp \n"];
WriteString[sphenoCoup, ToString[SPhenoCouplings[[i,2,3]]] <> " = 0._dp \n"];
];

OpenDoes[{getIndexRangeSPheno[SPhenoCouplings[[i,2,2]]]},sphenoCoup];

cNames="";
For[i1=2,i1<=Length[SPhenoCouplings[[i,2]]],
cNames = cNames <> ToString[SPhenoCouplings[[i,2,i1]]] <> AddDimNames2[SPhenoCouplings[[i,2,i1]]]<>","; 
i1++;];

cNames = StringDrop[cNames,-1];

MakeCall[SPhenoCouplings[[i,2,1]]<>"T",Join[SPhenoCouplings[[i,3]],SPhenoCouplings[[i,4]]],{},{cNames},sphenoCoup];

CloseDoes[sphenoCoup];

WriteString[sphenoCoup,"\n\n"];

i++;];


WriteString[sphenoCoup,"Iname = Iname - 1 \n \n"];
WriteString[sphenoCoup,"End subroutine CouplingsFor_"<>SPhenoForm[particle]<>"_decays_"<>suffix<>"\n \n"];
];
