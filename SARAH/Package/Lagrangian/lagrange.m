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






(* Begin["`Lagrange`"] *)


GetSuperpotential:=Block[{i,i1,i2,n,m},

Print["Calc Superpotential"];

(*------------------------------------------------------*)
(* Superpotential *)
(*------------------------------------------------------*)

LagrangianAux=0;

listWtri={};
listWbi={};
listWone={};
listWtriOne={};
listWbiOne={};
listW4 = {};
listW4One = {};
listSMadd = {};

];





(*-------------------------------------------------------------*)
(* Particles Interactions *)
(*-------------------------------------------------------------*)

CalcSuperpotential:=Block[{i,j,listNew,tempList,pos,parts,finished,i1,i2,i3,i4,i5,term,tempSym,res},


sumUnex=0;
WSup=0;
WCouplings={};
WCouplingsLin={};
WCouplingsBi={};
WCouplingsTri={};
WCouplingsQuad={};
ShowSuperpotentialContractions={};

For[i=1,i<=Length[SuperPotential],
fields=1;
parts={};
For[j=1, j<=Length[SuperPotential[[i,2]]],
pos=Position[ListFields,SuperPotential[[i,2,j]]][[1,1]];
fields = fields*part[SFields[[pos]],j];
parts = Join[parts,{SFields[[pos]]}] /. conj[x_]->x; 
j++;];

tempSym = DeleteCases[{SuperPotential[[i,1,1]]},x_?NumericQ,2];

For[j=1,j<=Length[tempSym],
parameters=Join[parameters,{{tempSym[[j]],{},{}}}];
j++;];


If[Length[SuperPotential[[i,1]]]==2,
IndexStructure=MakeIndexStructure[SuperPotential[[i,2]]];,
IndexStructure=SuperPotential[[i,1,3]];
];

res =MakeInteractionListRGE[SuperPotential[[i]]]; 

term=IndexStructure*genTest[SuperPotential[[i,1,2]],SuperPotential[[i,2]],True]*fields;
sumUnex+=SuperPotential[[i,1,1]]*term;
term=SumOverExpandedIndizes[term, SuperPotential[[i,2]]];

If[Length[SuperPotential[[i,2]]]<=4,
WSup += SuperPotential[[i,1,1]]*term;
];
ShowSuperpotentialContractions = Join[ShowSuperpotentialContractions,{{fields /. sum[a__]->1,IndexStructure}}];

WCouplings = Join[WCouplings,{SuperPotential[[i,1,2]]}];
Switch[Length[SuperPotential[[i,2]]],
4, WCouplingsQuad = Join[WCouplingsQuad,{SuperPotential[[i,1,2]]}];,
3, WCouplingsTri = Join[WCouplingsTri,{SuperPotential[[i,1,2]]}];,
2, WCouplingsBi = Join[WCouplingsBi,{SuperPotential[[i,1,2]]}];,
1, WCouplingsLin = Join[WCouplingsLin,{SuperPotential[[i,1,2]]}];
];


(* For RGEs *) 

(*  res =MakeInteractionListRGE[SuperPotential[[i]]];  *)

Switch[Length[SuperPotential[[i,2]]],
4,
If[FreeQ[listW4One,(SuperPotential[[i,1,2]] /. subAlways /. conj[x_]->x)],listW4One=Join[listW4One,{res[[1]]}];];
listW4 = Join[listW4,res[[2]]];,

3,
If[FreeQ[listWtriOne,(SuperPotential[[i,1,2]] /. subAlways /. conj[x_]->x)],listWtriOne=Join[listWtriOne,{res[[1]]}];];
listWtri = Join[listWtri,res[[2]]];,

2,
If[FreeQ[listWbiOne,(SuperPotential[[i,1,2]] /. subAlways /. conj[x_]->x)],listWbiOne=Join[listWbiOne,{ res[[1]]}];
];
listWbi = Join[listWbi,res[[2]]];,

1,
If[FreeQ[listWone,(SuperPotential[[i,1,2]] /. subAlways /. conj[x_]->x)],listWone=Join[listWone,{res[[1]]}];];
];
i++;];

Superpotential = WSup;

If[Length[NonSUNindices]==0,
CheckChargeConservation;
];
];



CalcFTerms:=Block[{s,j,i,c},
Print["Calc F-Terms"];


(*F-Terms*)

FTerms=0;

If[NoFTerms =!=True,
For[i=1,i<=Length[SFieldList],
FTerms  += DFTerms[Superpotential,SFieldList[[i]]];
i++;];
];


];


CalcMatter := Block[{s,t,g,c2,i,c1,h,j,k,l,m,Dim5Lag, Dim5FieldsFermion,Dim5FieldsScalar,posls},
Print["Calc Fermion-Scalar"];


(*Wij*)

Wij=0;

For[i=1,i<=Length[SFieldList],
For[k=1,k<=Length[SFieldList],
Wij += DPF[DPF[Superpotential,SFieldList[[i]],FFieldList[[i]],1],SFieldList[[k]],FFieldList[[k]],2];
k++;];
i++;];


WSijkl=0;

Matter = FTerms + (Wij +conj[Wij /. {Ferm_[1]->Ferm[2],Ferm_[2]->Ferm[1]} ])+ (WSijkl + (conj[WSijkl] /. {Ferm_[4]->Ferm[1],Ferm_[3]->Ferm[2], Ferm_[2]->Ferm[3],Ferm_[1]->Ferm[4]}));

];



(*------------------------------------------------------*)
(* Softbreaking *)
(*------------------------------------------------------*)

