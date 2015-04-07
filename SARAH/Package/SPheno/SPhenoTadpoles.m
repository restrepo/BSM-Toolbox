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



(*
WriteShiftTadpoleSolution[file_]:=Block[{},
WriteString[file,"If (HighScaleModel.Eq.\"LOW\") Then \n"];
WriteShiftTadpoleSolutionList[file,SubSolutionsTadpolesLoopLowScale,SeveralIndependentTadpoleSolutionsLowScale];
WriteString[file,"Else \n"];
WriteShiftTadpoleSolutionList[file,SubSolutionsTadpolesLoop,SeveralIndependentTadpoleSolutions];
WriteString[file,"End if \n"];
]; *)

WriteShiftTadpoleSolutionList[file_,list_,sevsol_]:=Block[{i},
If[sevsol=!=True,
For[i=1,i<=Length[list],
Switch[Head[list[[i,1]]],
re,WriteString[file,FortranLineBreak["temporaryValue", SPhenoForm[list[[i,2]]],5]<>"\n"];
         WriteString[file,SPhenoForm[list[[i,1,1]]]<>" = Cmplx(Real(temporaryValue,dp),Aimag("<>SPhenoForm[list[[i,1,1]]]<>"),dp )\n"];,
im,WriteString[file,FortranLineBreak["temporaryValue", SPhenoForm[list[[i,2]]],5]<>"\n"];
        WriteString[file,FortranLineBreak[SPhenoForm[list[[i,1,1]]]<>" = Cmplx(real("<>SPhenoForm[list[[i,1,1]]]<>",dp),Real(temporaryValue",5]  <> ",dp),dp) \n"];,
_,WriteString[file,FortranLineBreak[SPhenoForm[list[[i,1]]], SPhenoForm[list[[i,2]]],5]  <> "\n"];
];
i++;];

(*
For[i=1,i<=Length[SquaredParametersTadpoles],
If[FreeQ[list,SquaredParametersTadpoles[[i,2]]]==False,
WriteString[file,"If ("<>ToString[SquaredParametersTadpoles[[i,1]]]<>".Lt.0._dp) Then \n"];
WriteString[file,     SPhenoForm[SquaredParametersTadpoles[[i,1]]]<>" = 10000._dp  \n"];
WriteString[file,      SPhenoForm[SquaredParametersTadpoles[[i,2]]]<>" = "<>SPhenoForm[SquaredParametersTadpoles[[i,3]]] <>"* 100._dp  \n"];
WriteString[file,      "SignOfMuChanged = .True.  \n"];
WriteString[file,"End If \n"];
];
i++;]; *)

WriteString[file,"\n ! ----------- Check solutions for consistency  -------- \n"];
WriteString[file,"\n ! Check for NaNs \n"];
For[i=1,i<=Length[list],
If[FreeQ[SquaredParametersTadpoles,list[[i,1]]],
If[FreeQ[realVar,list[[i,1]]/.{re[x_]->re,im[x_]->x}]===True,
WriteString[file, "If (Real("<>SPhenoForm[list[[i,1]]/.{re[x_]->x,im[x_]->x}]<>",dp).ne.Real("<>SPhenoForm[list[[i,1]]/.{re[x_]->x,im[x_]->x}]<>",dp)) Then \n "];,
WriteString[file, "If ("<>SPhenoForm[list[[i,1]]/.{re[x_]->x,im[x_]->x}]<>".ne."<>SPhenoForm[list[[i,1]]/.{re[x_]->x,im[x_]->x}]<>") Then \n "];
];
WriteString[file, "  Write(*,*) \"NaN appearing in solution of tadpole equations for "<>SPhenoForm[list[[i,1]]/.{re[x_]->x,im[x_]->x}] <>"\" \n "];
WriteString[file, "  Call TerminateProgram  \n "];
WriteString[file, "End If \n "];

If[FreeQ[realVar,list[[i,1]]/.{re[x_]->re,im[x_]->x, A_[b__Integer]->A}]===True && Head[list[[i,1]]]=!=re &&  Head[list[[i,1]]]=!=im,
WriteString[file, "If (Abs(AImag("<>SPhenoForm[list[[i,1]]]<>")).gt.1.0E-04_dp) Then \n "];
WriteString[file, "  Write(*,*) \"No real solution of tadpole equations for "<>SPhenoForm[list[[i,1]]/.{re[x_]->x,im[x_]->x}] <>"\" \n "];
WriteString[file, "  Call TerminateProgram  \n "];
WriteString[file, "End If \n "];
];
];
i++;];
If[Length[SquaredParametersTadpoles]>0,WriteString[file,"\n ! Check for positive abs-squared \n"];];
For[i=1,i<=Length[SquaredParametersTadpoles],
If[FreeQ[Table[list[[j,1]],{j,1,Length[list]}],SquaredParametersTadpoles[[i,2]]]==False,
WriteString[file,"If ("<>ToString[SquaredParametersTadpoles[[i,1]]]<>".Lt.0._dp) Then \n"];
WriteString[file,      "Write(*,*) \"No consistent solution found for tadpoles: \" \n"];
WriteString[file,      "Write(*,*) \"Negative absolute squared: ,"<>ToString[SquaredParametersTadpoles[[i,1]]]<>" \"   \n"];
WriteString[file,      "Write(*,*) \"Result: \","<>ToString[SquaredParametersTadpoles[[i,1]]]<>" \n"];
WriteString[file,     SPhenoForm[SquaredParametersTadpoles[[i,1]]]<>" = Abs("<> SPhenoForm[SquaredParametersTadpoles[[i,1]]]<>")  \n"];
WriteString[file,      SPhenoForm[SquaredParametersTadpoles[[i,2]]]<>" = "<>SPhenoForm[SquaredParametersTadpoles[[i,3]]] <>"* sqrt("<> SPhenoForm[SquaredParametersTadpoles[[i,1]]]<>") \n"];
WriteString[file,      "SignOfMuChanged = .True.  \n"];
WriteString[file,"End If \n"];
];
i++;];,


WriteString[file, "If (SolutionTadpoleNr.eq.1) Then \n"];
For[j=1,j<=Length[list],
For[i=1,i<=Length[list[[j]]],
Switch[Head[list[[j,i,1]]],
re,WriteString[file,FortranLineBreak["temporaryValue", SPhenoForm[list[[j,i,2]]],5]<>"\n"];
       WriteString[file,FortranLineBreak[SPhenoForm[list[[j,i,1,1]]]<>" = Cmplx(Real(temporaryValue",5]  <> ",dp),Aimag("<>SPhenoForm[list[[i,1,1]]]<>"),dp )\n"];,
im,WriteString[file,FortranLineBreak["temporaryValue", SPhenoForm[list[[j,i,2]]],5]<>"\n"];
      WriteString[file,FortranLineBreak[SPhenoForm[list[[j,i,1,1]]]<>" = Cmplx(real("<>SPhenoForm[list[[j,i,1,1]]]<>",dp),Real(temporaryValue",5]  <> ",dp),dp) \n"];,
_,WriteString[file,FortranLineBreak[SPhenoForm[list[[j,i,1]]], SPhenoForm[list[[j,i,2]]],5]  <> "\n"];
];
i++;];
For[i=1,i<=Length[list[[j]]],
If[FreeQ[SquaredParametersTadpoles,list[[j,i,1]]],
If[FreeQ[realVar,list[[j,i,1]]]===True,
WriteString[file, "If (Real("<>SPhenoForm[list[[j,i,1]] /.{re[x_]->re,im[x_]->x}]<>",dp).ne.Real("<>SPhenoForm[list[[j,i,1]]/.{re[x_]->re,im[x_]->x}]<>",dp)) Then \n "];,
WriteString[file, "If ("<>SPhenoForm[list[[j,i,1]]/.{re[x_]->re,im[x_]->x}]<>".ne."<>SPhenoForm[list[[j,i,1]]/.{re[x_]->re,im[x_]->x}]<>") Then \n "];
];
WriteString[file, "  Write(*,*) \"NaN appearing in solution of tadpole equations for "<>SPhenoForm[list[[j,i,1]]/.{re[x_]->re,im[x_]->x}] <>"\" \n "];
WriteString[file, "  Call TerminateProgram  \n "];
WriteString[file, "End If \n "];
];

If[FreeQ[realVar,list[[j,i,1]]/.{re[x_]->re,im[x_]->x, A_[b__Integer]->A}]===True && Head[list[[j,i,1]]]=!=re &&  Head[list[[j,i,1]]]=!=im,
WriteString[file, "If (Abs(AImag("<>SPhenoForm[list[[j,i,1]]]<>")).gt.1.0E-04_dp) Then \n "];
WriteString[file, "  Write(*,*) \"No real solution of tadpole equations for "<>SPhenoForm[list[[j,i,1]]/.{re[x_]->x,im[x_]->x}] <>"\" \n "];
WriteString[file, "  Call TerminateProgram  \n "];
WriteString[file, "End If \n "];
];

i++;];
If[j=!=Length[list],
WriteString[file, "Else If (SolutionTadpoleNr.eq."<>ToString[j+1]<>") Then \n"];
];
j++;];
WriteString[file, "End if \n"];

];
];

