Off[General::spell]

Model`Name = "radinert";
Model`NameLaTeX ="T1-3-A";
Model`Authors = "Diego Restrepo (based on SM model by F.Staub)";
Model`Date = "2013-11-27";

(* 2013-01-24: changed normalization of lambda term to convention of hep-ph/0207271 *)
(* 2013-06-24: using new name conventions (without inital "S" and "F" for scalar and matter fields) *)
(* 2013-09-01: changing to new conventions for FermionFields/MatterFields *)
(* 2013-11-20: Singlet Scalar DM implemented *)


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Global Symmetries *)

Global[[1]] = {Z[2], Z2};


(* Gauge Groups *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False,1};
Gauge[[2]]={WB, SU[2], left,        g2,True,1};
Gauge[[3]]={G,  SU[3], color,       g3,False,1};


(* Matter Fields *)

FermionFields[[1]] = {q, 3, {uL, dL},     1/6, 2,  3,1};  
FermionFields[[2]] = {l, 3, {vL, eL},    -1/2, 2,  1,1};
FermionFields[[3]] = {d, 3, conj[dR],     1/3, 1, -3,1};
FermionFields[[4]] = {u, 3, conj[uR],    -2/3, 1, -3,1};
FermionFields[[5]] = {e, 3, conj[eR],       1, 1,  1,1};
FermionFields[[6]] = {n, 1, nR,             0, 1,  1,-1};
FermionFields[[7]] = {rd, 1, {vd, ed},   -1/2, 2,  1,-1};
FermionFields[[8]] = {ru, 1, {- eu,vu},     1/2, 2,  1,-1};

ScalarFields[[1]] =  {H, 1, {Hp, H0},     1/2, 2,  1,1};
(*To a single family scalar 2->1, comment the mixing below and
  uncomment the definition in particle.m  *)
ScalarFields[[2]] = {SP, 3, sss,             0, 1,  1,-1};
RealScalars = {SP};

(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][LagrangianInput]= {
	{LagHCSM, {AddHC->True}},
	{VSM,{AddHC->False}},
        {VS,{AddHC->False}},
	{LMajorana,{AddHC->True}},
	{LagIFD, {AddHC->True}}
};


VSM = -(mu2 conj[H].H + Lambda1/2 conj[H].H.conj[H].H);
VS  = -(MS2/2 conj[SP].SP + LamSH conj[SP].SP.conj[H].H + LamS/2 conj[SP].SP.conj[SP].SP   ); 
LMajorana = -Mn/2 n.n ;
LagHCSM =  Yd conj[H].d.q + Ye conj[H].e.l + Yu H.u.q;
LagIFD = -(-MDF rd.ru + YR1 ru.l.SP + YR3 H.n.rd + YR4 conj[H].n.ru);
 			  		  
(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3]},{VP,VZ},ZZ},
  {{VWB[1],VWB[2]},{VWp,conj[VWp]},ZW}
};     
        

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
  {    {H0, {v, 1/Sqrt[2]}, {Ah, \[ImaginaryI]/Sqrt[2]},{hh, 1/Sqrt[2]}} };
 

DEFINITION[EWSB][MatterSector]=   
    {{{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
     {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
     {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}},
     {{nR, vd, vu}, {Rv0, ZvN}},
     {{vL},{VL,Vv}}
     (*To recover a single family scalar singlet, comment the next
     line and unccomment definition of sss in particles.m*)
     ,{{sss},{Ss, VSs}}
    };  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]},
 Fv ->{  VL, conj[VL]},
 Fre ->{  ed, conj[eu]},
 Nv0 ->{ Rv0, conj[Rv0]}
 };

DEFINITION[EWSB][GaugeES]={
 Fd1 ->{  FdL, 0},
 Fd2 ->{  0, FdR},
 Fu1 ->{  Fu1, 0},
 Fu2 ->{  0, Fu2},
 Fe1 ->{  Fe1, 0},
 Fe2 ->{  0, Fe2}};