CalcSoftBreaking:=Block[{c,j,i,gen1,gen2,gen3,c1,c2,c3,m},

Print["Calc Soft Breaking"];

listSM= {};
listSMoff= {};
listSMaddoff={};
listGM= {};
listGMall= {};


(*----------- Soft Breaking Masses ---------------*)

ListSoftBreakingScalarMasses={};

MassScalar[x_]:=Block[{mass},
mass=ToExpression["m"<> ToString[x]<>"2"];
ListSoftBreakingScalarMasses=Join[ListSoftBreakingScalarMasses,{mass}];
Return[mass];
];

MassScalar[x_,y_]:=Block[{mass},
mass=ToExpression["m"<> ToString[x]<> ToString[y]<>"2"];
ListSoftBreakingScalarMasses=Join[ListSoftBreakingScalarMasses,{mass}];
Return[mass];
];



MassGauge[x_]:=Block[{mass,coup,name,pos},
coup=Gauge[[x,4]];
If[FreeQ[Take[Gauge,{1,x-1}],coup],
name = Gauge[[x,1]];,
pos = Position[Gauge,coup][[1,1]];
name=Gauge[[pos,1]];
];
mass=ToExpression["Mass"<> ToString[name]];
Return[mass];
];

MassGauge[x_,y_]:=Block[{mass,coup,nameX,pos, nameY},
coupX=Gauge[[x,4]];
coupY=Gauge[[y,4]];
If[FreeQ[Take[Gauge,{1,x-1}],coup],
nameX = Gauge[[x,1]];,
pos = Position[Gauge,coupX][[1,1]];
nameX=Gauge[[pos,1]];
];
If[FreeQ[Take[Gauge,{1,y-1}],coupY],
nameY = Gauge[[y,1]];,
pos = Position[Gauge,coup][[1,1]];
nameY=Gauge[[pos,1]];
];
mass=ToExpression["Mass"<> ToString[nameX]<> ToString[nameY]];
U1MixingParameters=Join[U1MixingParameters,{mass}];
Return[mass];
];

SoftScalarMass=0;

If[AddSoftTerms=!=False,
If[AddSoftScalarMasses =!=False,
For[i=1,i<=AnzahlChiral,
If[Head[SFields[[i]]]===conj,
temp= part[SFields[[i]],1] conj[part[SFields[[i]],2]]*genTest[MassScalar[Fields[[i,3]]],{conj[Fields[[i,3]]],Fields[[i,3]]},False]*makeDelta[i,1,2,{generation}];,
temp= conj[part[SFields[[i]],1]] part[SFields[[i]],2]*genTest[MassScalar[Fields[[i,3]]],{conj[Fields[[i,3]]],Fields[[i,3]]},False]*makeDelta[i,1,2,{generation}];
];
term=SumOverExpandedIndizes[temp, {Fields[[i,3]],Fields[[i,3]]}];

SoftScalarMass += term;


(*
Adj[MassScalar[Fields[[i,3]]]]=MassScalar[Fields[[i,3]]];
Tp[MassScalar[Fields[[i,3]]]]=Conj[MassScalar[Fields[[i,3]]]];
*)

If[Fields[[i,2]]===1,
Conj[MassScalar[Fields[[i,3]]]]=MassScalar[Fields[[i,3]]];
Tp[MassScalar[Fields[[i,3]]]]=MassScalar[Fields[[i,3]]];
realVar = Join[realVar,{MassScalar[Fields[[i,3]]]}];
];

(* For RGEs *)


listSMadd = Join[listSMadd,{{1,Fields[[i,2]],TrueQ[Head[SFields[[i]]]===conj]}}];
listSM=Join[listSM,{{{SFields[[i]] /. conj[x_]->x,SFields[[i]]  /. conj[x_]->x},genTest[MassScalar[Fields[[i,3]]],{conj[Fields[[i,3]]],Fields[[i,3]]},False]*makeDelta[i,1,2,{generation}]}}];



SA`ListM2ij=Join[SA`ListM2ij,{{{SFields[[i]] /. conj[x_]->x,SFields[[i]]  /. conj[x_]->x},{1,genTest[MassScalar[Fields[[i,3]]],{conj[Fields[[i,3]]],Fields[[i,3]]},False]*makeDelta[i,1,2,{generation}]}}}];





If[AddMixedSofts=!=False,
For[j=i,j<=AnzahlChiral,
If[i!= j  && Drop[Fields[[i]],3]==Drop[Fields[[j]],3],
(* If[getRParity[SFields[[i]],GaugeES]===getRParity[SFields[[j]],GaugeES] || RParityConservation ==False, *)
temp= (part[SFields[[i]],1]*conj[part[SFields[[j]],2]] genTest[MassScalar[Fields[[i,3]],Fields[[j,3]]],{conj[Fields[[i,3]]],Fields[[j,3]]},False]+conj[part[SFields[[i]],1]]*part[SFields[[j]],2] conj[genTest[MassScalar[Fields[[i,3]],Fields[[j,3]]],{conj[Fields[[i,3]]],Fields[[j,3]]},False]])*makeDelta[i,1,2,{generation}];
term=SumOverExpandedIndizes[temp, {Fields[[i,3]],Fields[[j,3]]}];
SoftScalarMass += term;
Adj[MassScalar[Fields[[i,3]],Fields[[j,3]]]]=MassScalar[Fields[[i,3]],Fields[[j,3]]];
If[Fields[[i,2]]===1 || Fields[[j,2]]===1,
Conj[MassScalar[Fields[[i,3]],Fields[[j,3]]]]=MassScalar[Fields[[i,3]],Fields[[j,3]]];
conj[MassScalar[Fields[[i,3]],Fields[[j,3]]]]=MassScalar[Fields[[i,3]],Fields[[j,3]]];
realVar = Join[realVar,{MassScalar[Fields[[i,3]],Fields[[j,3]]]}];
Tp[MassScalar[Fields[[i,3]],Fields[[j,3]]]]=MassScalar[Fields[[i,3]],Fields[[j,3]]];
];
listSMoff=Join[listSMoff,{{{SFields[[i]] /. conj[x_]->x,SFields[[j]]  /. conj[x_]->x},genTest[MassScalar[Fields[[i,3]],Fields[[j,3]]],{conj[Fields[[i,3]]],Fields[[j,3]]},False]*makeDelta[i,1,2,{generation}]}}];
SA`ListM2ijOFF=Join[SA`ListM2ijOFF,{{{SFields[[i]] /. conj[x_]->x,SFields[[j]]  /. conj[x_]->x},{1,genTest[MassScalar[Fields[[i,3]],Fields[[j,3]]],{conj[Fields[[i,3]]],Fields[[j,3]]},False]*makeDelta[i,1,2,{generation}]}}}];

listSMaddoff = Join[listSMaddoff,{{0,1,TrueQ[Head[SFields[[i]]]===conj]}}];
(* ]; *)
];
j++;];
];
i++;];

listSM = Join[listSM,listSMoff];
SA`ListM2ij=Join[SA`ListM2ij,SA`ListM2ijOFF];
listSMadd = Join[listSMadd,listSMaddoff];
];

SoftGauginoMass=0;
If[AddSoftGauginoMasses=!=False,


SoftGauginoMass=  Sum[(part[FGauge[[i]],1]*part[FGauge[[i]], 2])*Delta[gen1,gen2]*genTest[MassGauge[i],{FGauge[[i]],FGauge[[i]]},False],{i,1,AnzahlGauge}];

SoftGauginoMassOff=0;

For[i=1,i<=AnzahlGauge,
SA`ListGauginoMixed = Join[SA`ListGauginoMixed,{{{i,i},{1,MassGauge[i]}}}];
If[Gauge[[i,2]]===U[1] && NoU1Mixing=!=True,
SA`KineticMixing=True;
For[j=i+1,j<=AnzahlGauge,
If[Gauge[[j,2]]===U[1],
SoftGauginoMassOff +=  part[FGauge[[i]],1]*part[FGauge[[j]], 2]*genTest[MassGauge[i,j],{FGauge[[i]],FGauge[[j]]},False];
SoftGauginoMassOff += (part[FGauge[[i]],1]*part[FGauge[[j]], 2]*genTest[MassGauge[i,j],{FGauge[[i]],FGauge[[j]]},False]/. {A_[b__][1]->A[b][2],A_[b__][2]->A[b][1]} ); 

SA`ListGauginoMixed2 = Join[SA`ListGauginoMixed2,{{{i,j},{1,MassGauge[i,j]}}}];
SA`KineticMixingParameters=Join[SA`KineticMixingParameters,{MassGauge[i,j]}];
 listGM=Join[listGM,{{{getBlank[FGauge[[i]]],getBlank[FGauge[[j]]]},genTest[MassGauge[i,j],{FGauge[[i]],FGauge[[j]]},False]}}]; 
];
j++;];
];
i++;];