(*
WriteTadpoleSolution[file_]:=Block[{},
WriteString[file,"If (HighScaleModel.Eq.\"LOW\") Then \n"];
WriteTadpoleSolutionList[file,SubSolutionsTadpolesTreeLowScale,SeveralIndependentTadpoleSolutionsLowScale];
WriteString[file,"Else \n"];
WriteTadpoleSolutionList[file,SubSolutionsTadpolesTree,SeveralIndependentTadpoleSolutions];
WriteString[file,"End if \n"];
];

WriteTadpoleSolutionOnlyLow[file_]:=Block[{},
WriteTadpoleSolutionList[file,SubSolutionsTadpolesTreeLowScale,SeveralIndependentTadpoleSolutionsLowScale];
];

WriteTadpoleSolutionOnlyHigh[file_]:=Block[{},
WriteTadpoleSolutionList[file,SubSolutionsTadpolesTree,SeveralIndependentTadpoleSolutions];
];
*)
WriteTadpoleSolutionOnlyHigh[file_]:=Block[{},
(* WriteString[file,"Tad1Loop(:) = 0._dp \n"]; *)
MakeCall["SolveTadpoleEquations"<>SuffixRegime,listAllParametersAndVEVs,{},{StringReplace[ToString[Table[ZeroC,{SA`NrTadpoleEquations}]],{"{"->"(/ ","}"->" /)"}]},file];
];
WriteTadpoleSolutionOnlyLow[file_]:=WriteTadpoleSolutionOnlyHigh[file];
WriteTadpoleSolution[file_]:=WriteTadpoleSolutionOnlyHigh[file];

WriteShiftTadpoleSolution[file_]:=Block[{},
MakeCall["SolveTadpoleEquations"<>SuffixRegime,listAllParametersAndVEVs,{},{"Tad1Loop"},file];
];


WriteTadpoleSolutionList[file_,list_,sevsol_]:=Block[{i,j},
If[sevsol=!=True,
(* For[i=1,i<=Length[list],
Switch[Head[list[[i,1]]],
re,WriteString[file,FortranLineBreak[SPhenoForm[list[[i,1,1]]]<>" = Cmplx(Real(" <> SPhenoForm[list[[i,2]]],5]  <> ",dp),Aimag("<>SPhenoForm[list[[i,1,1]]]<>"),dp )\n"];,
im,WriteString[file,FortranLineBreak[SPhenoForm[list[[i,1,1]]]<>" = Cmplx(real("<>SPhenoForm[list[[i,1,1]]]<>",dp),Real(" <> SPhenoForm[list[[i,2]]],5]  <> ",dp),dp) \n"];,
_,WriteString[file,FortranLineBreak[SPhenoForm[list[[i,1]]]<>" = " <> SPhenoForm[list[[i,2]]],5]  <> "\n"];
];
i++;]; *)
For[i=1,i<=Length[list],
Switch[Head[list[[i,1]]],
re,WriteString[file,FortranLineBreak["temporaryValue", SPhenoForm[list[[i,2]]],5]<>"\n"];WriteString[file,FortranLineBreak[SPhenoForm[list[[i,1,1]]]<>" = Cmplx(Real(temporaryValue",5]  <> ",dp),Aimag("<>SPhenoForm[list[[i,1,1]]]<>"),dp )\n"];,
im,WriteString[file,FortranLineBreak["temporaryValue", SPhenoForm[list[[i,2]]],5]<>"\n"];WriteString[file,FortranLineBreak[SPhenoForm[list[[i,1,1]]]<>" = Cmplx(real("<>SPhenoForm[list[[i,1,1]]]<>",dp),Real(temporaryValue",5]  <> ",dp),dp) \n"];,
_,WriteString[file,FortranLineBreak[SPhenoForm[list[[i,1]]], SPhenoForm[list[[i,2]]],5]  <> "\n"];
];
i++;];

For[i=1,i<=Length[list],
If[FreeQ[SquaredParametersTadpoles,list[[i,1]]],
If[FreeQ[realVar,list[[i,1]]/.{re[x_]->re,im[x_]->x}]===True,
WriteString[file, "If (Real("<>SPhenoForm[list[[i,1]]/.{re[x_]->x,im[x_]->x}]<>",dp).ne.Real("<>SPhenoForm[list[[i,1]]/.{re[x_]->x,im[x_]->x}]<>",dp)) Then \n "];,
WriteString[file, "If ("<>SPhenoForm[list[[i,1]]/.{re[x_]->x,im[x_]->x}]<>".ne."<>SPhenoForm[list[[i,1]]/.{re[x_]->x,im[x_]->x}]<>") Then \n "];
];
WriteString[file, "  Write(*,*) \"NaN appearing in solution of tadpole equations for "<>SPhenoForm[list[[i,1]]/.{re[x_]->x,im[x_]->x}] <>"\" \n "];
WriteString[file, "  Call TerminateProgram  \n "];
WriteString[file, "End If \n "];
];
i++;];

For[i=1,i<=Length[SquaredParametersTadpoles],
If[FreeQ[Table[list[[j,1]],{j,1,Length[list]}],SquaredParametersTadpoles[[i,2]]]==False,
WriteString[file,"If ("<>ToString[SquaredParametersTadpoles[[i,1]]]<>".Lt.0._dp) Then \n"];
WriteString[file,      "Write(*,*) \"No consistent solution found for tadpoles: \" \n"];
WriteString[file,      "Write(*,*) \"Negative absolute squared: ,"<>ToString[SquaredParametersTadpoles[[i,1]]]<>" \"   \n"];
WriteString[file,      "Write(*,*) \"Result: \","<>ToString[SquaredParametersTadpoles[[i,1]]]<>" \n"];
WriteString[file,     SPhenoForm[SquaredParametersTadpoles[[i,1]]]<>" = Abs("<> SPhenoForm[SquaredParametersTadpoles[[i,1]]]<>")  \n"];
WriteString[file,      SPhenoForm[SquaredParametersTadpoles[[i,2]]]<>" = "<>SPhenoForm[SquaredParametersTadpoles[[i,3]]] <>"* sqrt("<> SPhenoForm[SquaredParametersTadpoles[[i,1]]]<>") \n"];
WriteString[file,      "SignOfMuChanged = .True.  \n"];
WriteString[file,"End If \n"];
];
i++;];,

WriteString[file, "If (SolutionTadpoleNr.eq.1) Then \n"];
For[j=1,j<=Length[list],
For[i=1,i<=Length[list[[j]]],
(* Switch[Head[list[[j,i,1]]],
re,WriteString[file,FortranLineBreak[SPhenoForm[list[[j,i,1,1]]]<>" = Cmplx(Real(" <> SPhenoForm[list[[j,i,2]]],5]  <> ",dp),Aimag("<>SPhenoForm[list[[j,i,1,1]]]<>"),dp )\n"];,
im,WriteString[file,FortranLineBreak[SPhenoForm[list[[j,i,1,1]]]<>" = Cmplx(Real("<>SPhenoForm[list[[j,i,1,1]]]<>",dp),Real(" <> SPhenoForm[list[[j,i,2]]],5]  <> ",dp),dp) \n"];,
_,WriteString[file,FortranLineBreak[SPhenoForm[list[[j,i,1]]], SPhenoForm[list[[j,i,2]]],5]  <> "\n"];
]; *)
Switch[Head[list[[j,i,1]]],
re,WriteString[file,FortranLineBreak["temporaryValue", SPhenoForm[list[[j,i,2]]],5]<>"\n"];WriteString[file,FortranLineBreak[SPhenoForm[list[[j,i,1,1]]]<>" = Cmplx(Real(temporaryValue",5]  <> ",dp),Aimag("<>SPhenoForm[list[[j,i,1,1]]]<>"),dp )\n"];,
im,WriteString[file,FortranLineBreak["temporaryValue", SPhenoForm[list[[j,i,2]]],5]<>"\n"];WriteString[file,FortranLineBreak[SPhenoForm[list[[j,i,1,1]]]<>" = Cmplx(real("<>SPhenoForm[list[[j,i,1,1]]]<>",dp),Real(temporaryValue",5]  <> ",dp),dp) \n"];,
_,WriteString[file,FortranLineBreak[SPhenoForm[list[[j,i,1]]], SPhenoForm[list[[j,i,2]]],5]  <> "\n"];
];
i++;];
For[i=1,i<=Length[list[[j]]],
If[FreeQ[SquaredParametersTadpoles,list[[j,i,1]]],
If[FreeQ[realVar,list[[j,i,1]]]===True,
WriteString[file, "If (Real("<>SPhenoForm[list[[j,i,1]] /. {re[x_]->x,im[x_]->x}]<>",dp).ne.Real("<>SPhenoForm[list[[j,i,1]]/. {re[x_]->x,im[x_]->x}]<>",dp)) Then \n "];,
WriteString[file, "If ("<>SPhenoForm[list[[j,i,1]]]<>".ne."<>SPhenoForm[list[[j,i,1]]]<>") Then \n "];
];
WriteString[file, "  Write(*,*) \"NaN appearing in solution of tadpole equations for "<>SPhenoForm[list[[j,i,1]]/. {re[x_]->x,im[x_]->x}] <>"\" \n "];
WriteString[file, "  Call TerminateProgram  \n "];
WriteString[file, "End If \n "];
];
i++;];
If[j=!=Length[list[[j]]],
WriteString[file, "Else If (SolutionTadpoleNr.eq."<>ToString[j+1]<>") Then \n"];
];
j++;];
WriteString[file, "End if \n"];
];


];

WriteTadpoleSolutionZero[file_]:=Block[{},
WriteString[file,"If (HighScaleModel.Eq.\"LOW\") Then \n"];
WriteString[file,"\n ! Tadpole equations used for GUT scale input \n \n"];
WriteTadpoleSolutionZeroList[file,SubSolutionsTadpolesTreeLowScale,SeveralIndependentTadpoleSolutionsLowScale];
WriteString[file,"Else \n"];
WriteString[file,"\n ! Tadpole equations used for SUSY scale input \n \n"];
WriteTadpoleSolutionZeroList[file,SubSolutionsTadpolesTree,SeveralIndependentTadpoleSolutions];
WriteString[file,"End if \n"];
];


WriteTadpoleSolutionZeroOnlyHigh[file_]:=Block[{i},
WriteTadpoleSolutionZeroList[file,SubSolutionsTadpolesTree,SeveralIndependentTadpoleSolutions];
 ];

WriteTadpoleSolutionZeroOnlyLow[file_]:=Block[{i},
WriteTadpoleSolutionZeroList[file,SubSolutionsTadpolesTreeLowScale,SeveralIndependentTadpoleSolutionsLowScale];
 ];

WriteTadpoleSolutionZeroList[file_,list_,sevsol_]:=Block[{i,j},
If[sevsol=!=True,
For[i=1,i<=Length[list],
If[FreeQ[NewParametersFromTadpoles,list[[i,1]]],
If[Head[list[[i,1]]]===im || Head[list[[i,1]]]===re,
WriteString[file,FortranLineBreak[SPhenoForm[list[[i,1,1]]]<>" = 0._dp \n"]];,
WriteString[file,FortranLineBreak[SPhenoForm[list[[i,1]]]<>" = 0._dp \n"]];
];
];
i++;];,

For[j=1,j<=Length[list],
For[i=1,i<=Length[list[[j,i]]],
If[FreeQ[NewParametersFromTadpoles,list[[j,i,1]]],
If[Head[list[[i,j,1]]]===im || Head[list[[i,j,1]]]===re,
WriteString[file,FortranLineBreak[SPhenoForm[list[[j,i,1,1]]]<>" = 0._dp \n"]];,
WriteString[file,FortranLineBreak[SPhenoForm[list[[j,i,1]]]<>" = 0._dp \n"]];
];
];
i++;];
j++;];
];
];


SetGoldstoneMasses[file_]:=Block[{i},
For[i=1,i<=Length[GoldstoneGhost],
If[Head[GoldstoneGhost[[i,2]]]===Symbol,
WriteString[file,SPhenoMass[GoldstoneGhost[[i,2]],1]<>"="<>SPhenoMass[GoldstoneGhost[[i,1]],i] <>"\n" ];
WriteString[file,SPhenoMassSq[GoldstoneGhost[[i,2]],1]<>"="<>SPhenoMassSq[GoldstoneGhost[[i,1]],i] <>"\n" ];,WriteString[file,SPhenoMass[GoldstoneGhost[[i,2,0]],GoldstoneGhost[[i,2,1,1]]]<>"="<>SPhenoMass[GoldstoneGhost[[i,1]],i] <>"\n" ];
WriteString[file,SPhenoMassSq[GoldstoneGhost[[i,2,0]],GoldstoneGhost[[i,2,1,1]]]<>"="<>SPhenoMassSq[GoldstoneGhost[[i,1]],i] <>"\n" ];
];
i++;];
];

GenerateSPhenoTadpoleInformation:=Block[{},
Print["--------------------------------------"];
Print["Writing Routines for Tadpole Equations "];
Print["--------------------------------------"];

sphenoTad=OpenWrite[ToFileName[$sarahCurrentSPhenoDir,"TadpoleEquations_"<>ModelName<>".f90"]];

If[IntermediateScale =!=True,
WriteCopyRight[sphenoTad];

WriteString[sphenoTad,"Module Tadpoles_"<>ModelName<>" \n \n"];
WriteString[sphenoTad,"Use Model_Data_"<>ModelName<>" \n"];
WriteString[sphenoTad,"Use SUSYMasses_"<>ModelName<>" \n"];
WriteString[sphenoTad,"Use RGEs_"<>ModelName<>" \n"];
WriteString[sphenoTad,"Use Control \n\n"];
WriteString[sphenoTad,"Use Mathematics \n\n"];

WriteString[sphenoTad,"Contains \n\n\n"];

];

WriteSolveTadpoleEquations;
WriteCalculateTadpoles;
If[NumericalSolutionTadpoleEquations===True,
WriteFunctionsForBroydn;
];

If[IncludeFineTuning===True,
WriteCalculateTadpolesVEVsSM;

WriteSolveTadpoleEquationsForVEVsSM;
WriteFunctionsForBroydnForVEVsSM;

WriteSolveTadpoleEquationsForVEVs;
WriteFunctionsForBroydnForVEVs;
];


If[IntermediateScale =!= True && Head[RegimeNr]===Integer,
WriteString[sphenoTad,"\n\n\n\n"];
currentRegime = "Regime-"<>ToString[RegimeNr];
For[i=1,i<RegimeNr,
readRegime = "Regime-"<>ToString[i];
AppendSourceCode[ToFileName[StringReplace[$sarahCurrentSPhenoDir,{currentRegime->readRegime,ToString[EigenstateName]->ToString[ListOfRegimeEigenstates[[i]]]}],"TadpoleEquations_"<>ModelName<>".f90"],sphenoTad];
i++;];
];

If[IntermediateScale =!=True,
WriteString[sphenoTad,"End Module Tadpoles_"<>ModelName<>" \n \n"];
];


Close[sphenoTad];

];

WriteCalculateTadpoles :=Block[{i},
Print["Writing tadpole equations "];
MakeSubroutineTitle["CalculateTadpoles"<>SuffixRegime,listAllParametersAndVEVs,{},{"Tad1Loop","TadpoleValues"},sphenoTad];
MakeVariableList[listAllParametersAndVEVs,",Intent(in)",sphenoTad];
WriteString[sphenoTad, "Complex(dp), Intent(in) :: Tad1Loop("<>ToString[SA`NrTadpoleEquations]<>")\n\n"];
WriteString[sphenoTad, "Real(dp), Intent(out) :: TadpoleValues("<>ToString[SA`NrTadpoleEquations]<>")\n\n"];

For[i=1,i<=Length[EquLoop],
WriteString[sphenoTad,FortranLineBreak["TadpoleValues("<>ToString[i]<>") = Real("<>SPhenoForm[EquLoop[[i,1]]]<>",dp) \n"]];
i++;];
WriteString[sphenoTad,"End Subroutine CalculateTadpoles"<>SuffixRegime<>" \n\n"];
];

WriteCalculateTadpolesVEVsSM :=Block[{i},
Print["Writing tadpole equations for SM VEVs"];
MakeSubroutineTitle["CalculateTadpolesVEVsSM",listAllParametersAndVEVs,{},{"Tad1Loop","TadpoleValues"},sphenoTad];
MakeVariableList[listAllParametersAndVEVs,",Intent(in)",sphenoTad];
WriteString[sphenoTad, "Complex(dp), Intent(in) :: Tad1Loop("<>ToString[SA`NrTadpoleEquations]<>")\n\n"];
WriteString[sphenoTad, "Real(dp), Intent(out) :: TadpoleValues(2)\n\n"];

For[i=1,i<=2,
WriteString[sphenoTad,FortranLineBreak["TadpoleValues("<>ToString[i]<>") = Real("<>SPhenoForm[EquLoop[[i,1]]]<>",dp) \n"]];
i++;];
WriteString[sphenoTad,"End Subroutine CalculateTadpolesVEVsSM \n\n"];
];


WriteFunctionsForBroydn:=Block[{i,temp, tempHigh={},tempLow={}},
WriteString[sphenoTad,"FUNCTION FuncTad_"<>ModelName<>SuffixRegime<>"(x) \n"];
WriteString[sphenoTad,"USE Control \n"];
WriteString[sphenoTad,"IMPLICIT NONE \n"];
WriteString[sphenoTad,"REAL(dp), DIMENSION(:), INTENT(IN) :: x \n"];
WriteString[sphenoTad,"REAL(dp), DIMENSION(size(x)) :: FuncTad_"<>ModelName<>SuffixRegime<>"  \n \n"];
MakeVariableList[listAllParametersAndVEVs,"",sphenoTad];


MakeCall["GToParameters"<>ToString[ numberAllwithVEVs]<>SuffixRegime,listAllParametersAndVEVs,{"gForTadpoles"<>SuffixRegime},{},sphenoTad];

WriteString[sphenoTad,"! Calculate values of tadpoles \n"];
WriteString[sphenoTad,"If (HighScaleModel.Eq.\"LOW\") Then \n \n"];
WriteString[sphenoTad,"! SUSY scale input  \n"];
For[i=1,i<=Length[ParametersToSolveTadpoles],
Switch[Head[ParametersToSolveTadpolesLowScaleInput[[i]]],
re,WriteString[sphenoTad,SPhenoForm[ParametersToSolveTadpolesLowScaleInput[[i,1]]]<>" = Complex(x("<>ToString[i]<>"), Aimag("<>SPhenoForm[ParametersToSolveTadpolesLowScaleInput[[i,1]]]<>"),dp) \n"];,
im,WriteString[sphenoTad,SPhenoForm[ParametersToSolveTadpolesLowScaleInput[[i,1]]]<>" = Complex(Real("<>SPhenoForm[ParametersToSolveTadpolesLowScaleInput[[i,1]]]<>",dp),x("<>ToString[i]<>"),dp) \n"];,
_,WriteString[sphenoTad,SPhenoForm[ParametersToSolveTadpolesLowScaleInput[[i]]]<>" = x("<>ToString[i]<>") \n"];
];
i++;];
WriteString[sphenoTad,"\n Else \n \n"];
WriteString[sphenoTad,"! GUT scale input \n"];
For[i=1,i<=Length[ParametersToSolveTadpoles],
Switch[Head[ParametersToSolveTadpoles[[i]]],
re,WriteString[sphenoTad,SPhenoForm[ParametersToSolveTadpoles[[i,1]]]<>" = Complex(x("<>ToString[i]<>"), Aimag("<>SPhenoForm[ParametersToSolveTadpoles[[i,1]]]<>"),dp) \n"];,
im,WriteString[sphenoTad,SPhenoForm[ParametersToSolveTadpoles[[i,1]]]<>" = Complex(Real("<>SPhenoForm[ParametersToSolveTadpoles[[i,1]]]<>",dp),x("<>ToString[i]<>"),dp) \n"];,
_,WriteString[sphenoTad,SPhenoForm[ParametersToSolveTadpoles[[i]]]<>" = x("<>ToString[i]<>") \n"];
];
i++;];
WriteString[sphenoTad,"End if \n \n \n"];

MakeCall["CalculateTadpoles"<>SuffixRegime,listAllParametersAndVEVs,{},{"tForTadpoles"<>SuffixRegime,"FuncTad_"<>ModelName<>SuffixRegime},sphenoTad];

WriteString[sphenoTad,"END FUNCTION FuncTad_"<>ModelName<>SuffixRegime<>" \n\n"];
];

WriteSolveTadpoleEquations:=Block[{},
Print["Writing solver for tadpole equations "];

MakeSubroutineTitle["SolveTadpoleEquations"<>SuffixRegime,listAllParametersAndVEVs,{},{"Tad1Loop"},sphenoTad];
WriteString[sphenoTad, "Implicit None\n"];
MakeVariableList[listAllParametersAndVEVs,",Intent(inout)",sphenoTad];
MakeVariableList[NewParametersFromTadpoles,"",sphenoTad];
WriteString[sphenoTad, "Complex(dp), Intent(in) :: Tad1Loop("<>ToString[SA`NrTadpoleEquations]<>")\n\n"];
WriteString[sphenoTad,"! For numerical routines \n"];
WriteString[sphenoTad,"Real(dp) :: gC("<>ToString[numberAllwithVEVs]<>")\n"];
WriteString[sphenoTad,"logical :: broycheck \n"];
WriteString[sphenoTad, "Real(dp) :: broyx("<>ToString[SA`NrTadpoleEquations]<>")\n\n"];

If[NumericalSolutionTadpoleEquations=!=True,
For[i=1,i<=Length[NewParametersFromTadpoles],WriteString[sphenoTad,SPhenoForm[NewParametersFromTadpoles[[i]]] <>" =  0._dp \n"];i++];

WriteString[sphenoTad,"If (HighScaleModel.Eq.\"LOW\") Then \n"];
WriteShiftTadpoleSolutionList[sphenoTad,SubSolutionsTadpolesLoopLowScale,SeveralIndependentTadpoleSolutionsLowScale];
WriteString[sphenoTad,"Else \n"];
WriteShiftTadpoleSolutionList[sphenoTad,SubSolutionsTadpolesLoop,SeveralIndependentTadpoleSolutions];
WriteString[sphenoTad,"End if \n"];,

(*
WriteString[sphenoTad,"\n \n \n ! ------------------------------------- \n"];
WriteString[sphenoTad,"! Some test code for numerical routines \n"];
WriteString[sphenoTad,"! ------------------------------------- \n \n"];
*)
WriteString[sphenoTad,"! Set starting values  \n"];
WriteString[sphenoTad,"If (HighScaleModel.Eq.\"LOW\") Then \n"];
WriteString[sphenoTad,"! SUSY scale input  \n"];
For[i=1,i<=Length[ParametersToSolveTadpoles],
WriteString[sphenoTad,"broyx("<>ToString[i]<>")  = "<>SPhenoForm[ParametersToSolveTadpolesLowScaleInput[[i]]/. InitializationTadpoleParametersLowScaleInput /. InitializationTadpoleParameters]<>"  \n"];
i++;];
WriteString[sphenoTad,"\n Else \n \n"];
WriteString[sphenoTad,"! GUT scale input \n"];
For[i=1,i<=Length[ParametersToSolveTadpoles],
WriteString[sphenoTad,"broyx("<>ToString[i]<>")  = "<>SPhenoForm[ParametersToSolveTadpoles[[i]]/. InitializationTadpoleParameters]<>"  \n"];
i++;];
WriteString[sphenoTad,"End if \n \n \n"];
WriteString[sphenoTad,"! Save parameters and 1-loop tadpoles in global variables to have access to them in the numerical routines \n"];
MakeCall["ParametersToG"<>ToString[ numberAllwithVEVs]<>SuffixRegime,listAllParametersAndVEVs,{},{"gForTadpoles"<>SuffixRegime},sphenoTad];
WriteString[sphenoTad,"tForTadpoles"<>SuffixRegime<> " = Tad1Loop \n\n"];
WriteString[sphenoTad,"Call broydn(broyx,broycheck,FuncTad_"<>ModelName<>SuffixRegime<>") \n \n"];
 WriteString[sphenoTad,"! Write(*,*) \"Result broydn \",broyx \n"]; 


WriteString[sphenoTad,"! Use results  \n"];
WriteString[sphenoTad,"If (HighScaleModel.Eq.\"LOW\") Then \n"];
WriteString[sphenoTad,"! SUSY scale input  \n"];
For[i=1,i<=Length[ParametersToSolveTadpoles],
WriteString[sphenoTad,SPhenoForm[ParametersToSolveTadpolesLowScaleInput[[i]]]<>" = broyx("<>ToString[i]<>")    \n"];
i++;];
WriteString[sphenoTad,"\n Else \n \n"];
WriteString[sphenoTad,"! GUT scale input \n"];
For[i=1,i<=Length[ParametersToSolveTadpoles],
WriteString[sphenoTad,SPhenoForm[ParametersToSolveTadpoles[[i]]]<>" = broyx("<>ToString[i]<>") \n"];
i++;];
WriteString[sphenoTad,"End if \n \n \n"];


];

WriteString[sphenoTad,"End Subroutine SolveTadpoleEquations"<>SuffixRegime<>"\n\n"];
];


WriteSolveTadpoleEquationsForVEVsSM:=Block[{i},
Print["Writing solver for tadpole equations to get SM VEVs"];

MakeSubroutineTitle["SolveTadpoleEquationsVEVsSM",listAllParametersAndVEVs,{},{"Tad1Loop"},sphenoTad];
WriteString[sphenoTad, "Implicit None\n"];
MakeVariableList[listAllParametersAndVEVs,",Intent(inout)",sphenoTad];
MakeVariableList[NewParametersFromTadpoles,"",sphenoTad];

WriteString[sphenoTad, "Complex(dp), Intent(in) :: Tad1Loop("<>ToString[SA`NrTadpoleEquations]<>")\n\n"];
WriteString[sphenoTad,"! For numerical routines \n"];
WriteString[sphenoTad,"Real(dp) :: gC("<>ToString[numberAllwithVEVs]<>")\n"];
WriteString[sphenoTad,"logical :: broycheck \n"];
(*
WriteString[sphenoTad, "Real(dp) :: broyx("<>ToString[SA`NrTadpoleEquations]<>")\n\n"];
*)

WriteString[sphenoTad, "Real(dp) :: broyx(2)\n\n"];


WriteString[sphenoTad,"! Set starting values  \n"];

For[i=1,i<=Length[listVEVs],
If[listVEVs[[i]]===VEVSM1 || listVEVs[[i]]===VEVSM2,
WriteString[sphenoTad,"broyx("<>ToString[i]<>")  = "<>SPhenoForm[listVEVs[[i]]]<>"MZ \n"];
];
i++;];

WriteString[sphenoTad,"! Save parameters and 1-loop tadpoles in global variables to have access to them in the numerical routines \n"];
MakeCall["ParametersToG"<>ToString[ numberAllwithVEVs]<>SuffixRegime,listAllParametersAndVEVs,{},{"gForTadpoles"<>SuffixRegime},sphenoTad];
WriteString[sphenoTad,"tForTadpoles"<>SuffixRegime<> " = Tad1Loop \n\n"];
WriteString[sphenoTad,"Call broydn(broyx,broycheck,FuncTad_VEVsSM_"<>ModelName<>") \n \n"];
 WriteString[sphenoTad,"! Write(*,*) \"Result broydn \",broyx \n"]; 


WriteString[sphenoTad,"! Use results  \n"];
For[i=1,i<=Length[listVEVs],
If[listVEVs[[i]]===VEVSM1 || listVEVs[[i]]===VEVSM2,
WriteString[sphenoTad,SPhenoForm[listVEVs[[i]]]<>" = broyx("<>ToString[i]<>")    \n"];
];
i++;];


WriteString[sphenoTad,"End Subroutine SolveTadpoleEquationsVEVsSM \n\n"];
];

WriteSolveTadpoleEquationsForVEVs:=Block[{i},
Print["Writing solver for tadpole equations to get all VEVs"];

MakeSubroutineTitle["SolveTadpoleEquationsVEVs",listAllParametersAndVEVs,{},{"Tad1Loop"},sphenoTad];
WriteString[sphenoTad, "Implicit None\n"];
MakeVariableList[listAllParametersAndVEVs,",Intent(inout)",sphenoTad];
MakeVariableList[NewParametersFromTadpoles,"",sphenoTad];

WriteString[sphenoTad, "Complex(dp), Intent(in) :: Tad1Loop("<>ToString[SA`NrTadpoleEquations]<>")\n\n"];
WriteString[sphenoTad,"! For numerical routines \n"];
WriteString[sphenoTad,"Real(dp) :: gC("<>ToString[numberAllwithVEVs]<>")\n"];
WriteString[sphenoTad,"logical :: broycheck \n"];
WriteString[sphenoTad, "Real(dp) :: broyx("<>ToString[SA`NrTadpoleEquations]<>")\n\n"];



WriteString[sphenoTad,"! Set starting values  \n"];

For[i=1,i<=Length[listVEVs],
WriteString[sphenoTad,"broyx("<>ToString[i]<>")  = "<>SPhenoForm[listVEVs[[i]]]<>"MZ \n"];
i++;];

WriteString[sphenoTad,"! Save parameters and 1-loop tadpoles in global variables to have access to them in the numerical routines \n"];
MakeCall["ParametersToG"<>ToString[ numberAllwithVEVs]<>SuffixRegime,listAllParametersAndVEVs,{},{"gForTadpoles"<>SuffixRegime},sphenoTad];
WriteString[sphenoTad,"tForTadpoles"<>SuffixRegime<> " = Tad1Loop \n\n"];
WriteString[sphenoTad,"Call broydn(broyx,broycheck,FuncTad_VEVs_"<>ModelName<>") \n \n"];
 WriteString[sphenoTad,"! Write(*,*) \"Result broydn \",broyx \n"]; 


WriteString[sphenoTad,"! Use results  \n"];
For[i=1,i<=Length[listVEVs],
WriteString[sphenoTad,SPhenoForm[listVEVs[[i]]]<>" = broyx("<>ToString[i]<>")    \n"];
i++;];


WriteString[sphenoTad,"End Subroutine SolveTadpoleEquationsVEVs \n\n"];
];



WriteFunctionsForBroydnForVEVsSM:=Block[{i,temp, tempHigh={},tempLow={}},
WriteString[sphenoTad,"FUNCTION FuncTad_VEVsSM_"<>ModelName<>"(x) \n"];
WriteString[sphenoTad,"USE Control \n"];
WriteString[sphenoTad,"IMPLICIT NONE \n"];
WriteString[sphenoTad,"REAL(dp), DIMENSION(:), INTENT(IN) :: x \n"];
WriteString[sphenoTad,"REAL(dp), DIMENSION(size(x)) :: FuncTad_VEVsSM_"<>ModelName<>"  \n \n"];
MakeVariableList[listAllParametersAndVEVs,"",sphenoTad];


MakeCall["GToParameters"<>ToString[ numberAllwithVEVs]<>SuffixRegime,listAllParametersAndVEVs,{"gForTadpoles"<>SuffixRegime},{},sphenoTad];

WriteString[sphenoTad,"! Calculate values of tadpoles \n"];
For[i=1,i<=Length[listVEVs],
If[listVEVs[[i]]===VEVSM1 || listVEVs[[i]]===VEVSM2,
WriteString[sphenoTad,SPhenoForm[listVEVs[[i]]]<>" = x("<>ToString[i]<>") \n"];
];
i++;];

MakeCall["CalculateTadpolesVEVsSM",listAllParametersAndVEVs,{},{"tForTadpoles"<>SuffixRegime,"FuncTad_VEVsSM_"<>ModelName},sphenoTad];

WriteString[sphenoTad,"END FUNCTION FuncTad_VEVsSM_"<>ModelName<>" \n\n"];
];

WriteFunctionsForBroydnForVEVs:=Block[{i,temp, tempHigh={},tempLow={}},
WriteString[sphenoTad,"FUNCTION FuncTad_VEVs_"<>ModelName<>"(x) \n"];
WriteString[sphenoTad,"USE Control \n"];
WriteString[sphenoTad,"IMPLICIT NONE \n"];
WriteString[sphenoTad,"REAL(dp), DIMENSION(:), INTENT(IN) :: x \n"];
WriteString[sphenoTad,"REAL(dp), DIMENSION(size(x)) :: FuncTad_VEVs_"<>ModelName<>"  \n \n"];
MakeVariableList[listAllParametersAndVEVs,"",sphenoTad];


MakeCall["GToParameters"<>ToString[ numberAllwithVEVs]<>SuffixRegime,listAllParametersAndVEVs,{"gForTadpoles"<>SuffixRegime},{},sphenoTad];

WriteString[sphenoTad,"! Calculate values of tadpoles \n"];
For[i=1,i<=Length[listVEVs],
WriteString[sphenoTad,SPhenoForm[listVEVs[[i]]]<>" = x("<>ToString[i]<>") \n"];
i++;];

MakeCall["CalculateTadpoles",listAllParametersAndVEVs,{},{"tForTadpoles"<>SuffixRegime,"FuncTad_VEVs_"<>ModelName},sphenoTad];

WriteString[sphenoTad,"END FUNCTION FuncTad_VEVs_"<>ModelName<>" \n\n"];
];


