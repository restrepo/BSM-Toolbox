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



(* --------- Calc Vertices -----------------*)

Options[Vertex]={Eigenstates ->CurrentStates,  UseDependences-> False, Lorentz->False};

Vertex[x_,opt___ ]:=CalcVertex[x,Eigenstates/.{opt}/.Options[Vertex], UseDependences/.{opt}/.Options[Vertex],  Lorentz/.{opt}/.Options[Vertex]];



CalcVertex[parts_, Eigenstates_, UseDependences_, Lorentz_] := Block[{k,l,i,j,temp,temp2,subInvMatrices},

partCode=0;
vfactor=1;

Particles[Current]=Particles[Eigenstates];
LagRe=LagRedefinition[Eigenstates];

SA`CurrentStates=Eigenstates;


For[i=1,i<=Length[parts],
Switch[getType[parts[[i]]],
A,partCode+=10000;,
F,partCode+=1000;,
S,partCode+=100;,
V,partCode+=10;,
G,partCode+=1;,
_,Message[Vertices::UnknownParticle,parts[[i]]];
];
i++;
];

temp = parts;
teilchen=Table[temp[[i]]/.{a_[{_}]->a, a_[{_,_}]->a},{i,Length[parts]}];
subIndInsert={};



For[i=1,i<=Length[parts],
ind=Cases[RE[parts[[i]]],List_];
If[Length[ind]>0,
ind=ind[[1]];
indices = getIndizes[parts[[i]]] /. subGC[i] /. subIndFinal[i,i];
For[j=1,j<=Length[ind],
subIndInsert = Join[subIndInsert,{indices[[j]]->ind[[j]]}];
j++;];
];
i++;];

finalPart={};

For[i=1,i<=Length[parts],
If[(Head[parts[[i]]]===conj) || (Head[parts[[i]]]===bar),
If[Head[parts[[i]]]===conj,
finalPart =Join[finalPart,{conj[getFull[getBlank[parts[[i]]]] /.subGC[i] /. subIndFinal[i,i] /.subIndInsert]}];,
finalPart =Join[finalPart,{bar[getFull[getBlank[parts[[i]]]] /.subGC[i] /. subIndFinal[i,i] /.subIndInsert]}];
];,
finalPart =Join[finalPart,{getFull[getBlank[parts[[i]]]] /.subGC[i] /. subIndFinal[i,i] /.subIndInsert}];
];
i++;];




BosInv = False;
GauginoBoson=False;
MajoranaInv=0;
PartInv = {};
Result = {};
BosonFermion=False;

Switch[partCode,
(* FF *)
2000,
	Lag = LagFFS[Eigenstates];
	If[FreeQ[diracFermions[Eigenstates],getBlank[teilchen[[1]]]]==False && FreeQ[diracFermions[Eigenstates],getBlank[teilchen[[2]]]]==False,
	PartInv={{},{}};
         For[i=1,i<=2,
           If[FermionQ[teilchen[[i]]]==False,
	PartInv[[1]]=Join[PartInv[[1]],{teilchen[[i]]}];
	PartInv[[2]]=Join[PartInv[[2]],{teilchen[[i]]}];,
	If[Head[teilchen[[i]]]===bar,
	ferm=conj[Reverse[RE[teilchen[[i]]]/.diracSub[Eigenstates]]];,
	ferm=teilchen[[i]]/.diracSub[Eigenstates];
	];
	PartInv[[1]] = Join[PartInv[[1]],{ferm[[1]]}];
	PartInv[[2]] = Join[PartInv[[2]],{ferm[[2]]}];
	];
	 i++;]; 
	LorentzNeeded=True;
	lorStructure = {PL,PR};,
	PartInv = {teilchen};
	lorStructure = {1};
	LorentzNeeded=False;
	];
	subVacuum = vacuumS;,

(* SS *)
200,
	Lag = LagSSSS[Eigenstates];
	PartInv = {teilchen};
	LorentzNeeded=False;
	lorStructure = {1};
	subVacuum = vacuumS;,

(* VV *)
20,
	Lag = LagSV[Eigenstates];
	PartInv = {teilchen};
	lorStructure = {1};
	LorentzNeeded=True;
	vfactor=-1;
	subVacuum = vacuumS;,

(* FFS *)
2100,
	If[FreeQ[diracFermions[Eigenstates],getBlank[teilchen[[1]]]]==False || FreeQ[diracFermions[Eigenstates],getBlank[teilchen[[2]]]]==False,
	PartInv={{},{}};
         For[i=1,i<=3,
           If[FermionQ[teilchen[[i]]]==False,
	PartInv[[1]]=Join[PartInv[[1]],{teilchen[[i]]}];
	PartInv[[2]]=Join[PartInv[[2]],{teilchen[[i]]}];,
	If[Head[teilchen[[i]]]===bar,
	ferm=conj[Reverse[RE[teilchen[[i]]]/.diracSub[Eigenstates]]];,
	ferm=teilchen[[i]]/.diracSub[Eigenstates];
	];
	PartInv[[1]] = Join[PartInv[[1]],{ferm[[1]]}];
	PartInv[[2]] = Join[PartInv[[2]],{ferm[[2]]}]; 
	];
	 i++;];  
	lorStructure={PL,PR};,
	PartInv = {teilchen};
	lorStructure = {1};
	];	
	Lag = LagFFS[Eigenstates];
	vfactor=I;
	LorentzNeeded=False;
	subVacuum = vacuumS;,

(* FFV *)
2010,
	If[FreeQ[diracFermions[Eigenstates],getBlank[teilchen[[1]]]]==False || FreeQ[diracFermions[Eigenstates],getBlank[teilchen[[2]]]]==False,
	FermFirst=True;
	PartInv={{},{}};
         For[i=1,i<=3,
	   If[FermionQ[teilchen[[i]]]==False,
	PartInv[[1]]=Join[PartInv[[1]],{teilchen[[i]]}];
	PartInv[[2]]=Join[PartInv[[2]],{teilchen[[i]]}];,
	If[Head[teilchen[[i]]]===bar,
	ferm=conj[Reverse[RE[teilchen[[i]]]/.diracSub[Eigenstates]]];,
	ferm=teilchen[[i]]/.diracSub[Eigenstates];
	];
	If[FermFirst==True,
	PartInv[[1]] = Join[PartInv[[1]],{ferm[[2]]}];
	PartInv[[2]] = Join[PartInv[[2]],{ferm[[1]]}];
	FermFirst=False;,
	PartInv[[1]] = Join[PartInv[[1]],{ferm[[1]]}];
	PartInv[[2]] = Join[PartInv[[2]],{ferm[[2]]}];
	];
	];
	 i++;];
	lorStructure={PL,PR};,
	lorStructure={1};
	PartInv={teilchen};
	];
	Lag = LagFFV[Eigenstates];
	LorentzNeeded=True;
	subVacuum = {};,

(* SSV *)
210,  
	Lag = LagSV[Eigenstates];
	PartInv = {teilchen};
	lorStructure = {1};
	LorentzNeeded=True;
	subVacuum = vacuumV;,
 
(* SVV *)
120,
	Lag = LagSV[Eigenstates];
	PartInv = {teilchen};
	lorStructure = {1};
	LorentzNeeded=True;
	vfactor=I;
	subVacuum=vacuumS;,

(* SSS *)
300,
	Lag = LagSSSS[Eigenstates];
	PartInv = {teilchen};
	lorStructure = {1};
	LorentzNeeded=False;
	vfactor=I;
	subVacuum = vacuumS;,

(* SSA *)
10200,
	Lag = LagSSA[Eigenstates];
	PartInv = {teilchen};
	lorStructure = {1};
	LorentzNeeded=False;
	vfactor=I;
	subVacuum = vacuumS;,

(* SSSS *)
400,
	Lag = LagSSSS[Eigenstates];
	PartInv = {teilchen};
	lorStructure = {1};
	LorentzNeeded=False;
	vfactor=I;
	subVacuum = vacuumS;,

(* SSVV *)
220,
	Lag = LagSV[Eigenstates];
	PartInv = {teilchen};
	lorStructure = {1};
	LorentzNeeded=True;
	vfactor=I;
	subVacuum = {};,

(* VVV *)
30,
	Lag = LagVVV[Eigenstates];
	PartInv = {teilchen};
	lorStructure = {1};
	LorentzNeeded=True;
	subVacuum = {};,

(* VVVV *)
40,
	Lag = LagVVVV[Eigenstates];
	PartInv = {teilchen};
	lorStructure = { 1};
	LorentzNeeded=True;
	vfactor=I;
	subVacuum = {};,

(* GGV *)
12,
	Lag = LagGGV[Eigenstates];
	PartInv = {teilchen};
	lorStructure = {1};
	LorentzNeeded=True;
	vfactor=1; 
	subVacuum = {};,

(* GGS *)
102,
	Lag = LagGGS[Eigenstates];
	PartInv = {teilchen};
	lorStructure = {1};
	LorentzNeeded=False;
	vfactor=I;
	subVacuum = {};,

(* FFFF *)
4000,
	Lag = LagFFFF[Eigenstates];
	Fermion=teilchen;
	Fermion = Fermion  /. bar[x_] -> invO[x]/. diracSub[Eigenstates] /. invO[{x_,y_}]->conj[{y,x}];

	PartInv = Join[PartInv,{{Fermion[[1,1]],Fermion[[2,1]],Fermion[[3,1]],Fermion[[4,1]]}}];
	PartInv = Join[PartInv,{{Fermion[[1,1]],Fermion[[2,1]],Fermion[[3,2]],Fermion[[4,2]]}}];
	PartInv = Join[PartInv,{{Fermion[[1,2]],Fermion[[2,2]],Fermion[[3,1]],Fermion[[4,1]]}}];
	PartInv = Join[PartInv,{{Fermion[[1,2]],Fermion[[2,2]],Fermion[[3,2]],Fermion[[4,2]]}}];

	PartInv = Join[PartInv,{{Fermion[[1,2]],Fermion[[2,1]],Fermion[[3,2]],Fermion[[4,1]]}}];
	PartInv = Join[PartInv,{{Fermion[[1,1]],Fermion[[2,2]],Fermion[[3,1]],Fermion[[4,2]]}}];
	PartInv = Join[PartInv,{{Fermion[[1,1]],Fermion[[2,2]],Fermion[[3,2]],Fermion[[4,1]]}}];
	PartInv = Join[PartInv,{{Fermion[[1,2]],Fermion[[2,1]],Fermion[[3,1]],Fermion[[4,2]]}}];		
	lorStructure={LorentzProduct[PL,PL], LorentzProduct[PR,PL],LorentzProduct[PL,PR],LorentzProduct[PR,PR],LorentzProduct[PL,PL], LorentzProduct[PR,PL],LorentzProduct[PL,PR],LorentzProduct[PR,PR]};
	LorentzNeeded=True;
	LorentzCond={NoGamma,NoGamma,NoGamma,NoGamma,WithGamma,WithGamma,WithGamma,WithGamma};
	subVacuum={};,

(* FFVV *)
2020,
	Lag = LagFFVV[Eigenstates];
	Fermion=Cases[teilchen,x_?FermionQ];
	NoFermion= DeleteCases[teilchen,x_?FermionQ];
	Fermion = Fermion  /. bar[x_] -> invO[x]/. diracSub[Eigenstates] /. invO[{x_,y_}]->conj[{y,x}];
	PartInv = Join[PartInv,{{Fermion[[1,1]],Fermion[[2,1]],NoFermion[[1]],NoFermion[[2]]}}];
	PartInv = Join[PartInv,{{Fermion[[1,2]],Fermion[[2,2]],NoFermion[[1]],NoFermion[[2]]}}];
	PartInv = Join[PartInv,{{Fermion[[1,1]],Fermion[[2,2]],NoFermion[[1]],NoFermion[[2]]}}];
	PartInv = Join[PartInv,{{Fermion[[1,2]],Fermion[[2,1]],NoFermion[[1]],NoFermion[[2]]}}];
	PartInv = Join[PartInv,{{Fermion[[1,2]],Fermion[[2,2]],NoFermion[[1]],NoFermion[[2]]}}];
	PartInv = Join[PartInv,{{Fermion[[1,1]],Fermion[[2,1]],NoFermion[[1]],NoFermion[[2]]}}];
	PartInv = Join[PartInv,{{Fermion[[1,2]],Fermion[[2,1]],NoFermion[[1]],NoFermion[[2]]}}];
		PartInv = Join[PartInv,{{Fermion[[1,2]],Fermion[[2,1]],NoFermion[[1]],NoFermion[[2]]}}];
	lorStructure={LorentzProduct[PL,PL], LorentzProduct[PR,PL],LorentzProduct[PL,PR],LorentzProduct[PR,PR],LorentzProduct[PL,PL], LorentzProduct[PR,PL],LorentzProduct[PL,PR],LorentzProduct[PR,PR]};
	LorentzCond={NoGamma,NoGamma,NoGamma,NoGamma,WithGamma,WithGamma,WithGamma,WithGamma};
	subVacuum = {};,

(* FFSS *)
2200,
	Lag = LagFFSS[Eigenstates];
	Fermion=Cases[teilchen,x_?FermionQ];
	NoFermion= DeleteCases[teilchen,x_?FermionQ];
	Fermion = Fermion  /. bar[x_] -> invO[x]/. diracSub[Eigenstates] /. invO[{x_,y_}]->conj[{y,x}];
	PartInv = Join[PartInv,{{Fermion[[1,1]],Fermion[[2,1]],NoFermion[[1]],NoFermion[[2]]}}];
		PartInv = Join[PartInv,{{Fermion[[1,2]],Fermion[[2,2]],NoFermion[[1]],NoFermion[[2]]}}];
		PartInv = Join[PartInv,{{Fermion[[1,1]],Fermion[[2,2]],NoFermion[[1]],NoFermion[[2]]}}];
		PartInv = Join[PartInv,{{Fermion[[1,2]],Fermion[[2,1]],NoFermion[[1]],NoFermion[[2]]}}];
		PartInv = Join[PartInv,{{Fermion[[1,2]],Fermion[[2,1]],NoFermion[[1]],NoFermion[[2]]}}];
	PartInv = Join[PartInv,{{Fermion[[1,1]],Fermion[[2,2]],NoFermion[[1]],NoFermion[[2]]}}];
	PartInv = Join[PartInv,{{Fermion[[1,1]],Fermion[[2,1]],NoFermion[[1]],NoFermion[[2]]}}];
	PartInv = Join[PartInv,{{Fermion[[1,2]],Fermion[[2,2]],NoFermion[[1]],NoFermion[[2]]}}];
	LorentzNeeded=True;
		lorStructure={LorentzProduct[PL,PL], LorentzProduct[PR,PL],LorentzProduct[PL,PR],LorentzProduct[PR,PR],LorentzProduct[PL,PL], LorentzProduct[PR,PL],LorentzProduct[PL,PR],LorentzProduct[PR,PR]};
	LorentzCond={NoGamma,NoGamma,NoGamma,NoGamma,WithGamma,WithGamma,WithGamma,WithGamma};
		subVacuum = {};,


(* SSSSSS *)
600,
	Lag = LagSSSSSS[Eigenstates];
	PartInv = {teilchen};
	lorStructure = {1};
	LorentzNeeded=False;
	subVacuum = {};,

(* SSSSVV *)
420,
	Lag = LagSSSSVV[Eigenstates];
	PartInv = {teilchen};
	lorStructure = {1};
	LorentzNeeded=True;
	subVacuum = {vacuumV};,

(* SSVVVV *)
240,
	Lag = LagSSSVVV[Eigenstates];
	PartInv = {teilchen};
	lorStructure = {1};
	LorentzNeeded=True;
	subVacuum = {vacuumS};
];


subVert={Mom[a_]*Mom[b_]->0,pmue->0};
subVert=Join[subVert,subAlways];

If[UseDependences==True,
subVert=Join[subVert, subDependences];
];



Result=Join[Result,{finalPart }];
 
For[j=1,j<=Length[PartInv],
fermpos=0;
If[MemberQ[PartInv[[j]],0]==True,
Result = Join[Result,{{0,lorStructure[[j]]}}];,
temp = Lag;
temp2=LagRe;
 For[i=1,i<=Length[PartInv[[j]]],
If[FermionQ[PartInv[[j,i]]],fermpos++;];
temp =DPV[temp,PartInv[[j,i]],i,fermpos];
temp2 =DPV[temp2,PartInv[[j,i]],i, fermpos];
i++];



If[temp2 =!=0,temp=temp2;];

tempSave=temp;

temp = temp /.subVacuum /. zero[a_]->0*a /. subFinal /.subIndInsert;

subInvMatrices= {conj[A_[b_,a_]] Inv[A_][c_,b_]:>Delta[a,c] /; a=!=c,A_[b_,a_] conj[Inv[A_][c_,b_]]:>Delta[a,c] /; a=!=c} ;
subInvMatrices= Join[subInvMatrices,{conj[A_[b_,a_]]^2 Inv[A_][c_,b_]:>conj[A[b,a]] Delta[a,c] /; a=!=c,A_[b_,a_]^2 conj[Inv[A_][c_,b_]]:>A[b,a]Delta[a,c] /; a=!=c} ];
subInvMatrices= Join[subInvMatrices,{conj[A_[b_,a_]] Inv[A_][c_,b_]->Delta[a,c],A_[b_,a_] conj[Inv[A_][c_,b_]]->Delta[a,c]} ];
subInvMatrices= Join[subInvMatrices,{conj[A_[b_,a_]]^2 Inv[A_][c_,b_]->conj[A[b,a]] Delta[a,c],A_[b_,a_]^2 conj[Inv[A_][c_,b_]]->A[b,a]Delta[a,c]} ];
subInvMatrices= Join[subInvMatrices,subInvMatrices/.conj[x_]->x];



tempSave2=temp;
tempWithLorentz=makeSumAll[CalcDelta[temp /.subVert /. subAlways] /.subInvMatrices/. subFinal]  /.subAlways;
tempWithLorentz = Simplify[tempWithLorentz,Trig->True] /. Inv[X_][a_,b_]->conj[X[b,a]];


If[tempWithLorentz=!=0,
If[LorentzNeeded==True,
If[partCode===220,
ExtractLorentz[CalcDelta[tempWithLorentz]];,
ExtractLorentz[tempWithLorentz];
];
If[partCode===2200 || partCode===2020 || partCode===4000,
For[i=1,i<=Length[Lor],
If[(FreeQ[Lor[[i]],gamma]==True && LorentzCond[[j]]===WithGamma) || (FreeQ[Lor[[i]],gamma]==False && LorentzCond[[j]]===NoGamma),
Coeff[[i]]=0;
If[ LorentzCond[[j]]===WithGamma,
Lor[[i]]=Append[LorentzProduct[gamma],Lor[[i]]];
];
];
i++;];,
If[partCode==12,
For[i=1,i<=3,
If[Head[PartInv[[j,i]]]=!=bar,
If[getType[PartInv[[j,i]]]===G,
invGhost=PartInv[[j,i]];
invGhostNr=i;
];
];
i++;];
Lor = Lor /. Mom[a_,b_]-> Mom[getFull[invGhost] /. subGC[invGhostNr] /. subIndFinal[invGhostNr,invGhostNr],b];
];
];,
Coeff={tempWithLorentz};
Lor={1};
];
For[k=1,k<=Length[Coeff],
Result = Join[Result,{{vfactor Coeff[[k]],AppendLorentz[Lor[[k]],lorStructure[[j]]]}}];
k++;];,
Result = Join[Result,{{0,lorStructure[[j]]}}]; 
];
]; 
j++;];

If[UseCheckMatrixProduct==True &&partCode===220,
Result = CheckMatrixProduct2[Result];
];


If[(partCode===210 || partCode===2010 || partCode===220) && UseCheckMatrixProduct =!=False,
Result = Result /.  SA`subUnitaryCondition;
];