SA`ListGauginoMixed = Join[SA`ListGauginoMixed,SA`ListGauginoMixed2];


SoftGauginoMass += conj[SoftGauginoMass] + SoftGauginoMassOff+ conj[SoftGauginoMassOff];
];

(* For RGEs *)

For[i=1,i<=AnzahlGauge,

If[FreeQ[listGM,MassGauge[i]] && AddSoftGauginoMasses=!=False,
listGM=Join[listGM,{{{getBlank[FGauge[[i]]],getBlank[FGauge[[i]]]},genTest[MassGauge[i],{FGauge[[i]],FGauge[[i]]},False]}}];
SA`ListGaugino=Join[SA`ListGaugino,{{i,{1,genTest[MassGauge[i],{FGauge[[i]],FGauge[[i]]},False]}} }];
];


If[FreeQ[SA`ListGauge,Gauge[[i,4]]],
SA`ListGauge=Join[SA`ListGauge,{{i,{1,Gauge[[i,4]]} }}];
];
If[AddSoftGauginoMasses=!=False, listGMall=Join[listGMall,{{{getBlank[FGauge[[i]]],getBlank[FGauge[[i]]]},genTest[MassGauge[i],{FGauge[[i]],FGauge[[i]]},False]}}];]; 
i++;];


(* ------- Soft Breaking Superpotential Parameters ------ *)


SoftW = Superpotential;

SoftW = SoftW /. Table[WCouplingsQuad[[i]]->Q[WCouplingsQuad[[i]]],{i,1,Length[WCouplingsQuad]}] /. Table[WCouplingsTri[[i]]-> T[WCouplingsTri[[i]]],{i,1,Length[WCouplingsTri]}] /. Table[WCouplingsBi[[i]]-> B[WCouplingsBi[[i]]],{i,1,Length[WCouplingsBi]}]/. Table[WCouplingsLin[[i]]-> L[WCouplingsLin[[i]]],{i,1,Length[WCouplingsLin]}];


If[AddTterms ===False,
SoftW = SoftW /. T[a_][b___]->0 /. T[a_]->0;
parameters = Select[parameters, (FreeQ[#,T[a_]])&];
];

If[AddQterms ===False,
SoftW = SoftW /. Q[a_][b___]->0 /. Q[a_]->0;
parameters = Select[parameters, (FreeQ[#,Q[a_]])&];
];

If[AddBterms ===False,
SoftW = SoftW /. B[a_][b___]->0 /. B[a_]->0;
parameters = Select[parameters, (FreeQ[#,B[a_]])&];
];

If[AddLterms ===False,
SoftW = SoftW /. L[a_][b___]->0 /. L[a_]->0;
parameters = Select[parameters, (FreeQ[#,L[a_]])&];
];

(* ---------- Dirac mass terms --------- *)

If[AddDiracGauginos===True,SoftDG=GetDiracGauginos;,SoftDG=0;];

(* ---------- Sum --------- *)

Soft = SoftW + SoftScalarMass+ SoftGauginoMass+ conj[SoftW]+SoftDG;

listWtri = listWtri /. Delta[gen1,a_]->1 /. Delta[gen2,a_]->1;
listWbi = listWbi /. Delta[gen1,a_]->1 /. Delta[gen2,a_]->1;
listWtriOne = listWtriOne /. Delta[gen1,a_]->1 /. Delta[gen2,a_]->1;
listWbiOne = listWbiOne /. Delta[gen1,a_]->1 /. Delta[gen2,a_]->1;

listA4One=listW4One /.   Table[WCouplingsQuad[[i]]-> Q[WCouplingsQuad[[i]]],{i,1,Length[WCouplingsQuad]}];
listA4=listW4 /.   Table[WCouplingsQuad[[i]]-> Q[WCouplingsQuad[[i]]],{i,1,Length[WCouplingsQuad]}];

If[AddTterms =!=False,
listAtri = listWtri /.   Table[WCouplingsTri[[i]]-> T[WCouplingsTri[[i]]],{i,1,Length[WCouplingsTri]}];
listAtriOne = listWtriOne /.   Table[WCouplingsTri[[i]]-> T[WCouplingsTri[[i]]],{i,1,Length[WCouplingsTri]}];
];

If[AddBterms =!=False,
listAbi=listWbi /.   Table[WCouplingsBi[[i]]-> B[WCouplingsBi[[i]]],{i,1,Length[WCouplingsBi]}];
listAbiOne=listWbiOne /.   Table[WCouplingsBi[[i]]-> B[WCouplingsBi[[i]]],{i,1,Length[WCouplingsBi]}];
];
If[AddLterms =!=False,
listAone=listWone /.   Table[WCouplingsLin[[i]]-> L[WCouplingsLin[[i]]],{i,1,Length[WCouplingsLin]}];
];


For[i=1,i<=Length[WCouplingsLin],getSoftBreaking[WCouplingsLin[[i]]]=L[WCouplingsLin[[i]]];i++;];
For[i=1,i<=Length[WCouplingsBi],getSoftBreaking[WCouplingsBi[[i]]]=B[WCouplingsBi[[i]]];i++;];
For[i=1,i<=Length[WCouplingsTri],getSoftBreaking[WCouplingsTri[[i]]]=T[WCouplingsTri[[i]]];i++;];,
Soft=0;
SoftW=0;
SoftScalarMass=0;
SoftGauginoMass=0;
SoftDG=0;
];



];






GetDiracGauginos:=Block[{i,j,k,l,res=0,fields,dim,add,indexB,mName,currentDirac},
Print["Adding dirac gaugino soft terms"];
For[i=1,i<=Length[Gauge],
currentDirac={};
dim=Gauge[[i,2]];
If[dim===U[1],dim=0;,dim=dim[[1]]^2-1;];
fields={};
For[j=1,j<=Length[Fields],
If[Fields[[j,3+i]]===dim,
add=True;
For[k=1,k<=Length[Gauge],
If[k!=i,
If[(Gauge[[k,2]]===U[1] && Fields[[j,3+k]]=!=0) || (Gauge[[k,2]]=!=U[1] && Fields[[j,3+k]]=!=1),
add=False;
];
];
k++;];
If[add==True,fields=Join[fields,{j}]];
];
j++;];
SA`DiracGauginos = Join[SA`DiracGauginos,{fields}];
For[j=1,j<=Length[fields],
mName = ToExpression["MD"<>ToString[Gauge[[i,1]]]<>ToString[Fields[[fields[[j]]]][[3]]]];
mName = genTest[mName,{Fields[[fields[[j]]]][[3]]},False];
SA`DiracGauginoMassTerms = Join[SA`DiracGauginoMassTerms,{mName}];
If[dim===0,SA`DiracGauginosInfo = Join[SA`DiracGauginosInfo,{{{SFields[[fields[[j]]]],i},{1,mName}}}];,
SA`DiracGauginosInfo = Join[SA`DiracGauginosInfo,{{{SFields[[fields[[j]]]],i},{1,Delta[1,Gauge[[i,3]]/.subGC[1]]mName}}}];];
(* parameters=Join[parameters,{{mName,{},{}}}]; *)
If[Gauge[[i,2]]=!=U[1],
indexB=ToExpression[ToString[Gauge[[i,3]]]<>"b"];
If[Gauge[[i,5]]===True,
res +=  Sqrt[2] SumOverExpandedIndizes[(mName /. gen1->gen2) part[FGauge[[i]],1] part[FFields[[fields[[j]]]],2]*TA[Gauge[[i,2]],gen1,indexB/.subGC[2],Gauge[[i,3]]/.subGC[2]],{None,Fields[[fields[[j]],3]]}];
res +=  Sqrt[2] SumOverExpandedIndizes[mName part[FGauge[[i]],2] part[FFields[[fields[[j]]]],1]*TA[Gauge[[i,2]],gen2,indexB/.subGC[1],Gauge[[i,3]]/.subGC[1]],{Fields[[fields[[j]],3]],None}];,
(*
res +=  Sqrt[2]  (mName /. gen1->gen2) part[FGauge[[i]],1] part[FFields[[fields[[j]]]],2]*TA[Gauge[[i,2]],ADI[i] /. subGC[1],indexB/.subGC[2],Gauge[[i,3]]/.subGC[2]];
res +=  Sqrt[2]  mName part[FGauge[[i]],2] part[FFields[[fields[[j]]]],1]*TA[Gauge[[i,2]],ADI[i] /. subGC[2],indexB/.subGC[1],Gauge[[i,3]]/.subGC[1]]; *)
res +=   (mName /. gen1->gen2) part[FGauge[[i]],1] part[FFields[[fields[[j]]]],2]*Delta[ADI[i] /. subGC[1],Gauge[[i,3]]/.subGC[2]];
res +=   mName part[FGauge[[i]],2] part[FFields[[fields[[j]]]],1]*Delta[ADI[i] /. subGC[2],Gauge[[i,3]]/.subGC[1]];
];,
res += (mName /. gen1->gen2)part[FGauge[[i]],1] part[FFields[[fields[[j]]]],2];
res += ((mName /. gen1->gen2) part[FGauge[[i]],1] part[FFields[[fields[[j]]]],2]/. {A_[b__][1]->A[b][2],A_[b__][2]->A[b][1]} );
];
j++;];
i++;];
Return[res+conj[res]];
];


(*-----------------------------------------*)
(* Kinetic Part *)
(*-----------------------------------------*)


CalcKinetic:=Block[{i,Bg12,gen1,gen2,Bg22,Bg23,a,g, gauge},

Print["Calc Kinetic Terms"];


(* ----------- Kinetic Scalars ------------*)


KovariantDerivative[fieldNr_,p1_,p2_, LorNr_]:=Block[{i,temp, gauge, gaugeNr,gNr,gNr2},
temp=0;
For[gNr=1,gNr<=AnzahlGauge,
If[Fields[[fieldNr,3+gNr]]=!=0 || Gauge[[gNr,2]]===U[1] ,
temp += part[SGauge[[gNr]],LorNr] getGenerator[gNr,FieldDim[fieldNr,gNr],LorNr,p1,p2]*
Gauge[[gNr,4]] makeDelta[fieldNr,p1,p2,{Gauge[[gNr,3]]}];
If[Gauge[[gNr,2]]===U[1] && NoU1Mixing=!=True,
For[gNr2=1,gNr2<=AnzahlGauge,
If[Gauge[[gNr2,2]]===U[1] && gNr2!= gNr,
temp +=  part[SGauge[[gNr]],LorNr] getGenerator[gNr2,FieldDim[fieldNr,gNr2],LorNr,p1,p2]*
GaugesU1[gNr2,gNr] makeDelta[fieldNr,p1,p2,{Gauge[[gNr,3]]}];
];
gNr2++;
];
];
];
gNr++;];
Return[temp];
];

KinScalar = 0;

For[i=1,i<=AnzahlChiral,
temp= - g[lor4,lor3]*((conj[part[SFields[[i]],2]]  I KovariantDerivative[i,2,1,3]Deri[part[SFields[[i]],1],lor4])  + part[SFields[[i]],1]  (- I KovariantDerivative[i,2,1,4]) Deri[conj[part[SFields[[i]],2]],lor3]);
KinScalar+=SumOverExpandedIndizes[temp,{Fields[[i,3]],Fields[[i,3]]}] /.subFieldsOne; 
SumFactor=getSumFields[i,5];
temp= g[lor4,lor3] SumFactor KovariantDerivative[i,5,1,4]*part[SFields[[i]],1] KovariantDerivative[i,2,5,3]*conj[part[SFields[[i]],2]];
KinScalar+=SumOverExpandedIndizes[temp,{Fields[[i,3]],Fields[[i,3]],None,None,Fields[[i,3]]}] /.subFieldsOne;

i++;];


(* ------------- Kinetic Fermions -----------*)


KinFerm = 0;

For[i=1,i<=AnzahlChiral,
temp=- (conj[part[FFields[[i]],1]]*
(pmue[part[FFields[[i]],2]]+ I gamma[lor3]KovariantDerivative[i,1,2,3])*part[FFields[[i]],2] );
KinFerm+= SumOverExpandedIndizes[temp,{Fields[[i,3]],Fields[[i,3]]}] /.subFieldsOne;

temp=- part[FFields[[i]],1]*
(pmue[part[FFields[[i]],2]]- I gamma[lor3]conj[KovariantDerivative[i,1,2,3]])*conj[part[FFields[[i]],2]];
KinFerm+= SumOverExpandedIndizes[temp,{Fields[[i,3]],Fields[[i,3]]}] /.subFieldsOne;
i++;];


];



(*-----------------------------------------*)
(* Gauge Part *)
(*-----------------------------------------*)



(*------------ D-Terms -------------*)

CalcDTerms:=Block[{i,j,ig,c,w, gNr, structure,tempU1,insGenU1,tempD},

Print["Calc D-Terms"];

If[NoDTerms ===True,
DTerms = 0;,

DTermsDirac=0;
DTerms=Table[{},{AnzahlGauge}];
For[gNr=1,gNr<=AnzahlGauge,
For[i=1,i<=AnzahlChiral,
insGen1=getGenerator[gNr,Fields[[i,3+gNr]],3,1,2] /. Lam[a__]->2;
temp1= insGen1 Gauge[[gNr,4]] part[aGauge[[gNr]],3] conj[part[SFields[[i]],1]]*part[SFields[[i]],2]makeDelta[i,1,2,{Gauge[[gNr,3]]}];
 If[AddDiracGauginos,
For[ig=1,ig<=Length[SA`DiracGauginos[[gNr]]],
mName = ToExpression["MD"<>ToString[Gauge[[gNr,1]]]<>ToString[Fields[[SA`DiracGauginos[[gNr,ig]]]][[3]]]];
mName=genTest[mName,{Fields[[SA`DiracGauginos[[gNr,ig]]]][[3]]},False];
If[Gauge[[gNr,2]]=!=U[1],
If[Gauge[[gNr,5]]===True,
tempD= getGenerator[gNr,Fields[[i,3+gNr]],4,1,2] Gauge[[gNr,4]] ((mName /. gen1->gen3) part[SFields[[SA`DiracGauginos[[gNr,ig]]]],3] TA[Gauge[[gNr,2]],ADI[gNr] /. subGC[4],ToExpression[ToString[Gauge[[gNr,3]]]<>"b"]/.subGC[3],Gauge[[gNr,3]]/.subGC[3]] +conj[(mName /. gen1->gen3)] conj[part[SFields[[SA`DiracGauginos[[gNr,ig]]]],3]] TA[Gauge[[gNr,2]],ADI[gNr] /. subGC[4],Gauge[[gNr,3]]/.subGC[3],ToExpression[ToString[Gauge[[gNr,3]]]<>"b"]/.subGC[3]])  conj[part[SFields[[i]],1]]*part[SFields[[i]],2]makeDelta[i,1,2,{Gauge[[gNr,3]]}];
tempD=SumOverExpandedIndizes[tempD,{Fields[[i,3]],Fields[[i,3]],Fields[[SA`DiracGauginos[[gNr,ig]],3]]}];
tempD = 2 Sum[tempD,{gen4,1,Gauge[[gNr,2,1]]^2-1}];,
tempD= getGenerator[gNr,Fields[[i,3+gNr]],3,1,2] Gauge[[gNr,4]] ((mName /. gen1->gen3) part[SFields[[SA`DiracGauginos[[gNr,ig]]]],3]  +conj[(mName /. gen1->gen3)] conj[part[SFields[[SA`DiracGauginos[[gNr,ig]]]],3]])  conj[part[SFields[[i]],1]]*part[SFields[[i]],2]makeDelta[i,1,2,{Gauge[[gNr,3]]}];
tempD=SumOverExpandedIndizes[Sqrt[2] tempD,{Fields[[i,3]],Fields[[i,3]],Fields[[SA`DiracGauginos[[gNr,ig]],3]]}];
(* tempD = Sqrt[2] tempD sum[ADI[gNr] /. subGC[4],1,Gauge[[gNr,2,1]]^2-1]; *)
];
DTermsDirac-=tempD;,
DTermsDirac -=SumOverExpandedIndizes[Sqrt[2] Gauge[[gNr,4]] insGen1  ((mName /. gen1->gen3) part[SFields[[SA`DiracGauginos[[gNr,ig]]]],3]+conj[(mName /. gen1->gen3)] conj[part[SFields[[SA`DiracGauginos[[gNr,ig]]]],3]]) conj[part[SFields[[i]],1]]*part[SFields[[i]],2]makeDelta[i,1,2,{Gauge[[gNr,3]]}],{Fields[[i,3]],Fields[[i,3]],Fields[[SA`DiracGauginos[[gNr,ig]],3]]}];
];
ig++;]; 
]; 
If[Gauge[[gNr,2]]===U[1] && NoU1Mixing=!=True,
For[gNr2=1,gNr2<=AnzahlGauge,
If[Gauge[[gNr2,2]]===U[1] && gNr2!= gNr,
insGenU1 =  getGenerator[gNr2,Fields[[i,3+gNr2]],3,1,2] /. Lam[a__]->2;
temp1 += insGenU1 GaugesU1[gNr2,gNr] part[aGauge[[gNr]],3] conj[part[SFields[[i]],1]]*part[SFields[[i]],2]makeDelta[i,1,2,{Gauge[[gNr,3]]}];
 If[AddDiracGauginos,
For[ig=1,ig<=Length[SA`DiracGauginos[[gNr]]],
DTermsDirac -=SumOverExpandedIndizes[Sqrt[2]insGenU1 GaugesU1[gNr2,gNr] ((mName /. gen1->gen3)   part[SFields[[SA`DiracGauginos[[gNr,ig]]]],3]+conj[(mName /. gen1->gen3)  ] conj[part[SFields[[SA`DiracGauginos[[gNr,ig]]]],3]]) conj[part[SFields[[i]],1]]*part[SFields[[i]],2]makeDelta[i,1,2,{Gauge[[gNr,3]]}],{Fields[[i,3]],Fields[[i,3]],Fields[[SA`DiracGauginos[[gNr,ig]],3]]}];
ig++;];
];
];
gNr2++;];
];


auxP= SumOverExpandedIndizes[temp1,{Fields[[i,3]],Fields[[i,3]]}];
LagrangianAux+=auxP/I;

For[j=i,j<=AnzahlChiral,
If[Gauge[[gNr,5]]===False && Gauge[[gNr,2]]=!=U[1],
insGen1=1;
insGen2=1;,
insGen1=getGenerator[gNr,FieldDim[i,gNr],5,1,2];
insGen2=getGenerator[gNr,FieldDim[j,gNr],5,3,4];
];

insGen1U1=0; insGen2U1=0;
If[Gauge[[gNr,2]]===U[1] && NoU1Mixing=!=True,
For[gNr2=1,gNr2<=AnzahlGauge,
If[Gauge[[gNr2,2]]===U[1] && gNr2!= gNr,
insGen1U1 =  GaugesU1[gNr2,gNr] getGenerator[gNr2,FieldDim[i,gNr2],5,1,2];
insGen2U1 =  GaugesU1[gNr2,gNr] getGenerator[gNr2,FieldDim[j,gNr2],5,3,4];
];
gNr2++;];
];


If[(insGen1=!=0 || insGen1U1=!=0) && (insGen2=!=0  || insGen2U1=!=0),
temp1= (insGen1*Gauge[[gNr,4]] +insGen1U1) conj[part[SFields[[i]],1]]*part[SFields[[i]],2]makeDelta[i,1,2,{Gauge[[gNr,3]]}];
temp2= (insGen2*Gauge[[gNr,4]]+insGen2U1)  conj[part[SFields[[j]],3]]*part[SFields[[j]],4]makeDelta[j,3,4,{Gauge[[gNr,3]]}];

temp1= SumOverExpandedIndizes[temp1,{Fields[[i,3]],Fields[[i,3]]}];
temp2= SumOverExpandedIndizes[temp2,{None, None,Fields[[j,3]],Fields[[j,3]]}];


If[Gauge[[gNr,5]]===False,
If[Gauge[[gNr,2]]=!=U[1],
term1=DTermIndizes[gNr,i,j] temp1 *temp2;,
term1=temp1 *temp2;
];
term2=term1 /. Flatten[{subGCRE[1,5],subGCRE[2,6], subGCRE[3,7],subGCRE[4,8]}] /. Flatten[{subGCRE[8,2],subGCRE[7,1],subGCRE[6,4], subGCRE[5,3]}];,
term1=Sum[temp1 * temp2,{gen5,1,Gauge[[gNr,2,1]]^2-1}];
term2 = term1  /. Flatten[{subGCRE[1,5],subGCRE[2,6], subGCRE[3,7],subGCRE[4,8]}] /. Flatten[{subGCRE[8,2],subGCRE[7,1],subGCRE[6,4], subGCRE[5,3]}];
]; 
If[i==j,
DTerms[[gNr]] =Join[DTerms[[gNr]],{term1}];,
DTerms[[gNr]] =Join[DTerms[[gNr]],{term1,term2}];
];
];
j++;];
i++];
If[AddDiracGauginos,
For[ig=1,ig<=Length[SA`DiracGauginos[[gNr]]],
mName = ToExpression["MD"<>ToString[Gauge[[gNr,1]]]<>ToString[Fields[[SA`DiracGauginos[[gNr,ig]]]][[3]]]];
mName = genTest[mName,{Fields[[SA`DiracGauginos[[gNr,ig]]]][[3]]},False];
mName = mName (mName  /. gen1->gen2);
DTermsDirac += SumOverExpandedIndizes[-mName  part[SFields[[SA`DiracGauginos[[gNr,ig]]]],1] (part[SFields[[SA`DiracGauginos[[gNr,ig]]]],2])MakeIndexStructure[{Fields[[SA`DiracGauginos[[gNr,ig]],3]],Fields[[SA`DiracGauginos[[gNr,ig]],3]]}],{Fields[[SA`DiracGauginos[[gNr,ig]],3]],Fields[[SA`DiracGauginos[[gNr,ig]],3]]}];
 DTermsDirac +=SumOverExpandedIndizes[-mName  part[SFields[[SA`DiracGauginos[[gNr,ig]]]],1] (conj[part[SFields[[SA`DiracGauginos[[gNr,ig]]]],2]])MakeIndexStructure[{Fields[[SA`DiracGauginos[[gNr,ig]],3]],conj[Fields[[SA`DiracGauginos[[gNr,ig]],3]]]}],{Fields[[SA`DiracGauginos[[gNr,ig]],3]],Fields[[SA`DiracGauginos[[gNr,ig]],3]]}]; 
 DTermsDirac +=SumOverExpandedIndizes[-mName  conj[part[SFields[[SA`DiracGauginos[[gNr,ig]]]],1]] ( conj[part[SFields[[SA`DiracGauginos[[gNr,ig]]]],2]])MakeIndexStructure[{Fields[[SA`DiracGauginos[[gNr,ig]],3]],Fields[[SA`DiracGauginos[[gNr,ig]],3]]}],{Fields[[SA`DiracGauginos[[gNr,ig]],3]],Fields[[SA`DiracGauginos[[gNr,ig]],3]]}];
DTermsDirac +=SumOverExpandedIndizes[-mName  conj[part[SFields[[SA`DiracGauginos[[gNr,ig]]]],1]] (part[SFields[[SA`DiracGauginos[[gNr,ig]]]],2])MakeIndexStructure[{Fields[[SA`DiracGauginos[[gNr,ig]],3]],conj[Fields[[SA`DiracGauginos[[gNr,ig]],3]]]}],{Fields[[SA`DiracGauginos[[gNr,ig]],3]],Fields[[SA`DiracGauginos[[gNr,ig]],3]]}]; 
ig++;];
];
gNr++;];

DTerms = 1/2 Plus@@Flatten[DTerms] - DTermsDirac;

];



];

DTermIndizes[gauge_,field1_, field2_]:=Block[{},
temp=getGenerator[gauge,FieldDim[field1,gauge],5,1,2] *getGenerator[gauge,FieldDim[field2,gauge],5,3,4];
temp = Expand[temp]  /. {TA[dim_,a_,p1_,p2_] TA[dim_,a_,p3_,p4_] ->   1/2 Delta[p1,p4] Delta[p2,p3] -1/(2dim) Delta[p1,p2] Delta[p3,p4], 
Lam[a_,p1_,p2_] Lam[a_,p3_,p4_] ->  2 Delta[p1,p4] Delta[p2,p3] -2/3 Delta[p1,p2] Delta[p3,p4],
Sig[a_,p1_,p2_] Sig[a_,p3_,p4_] ->  2 Delta[p1,p4] Delta[p2,p3] - Delta[p1,p2] Delta[p3,p4]}; 

If[FreeQ[temp,Gauge[[gauge,3]]/.subGC[5]]==False,temp=temp*sum[Gauge[[gauge,3]]/.subGC[5],1,getDimAdjoint[Gauge[[gauge,2]]]]//.{(Gauge[[gauge,3]]/.subGC[5])->i9999};
];

Return[temp]; 

];

(* ---------- Gaugino Interaction ---------- *)


CalcGaugino:=Block[{i,j,k,g,c,a,ai},

Print["Calc Gaugino Interactions"];

FSG=0;

For[i=1,i<=AnzahlChiral,
For[j=1,j<=AnzahlGauge,
temp =makeDelta[i,1,3,{Gauge[[j,3]]}] Gauge[[j,4]]conj[part[SFields[[i]],3]]*getGenerator[j,FieldDim[i,j],2,3,1]*part[FFields[[i]],1]  part[FGauge[[j]],2];
FSG += SumOverExpandedIndizes[temp,{Fields[[i,3]],None,Fields[[i,3]]}];

temp=makeDelta[i,2,3,{Gauge[[j,3]]}]Gauge[[j,4]]  conj[part[FGauge[[j]],1]] conj[part[FFields[[i]],2]]*  getGenerator[j,Fields[[i,j+3]],1,2,3] *part[SFields[[i]],3];

FSG += SumOverExpandedIndizes[temp,{None,Fields[[i,3]],Fields[[i,3]]}];

If[Gauge[[j,2]]===U[1] && NoU1Mixing=!=True,
For[k=1,k<=AnzahlGauge,
If[Gauge[[k,2]]===U[1] && k!=j,
temp =makeDelta[i,1,3,{Gauge[[j,3]]}] GaugesU1[j,k]conj[part[SFields[[i]],3]]*getGenerator[j,FieldDim[i,j],2,3,1]*part[FFields[[i]],1]  part[FGauge[[k]],2];
FSG += SumOverExpandedIndizes[temp,{Fields[[i,3]],None,Fields[[i,3]]}];
temp=makeDelta[i,2,3,{Gauge[[j,3]]}]GaugesU1[j,k]  conj[part[FGauge[[k]],1]] conj[part[FFields[[i]],2]]*  getGenerator[j,Fields[[i,j+3]],1,2,3] *part[SFields[[i]],3];

FSG += SumOverExpandedIndizes[temp,{None,Fields[[i,3]],Fields[[i,3]]}];
];
k++;];
];
j++;];
i++;];

FSGaugino = Sqrt[2] (FSG + (FSG /. {A_[1]->A[2],A_[2]->A[1]}));

(* ----------- Boson-Gaugino-Interaction ----------*)

Print["Calculate Vector Boson - Gaugino - Interactions"];

BosonGaugino =0;

For[gNr=1,gNr<=Length[Gauge],
If[Gauge[[gNr,2,1]]>1,
ai=ADI[gNr];
BosonGaugino += conj[part[FGauge[[gNr]],1]] (Gauge[[gNr,4]] getStructureConstant[gNr,ai /. subGC[2],ai /. subGC[1],ai /. subGC[3]] part[SGauge[[gNr]],3] gamma[lor3] part[FGauge[[gNr]],2]);
BosonGaugino -= part[FGauge[[gNr]],1] (Gauge[[gNr,4]] getStructureConstant[gNr,ai /. subGC[1],ai /. subGC[2],ai /. subGC[3]] gamma[lor3] part[SGauge[[gNr]],3] conj[part[FGauge[[gNr]],2]]);
];
gNr++;
];
];

(* ---------- Gauge Interaction ---------- *)

CalcVectorBoson:=Block[{},
Print["Calculate Vector Boson Self Interactions"];

GaugeTri=0;
GaugeQuad=0;
GaugeBi=0;

For[i=1,i<=Length[Gauge],
GaugeBi+=Gauge[[i,4]] g[lor1,lor3] g[lor2,lor4](Deri[part[SGauge[[i]],1],lor2] -Deri[part[SGauge[[i]],2],lor1])(Deri[part[SGauge[[i]],3],lor4] -Deri[part[SGauge[[i]],4],lor3]);
If[Gauge[[i,2,1]]==1,
For[j=i+1,j<=Length[Gauge],
If[Gauge[[j,2,1]]==1,
GaugeBi+=ToExpression[ToString[Gauge[[i,4]]]<>StringDrop[ToString[Gauge[[j,4]]],1]]g[lor1,lor3] g[lor2,lor4](Deri[part[SGauge[[i]],1],lor2] -Deri[part[SGauge[[i]],2],lor1])(Deri[part[SGauge[[j]],3],lor4] -Deri[part[SGauge[[j]],4],lor3]);
];
j++;];
];
If[Gauge[[i,2,1]]>1,
ai=ADI[i];
GaugeTri += - Gauge[[i,4]] getStructureConstant[i,ai /. subGC[1],ai /. subGC[2],ai /. subGC[3]] Deri[part[SGauge[[i]],1],lor2] *part[SGauge[[i]],2]*part[SGauge[[i]],3]g[lor1,lor3];
GaugeQuad += 1/4 Gauge[[i,4]]^2 (getStructureConstant[i,ai /. subGC[5],ai /. subGC[1],ai /. subGC[2]] getStructureConstant[i,ai /. subGC[5],ai /. subGC[3],ai /. subGC[4]] sum[ai /. subGC[5],1,Gauge[[i,2,1]]^2-1](g[lor2,lor4] g[lor3,lor1])) part[SGauge[[i]],1]*part[SGauge[[i]],2] part[SGauge[[i]],3]*part[SGauge[[i]],4];
];
i++;];

GaugeTri=-GaugeTri-GaugeBi;
GaugeQuad=-GaugeQuad;




];


(*-------------------------------*)
(* Additional Terms *)
(*-------------------------------*)

CalcAdditionalLag[def_] :=Block[{i,j,k, fermNr, particles, coeff, LagRe,LagAddVVV,LagAddVVVV,AddPot,AddKin,newParticle,temp,sub,temp2},
LagRe = 0;
LagAddVVV = 0;
LagAddVVVV = 0;
AddPot = 0;
AddKin=0;
For[i=1,i<=Length[def],
particles=1;
fermNr=1;
particleNr=1;
sub={};
temp2={};
For[j=1,j<=Length[def[[i,1]]],
If[Head[def[[i,1,j]]]===Der,
newParticle=def[[i,1,j,1]];
derivative=True;
sub=Flatten[Table[{genf[k]->genf[k+1]},{k,j,Length[def[[i,1]]]}]];,
If[Head[def[[i,1,j]]]===conj || Head[def[[i,1,j]]]===bar,
head=Head[def[[i,1,j]]];,
head=Evaluate;
];
newParticle=RE[def[[i,1,j]]];
derivative=False;
];

If[FreeQ[SFields,newParticle]==False,
pos = Position[SFields,newParticle][[1,1]];
temp2 = Join[temp2,{Fields[[pos,3]]}];
];
If[FreeQ[FFields,newParticle]==False,
pos = Position[FFields,newParticle][[1,1]];
temp2 = Join[temp2,{Fields[[pos,3]]}];
];

If[getTypeOld[newParticle]===F,
If[derivative==True,
particles*=(Deri[RE[getFull2[newParticle][fermNr]/.subGC[particleNr]],(lorentz /. subGC[particleNr+1])]) sum[genf[particleNr],getGenStart[newParticle],getGen[newParticle]];
particleNr=particleNr+2;,
particles*=(head[RE[getFull2[newParticle][fermNr]/.subGC[particleNr]]]) sum[genf[particleNr],getGenStart[newParticle],getGen[newParticle]];
particleNr++;
];
fermNr++;,
If[derivative==True,
particles*=Deri[RE[getFull2[newParticle]/.subGC[particleNr]],(lorentz /. subGC[particleNr+1])]sum[genf[particleNr],getGenStart[newParticle],getGen[newParticle]];
particleNr=particleNr+2;,
particles*=(head[RE[getFull2[newParticle]/.subGC[particleNr]]]) sum[genf[particleNr],getGenStart[newParticle],getGen[newParticle]];
particleNr++;
];
];
j++;];
temp=def[[i,2,1]]*(genTest[def[[i,2,2]],def[[i,1]],False]/.sub)*particles;
If[FreeQ[def[[i]],NoHC]==True,
temp=temp+(conj[temp]/.{A_[1]->A[2],A_[2]->A[1],A_[3]->A[4],A_[4]->A[3]});
];
If[temp2=!={},
temp = SumOverExpandedIndizes[temp,temp2];
];

If[FreeQ[def[[i]],Overwrite]==False,
LagRe+=temp;,
Switch[getPartCode[def[[i,1]]],
20,AddKin+=temp;,
2000,AddPot+=temp;,
200,AddPot+=temp;,
300,AddPot+=temp;,
400,AddPot+=temp;,
2100, AddPot+=temp;,
2010, AddKin+=temp;,
210, AddKin +=temp;,
220, AddKin+=temp;,
120, AddKin+=temp;,
30, LagVVVAdd+=temp;,
40, LagVVVVAdd+=temp;
];
];
i++;];
Return[{LagRe,LagAddVVV,LagAddVVVV,AddPot,AddKin}];

];





(*-----------------------------------------*)
(* Complete Lagrangian  *)
(*-----------------------------------------*)


CalcLagrangian:=Block[{},

Print["Calc Complete Lagrangian"];
Kinetic =  +  KinFerm + KinScalar + BosonGaugino; 
LagrangianVVV=GaugeTri;
LagrangianVVVV=GaugeQuad;
Potential = Matter + Soft + DTerms + FSGaugino ;
Lagrangian = Kinetic+LagrangianVVV+LagrangianVVVV - Potential;

LGhost=0;
];

CheckAdjoints:=Block[{i,j,k,l,sub,ai,subF,subS,subgr},
genMax=10;
For[i=1,i<=Length[Gauge],
If[Gauge[[i,2]]=!=U[1] && Gauge[[i,5]]===False,
For[j=1,j<=Length[SA`DiracGauginos[[i]]],
ai=ADI[i];
subgr = {NAME[{gen_,a_,b_}][i_]->NAME,NAME[{gen_,a_,b_}]->NAME};
subF={NAME[{gen_,a_,b_}][i_]:>sum[genf[6+ToExpression[StringTake[ToString[gen],{4}]]],GetGenStart[NAME],GetGen[NAME]]Delta[gen,genf[6+ToExpression[StringTake[ToString[gen],{4}]]]]NAME[{genf[6+ToExpression[StringTake[ToString[gen],{4}]]],AI /. subGC[6+ToExpression[StringTake[ToString[gen],{4}]]]}][i]  Sqrt[2]TA[GAUGE,AI /. subGC[6+ToExpression[StringTake[ToString[gen],{4}]]],a,b] sum[AI /. subGC[6+ToExpression[StringTake[ToString[gen],{4}]]],1,NR]  } /. GAUGE->Gauge[[i,2]] /. NR->Gauge[[i,2,1]]^2-1;
subS={NAME[{gen_,a_,b_}]:>sum[genf[6+ToExpression[StringTake[ToString[gen],{4}]]],GetGenStart[NAME],GetGen[NAME]]Delta[gen,genf[6+ToExpression[StringTake[ToString[gen],{4}]]]]NAME[{genf[6+ToExpression[StringTake[ToString[gen],{4}]]],AI /. subGC[6+ToExpression[StringTake[ToString[gen],{4}]]]}]  Sqrt[2] TA[GAUGE,AI /. subGC[6+ToExpression[StringTake[ToString[gen],{4}]]],a,b] sum[AI /. subGC[6+ToExpression[StringTake[ToString[gen],{4}]]],1,NR] } /. GAUGE->Gauge[[i,2]] /. NR->Gauge[[i,2,1]]^2-1;

sub = Flatten[{subF  /. NAME->FFields[[SA`DiracGauginos[[i,j]],0]] /. AI->ai,subS  /. NAME->SFields[[SA`DiracGauginos[[i,j]],0]] /. AI->ai,subS  /. NAME->AFields[[SA`DiracGauginos[[i,j]],0]] /. AI->ai}];

subgr=Flatten[{subgr /. NAME->FFields[[SA`DiracGauginos[[i,j]],0]],subgr /. NAME->SFields[[SA`DiracGauginos[[i,j]],0]],subgr /. NAME->AFields[[SA`DiracGauginos[[i,j]],0]]}];

subsave=sub;

Kinetic = Kinetic //.sub;
Potential = Potential//.sub;
Lagrangian = Lagrangian//.sub;

Particles[ALL] = Particles[ALL] //. {FFields[[SA`DiracGauginos[[i,j]],0]],a_,b_,F,{generation,d__}}-> {FFields[[SA`DiracGauginos[[i,j]],0]],a,b,F,{generation,ai}} //. {SFields[[SA`DiracGauginos[[i,j]],0]],a_,b_,S,{generation,d__}}-> {SFields[[SA`DiracGauginos[[i,j]],0]],a,b,S,{generation,ai}}//. {AFields[[SA`DiracGauginos[[i,j]],0]],a_,b_,A,{generation,d__}}-> {AFields[[SA`DiracGauginos[[i,j]],0]],a,b,A,{generation,ai}};

Particles[Current]=Particles[ALL];

j++;];
];
i++;];
 ];