Return[Result];


];

AppendLorentz[a_,b_]:=
If[AtomQ[LorentzProduct[a]]==True,
Return[LorentzProduct[b]];,
Return[Append[LorentzProduct[a],b]];
];

makeSubFinalIndizes:=Block[{i,t,broken},
subFinal={};
subFinalX={};
broken=Select[Gauge,(#[[5]]==True)&];
broken=Table[broken[[i,3]],{i,1,Length[broken]}];
For[i=1,i<=Length[subIndizes]-1,
 (*If[subIndizes[[i,1]]=!=left, *)
 If[FreeQ[broken,subIndizes[[i,1]]], 
For[t=1,t<=6,
subFinal = Join[subFinal, {sum[(subIndizes[[i,1]] /.subGC[1] /.subIndFinal[1,t]),x_,y_]->1}];
subFinalX = Join[subFinalX, {sum[(subIndizes[[i,1]] /.subGC[1] /.subIndFinalX[1,t,"m"]),x_,y_]->1}];
subFinalX = Join[subFinalX, {sum[(subIndizes[[i,1]] /.subGC[1] /.subIndFinalX[1,t,"n"]),x_,y_]->1}];
t++;]; 
];
i++;];
];

ExtractLorentz[x_]:=Block[{temp,i,j},
If[(FreeQ[x,lt3]==True) && (FreeQ[x,lt1]==True) &&(FreeQ[x,lt2]==True) &&(FreeQ[x,lt4]==True),
Lor={1};
Coeff={x};
Return[];
]; 

If[Head[x]=!=Times,
temp=Simplify[x];,
temp=x;
];

If[Head[temp]===Plus,
Coeff=Table[1,{Length[temp]}];
Lor=Table[1,{Length[temp]}];
For[j=1,j<=Length[temp],
temp2=Simplify[temp[[j]]];
For[i=1,i<=Length[temp2],
If[(FreeQ[temp2[[i]],lt3]==False) || (FreeQ[temp2[[i]],lt1]==False) ||(FreeQ[temp2[[i]],lt2]==False) ||(FreeQ[temp2[[i]],lt4]==False), 
Lor[[j]]*=temp2[[i]];,
Coeff[[j]]*=temp2[[i]];
];
i++;];
j++;];,
Lor={1};
Coeff={1};
For[i=1,i<=Length[temp],
If[(FreeQ[temp[[i]],lt3]==False) || (FreeQ[temp[[i]],lt1]==False) ||(FreeQ[temp[[i]],lt2]==False) ||(FreeQ[temp[[i]],lt4]==False), 
Lor[[1]]*=temp[[i]];,
Coeff[[1]]*=temp[[i]];
];
i++;];
];

Lor = Simplify[Expand[Lor] /.{g[a_,b_]*Mom[c_,b_]-> Mom[c,a],g[b_,a_]*Mom[c_,b_]-> Mom[c,a]}];
Coeff = ReleaseHold[Coeff/. sum[a1_,f1_,g1_ , fSU2[b1_,c1_,d1_]^2]-> Hold[Sum[fSU2[b1,c1,d1]^2,{a1,f1,g1}]]];
Coeff = ReleaseHold[Coeff/. sum[a1_,f1_,g1_ ,fSU2[b1_,c1_,d1_]*fSU2[b2_,c2_,d2_]]-> Hold[Sum[ fSU2[b1,c1,d1] fSU2[b2,c2,d2],{a1,f1,g1}]]];

For[i=1,i<=Length[Lor],
NewLor=Lor[[i]];
If[Head[Lor[[i]]]===Times,
For[j=1,j<=Length[Lor[[i]]],
If[(FreeQ[Lor[[i,j]],lt3]==True) && (FreeQ[Lor[[i,j]],lt1]==True) &&(FreeQ[Lor[[i,j]],lt2]==True) &&(FreeQ[Lor[[i,j]],lt4]==True),
Coeff[[i]]=Coeff[[i]]*Lor[[i,j]];
NewLor=NewLor/Lor[[i,j]];
]; 
j++;];
];
Lor[[i]]=NewLor;
If[Lor[[i]]==0, Coeff[[i]]=0;];
i++;];

If[partCode ===40,
CoeffT=Table[Coeff[[1]],{3}];
CoeffT[[1]] = CoeffT[[1]] *Coefficient[Lor[[1]],g[lt1,lt2] g[lt3,lt4]];
CoeffT[[2]] = CoeffT[[2]] *Coefficient[Lor[[1]],g[lt1,lt3] g[lt2,lt4]];
CoeffT[[3]] = CoeffT[[3]] *Coefficient[Lor[[1]],g[lt1,lt4] g[lt3,lt2]];
Coeff=CoeffT; Lor = {g[lt1,lt2] g[lt3,lt4],g[lt1,lt3] g[lt2,lt4],g[lt1,lt4] g[lt3,lt2]};
];

If[ Lor[[1]] == -Mom[getFull[teilchen[[1]]] /.subGC[1] /.subIndFinal[1,1],lt3]+ Mom[getFull[teilchen[[2]]] /.subGC[2] /. subIndFinal[2,2],lt3], 
Lor[[1]] = -Lor[[1]];
Coeff[[1]]=-Coeff[[1]];
];



If[partCode===30,
C12 = Coefficient[Lor[[1]],g[lt1,lt2]];
If[Head[DeleteCases[DeleteCases[C12,Mom[A_[{c___,lt2,b___}],lt3],3],Mom[conj[A_[{c___,lt2,b___}]],lt3],3]]===Plus,
Lor[[1]]=-Lor[[1]];
Coeff[[1]]=-Coeff[[1]];
];
];


];


TreeMass[x_,eigenstates_]:=TreeMass[x,eigenstates,True];

TreeMass[x_,eigenstates_, insGen_]:=Block[{i,sub},
Particles[Current] = Particles[eigenstates];
If[insGen==True,
sub = {gt1->generation,gt2->generation};,
sub={};
];

If[getGen[x]==1,
sub = {gt1->1,gt2->1,generation->1};
];

sub = Join[sub,PhasesToOneSub];

Switch[getType[x,False,eigenstates],
V,Return[-Vertex[{x,conj[x]},Eigenstates->eigenstates][[2,1]]/.sub];,
S,Return[-Vertex[{x,conj[x]},Eigenstates->eigenstates][[2,1]]/. sub];,
F, diracSpinor = x /. diracSubBack1[eigenstates]  /. diracSubBack2[eigenstates];
   If[MemberQ[MajoranaPart,x]===True,
Return[-Vertex[{ diracSpinor , diracSpinor },Eigenstates->eigenstates][[2,1]]/. sub];,
Return[-Vertex[{bar[ diracSpinor ], diracSpinor },Eigenstates->eigenstates][[2,1]]/.sub];
];,
G, Return[0];,
NoField, Return[0];,
A, Return[0];
];
];




