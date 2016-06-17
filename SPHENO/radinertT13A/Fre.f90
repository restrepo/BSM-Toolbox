! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 11:51 on 17.6.2016   
! ----------------------------------------------------------------------  
 
 
Module Fre3Decays_radinertT13A 
 
Use Control 
Use CouplingsForDecays_radinertT13A 
Use ThreeBodyPhaseSpace 
 
Contains 
 
Subroutine FreThreeBodyDecay(n_in,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,              & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,MVWp2,MVZ,MVZ2,           & 
& TW,ZDR,ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,LSH,Yu,Yd,Ye,YR3,             & 
& YR1,YR4,Mn,MDF,mu2,MS2,v,gTSs,gTVWp,gFreNv0FvFe,gFreNv0cFuFd,epsI,deltaM,              & 
& CheckRealStates,gT,gPartial,BR)

Implicit None 
 
Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFre,MFre2,MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh,Mhh2,MHp,MHp2,MNv0(3),MNv02(3),MSs(3),MSs2(3),MVWp,MVWp2,MVZ,              & 
& MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),VSs(3,3),ZUL(3,3),Vv(3,3),               & 
& ZvN(3,3),ZW(2,2)

Complex(dp) :: cplcFreFeSsL(3,3),cplcFreFeSsR(3,3),cplcFreNv0cVWpL(3),cplcFreNv0cVWpR(3),            & 
& cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplFvFeVWpL(3,3),cplFvFeVWpR(3,3),cplFvNv0SsL(3,3,3),& 
& cplFvNv0SsR(3,3,3)

Real(dp),Intent(in) :: g1,g2,g3,YR3,YR1(3,3),YR4,MS2(3,3),v

Complex(dp),Intent(in) :: Lam,LSH(3,3),Yu(3,3),Yd(3,3),Ye(3,3),Mn,MDF,mu2

Real(dp),Intent(inout) :: gFreNv0FvFe(1,3,3,3),gFreNv0cFuFd(1,3,3,3)

Real(dp),Intent(in) :: gTSs(3),gTVWp

Real(dp) :: gFreNv0FvFei(3,3,3),gFreNv0cFuFdi(3,3,3)

Real(dp) :: gTSstemp(3),gTVWptemp
Integer :: NVs,NVst,NSs,NVVst,NVVss,NVSss,NVSst,NSSss,NSSst
Complex(dp), Allocatable :: IntegralVVst(:,:),IntegralVSss(:,:),IntegralVSst(:,:),IntegralSSss(:,:)               & 
& ,IntegralSSst(:,:)
Real(dp), Allocatable :: IntegralVs(:,:),IntegralVst(:,:),IntegralSs(:,:),IntegralVVss(:,:)
Real(dp), Intent(inout), Optional :: BR(:,:), gPartial(:,:) 
Real(dp), Intent(inout) :: gT 
Integer, Intent(in) :: n_in 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Intent(in) ::  CheckRealStates 
Integer :: i_start, i_end, i_run, n_out, n_length, gt1, gt2, gt3, i1 
Logical :: check 
Iname = Iname +1 
NameOfUnit(Iname) = 'FreThreeBodyDecay' 
 
Allocate( IntegralVs(25000,9) ) 
Allocate( IntegralVst(25000,12) ) 
Allocate( IntegralSs(500000,10) ) 
Allocate( IntegralVVst(25000,12) ) 
Allocate( IntegralVVss(500000,12) ) 
Allocate( IntegralVSss(500000,12) ) 
Allocate( IntegralVSst(500000,16) ) 
Allocate( IntegralSSss(500000,12) ) 
Allocate( IntegralSSst(500000,16) ) 

 
If (CheckRealStates) Then 
gTSstemp = 0._dp 
gTVWptemp = 0._dp 
Else 
gTSstemp = gTSs 
gTVWptemp = gTVWp 
End If 
 
check=CheckRealStates 

 
If (n_in.Lt.0) Then 
 i_start = 1 
 i_end = 1 
 Else If ( (n_in.Ge.1).And.(n_in.Le. 1) ) Then 
 i_start = n_in 
 i_end = n_in 
Else 
 If (ErrorLevel.Ge.-1) Then 
   Write (ErrCan, *) 'Problem in subroutine'//NameOfUnit(Iname) 
   Write (ErrCan, *) 'Value of n_in out of range, (n_in,1) = ',n_in,1 
 End If 
 
 If (ErrorLevel.Gt.0) Call TerminateProgram 
 
 If (Present(BR)) BR = 0._dp 
 Iname = Iname - 1 
 Return 
End If 
 
i_run = 1 
 
Call CouplingsFor_Fre_decays_3B(MFre,i_run,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,           & 
& MFre2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,MVWp2,              & 
& MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,LSH,Yu,              & 
& Yd,Ye,YR3,YR1,YR4,Mn,MDF,mu2,MS2,v,cplcFreFeSsL,cplcFreFeSsR,cplcFreNv0cVWpL,          & 
& cplcFreNv0cVWpR,cplcFuFdVWpL,cplcFuFdVWpR,cplFvFeVWpL,cplFvFeVWpR,cplFvNv0SsL,         & 
& cplFvNv0SsR,deltaM)

IntegralVs = 0._dp 
NVs = 0  
IntegralVst = 0._dp 
NVst = 0  
IntegralSs = 0._dp 
NSs = 0  
IntegralVVst = 0._dp 
NVVst = 0  
IntegralVVss = 0._dp 
NVVss = 0  
IntegralVSss = 0._dp 
NVSss = 0  
IntegralVSst = 0._dp 
NVSst = 0  
IntegralSSss = 0._dp 
NSSss = 0  
IntegralSSst = 0._dp 
NSSst = 0  

 
gFreNv0FvFei = 0._dp 
Call FreToNv0FvFe(i_run,MNv0,MFv,MFe,MVWp,MSs,MFre,cplcFreFeSsL,cplcFreFeSsR,         & 
& cplcFreNv0cVWpL,cplcFreNv0cVWpR,cplFvFeVWpL,cplFvFeVWpR,cplFvNv0SsL,cplFvNv0SsR,       & 
& IntegralSs,IntegralSSss,IntegralVs,IntegralVSst,IntegralVVss,NSs,NSSss,NVs,            & 
& NVSst,NVVss,gTVWptemp,gTSstemp,deltaM,epsI,check,gFreNv0FvFei)

gFreNv0FvFe(i_run,:,:,:) = gFreNv0FvFei 
gT = gT + Sum(gFreNv0FvFei) 
 
gFreNv0cFuFdi = 0._dp 
Call FreToNv0cFuFd(i_run,MNv0,MFu,MFd,MVWp,MFre,cplcFreNv0cVWpL,cplcFreNv0cVWpR,      & 
& cplcFuFdVWpL,cplcFuFdVWpR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWptemp,deltaM,          & 
& epsI,check,gFreNv0cFuFdi)

gFreNv0cFuFd(i_run,:,:,:) = gFreNv0cFuFdi 
gT = gT + Sum(gFreNv0cFuFdi) 
 
If (Present(gPartial)) Then
Do i1 = i_start, i_end 
 
n_length=1
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFreNv0FvFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFreNv0cFuFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
If (Present(BR).And.(gT.Gt.0._dp)) Then 
BR(i1,:)=gPartial(i1,:)/gT
Else If (Present(BR)) Then
BR(i1,:)=0._dp
End If
 
End Do 
End if 
Deallocate( IntegralVs ) 
Deallocate( IntegralVst ) 
Deallocate( IntegralSs ) 
Deallocate( IntegralVVst ) 
Deallocate( IntegralVVss ) 
Deallocate( IntegralVSss ) 
Deallocate( IntegralVSst ) 
Deallocate( IntegralSSss ) 
Deallocate( IntegralSSst ) 
Iname = Iname - 1 
 
End Subroutine FreThreeBodyDecay
 
 
Subroutine FreToNv0FvFe(iIN,MNv0,MFv,MFe,MVWp,MSs,MFre,cplcFreFeSsL,cplcFreFeSsR,     & 
& cplcFreNv0cVWpL,cplcFreNv0cVWpR,cplFvFeVWpL,cplFvFeVWpR,cplFvNv0SsL,cplFvNv0SsR,       & 
& IntegralSs,IntegralSSss,IntegralVs,IntegralVSst,IntegralVVss,NSs,NSSss,NVs,            & 
& NVSst,NVVss,gTVWp,gTSs,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MNv0(3),MFv(3),MFe(3),MVWp,MSs(3),MFre

Complex(dp),Intent(in) :: cplcFreFeSsL(3,3),cplcFreFeSsR(3,3),cplcFreNv0cVWpL(3),cplcFreNv0cVWpR(3),            & 
& cplFvFeVWpL(3,3),cplFvFeVWpR(3,3),cplFvNv0SsL(3,3,3),cplFvNv0SsR(3,3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSst(500000,16)

Real(dp),Intent(inout) :: gTVWp,gTSs(3)

Integer, Intent(inout) :: NSs,NSSss,NVs,NVSst,NVVss
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFre 
 
Isum = 16 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFre).gt.(Abs(MFe(gt3))+Abs(MFv(gt2))+Abs(MNv0(gt1)))) Then 
!-------------- 
!  conj[VWp] 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWp 
Boson2(2) =gTVWp 
 
Boson4(1) = MVWp 
Boson4(2) =gTVWp 
Boson4(3) = MVWp 
Boson4(4) =gTVWp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MNv0(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFreNv0cVWpL(gt1)) 
coup(1) = Conjg(cplcFreNv0cVWpR(gt1)) 
coup(4) = Conjg(cplFvFeVWpL(gt2,gt3)) 
coup(3) = Conjg(cplFvFeVWpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fre->Nv0 Fv Fe Propagator: conj[VWp]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWp]'



!-------------- 
!  Ss 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
Boson2(1) = MSs(i1) 
Boson2(2) =gTSs(i1) 
 
Boson4(1) = MSs(i1) 
Boson4(2) =gTSs(i1) 
Boson4(3) = MSs(i1) 
Boson4(4) =gTSs(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt3) 
mass(3) = -MNv0(gt1) 
mass(4) = MFv(gt2) 
 
coup(2) = Conjg(cplcFreFeSsL(gt3,i1)) 
coup(1) = Conjg(cplcFreFeSsR(gt3,i1)) 
coup(4) = Conjg(cplFvNv0SsL(gt2,gt1,i1)) 
coup(3) = Conjg(cplFvNv0SsR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fre->Nv0 Fv Fe Propagator: Ss" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ss'
      End Do 



!-------------- 
!  conj[VWp], Ss 
!-------------- 
  Do i2=1,3
Boson4(1) = MVWp 
Boson4(2) = gTVWp 
Boson4(3) = MSs(i2) 
Boson4(4) = gTSs(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(4) = MNv0(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcFreNv0cVWpL(gt1) 
coup2(2) = cplcFreNv0cVWpR(gt1) 
coup2(3) = Conjg(cplcFreFeSsL(gt3,i2)) 
coup2(4) = Conjg(cplcFreFeSsR(gt3,i2))  
coup2(5) = cplFvFeVWpL(gt2,gt3) 
coup2(6) = cplFvFeVWpR(gt2,gt3) 
coup2(7) = Conjg(cplFvNv0SsL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplFvNv0SsR(gt2,gt1,i2)) 
coupT = coup2(2) 
coup2(2) = coup2(1) 
coup2(1) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fre->Nv0 Fv Fe Propagator: conj[VWp],Ss" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWp],Ss'
      End Do 



!-------------- 
!  Ss, Ss 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Boson4(1) = MSs(i1) 
Boson4(2) = gTSs(i1) 
Boson4(3) = MSs(i2) 
Boson4(4) = gTSs(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(3) = -MNv0(gt1) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcFreFeSsL(gt3,i1) 
coup2(2) = cplcFreFeSsR(gt3,i1) 
coup2(3) = Conjg(cplcFreFeSsL(gt3,i2)) 
coup2(4) = Conjg(cplcFreFeSsR(gt3,i2))  
coup2(5) = cplFvNv0SsL(gt2,gt1,i1) 
coup2(6) = cplFvNv0SsR(gt2,gt1,i1) 
coup2(7) = Conjg(cplFvNv0SsL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplFvNv0SsR(gt2,gt1,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fre->Nv0 Fv Fe Propagator: Ss,Ss" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ss,Ss'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:16))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFre)**3*g
End Subroutine FreToNv0FvFe 
 
 
Subroutine FreToNv0cFuFd(iIN,MNv0,MFu,MFd,MVWp,MFre,cplcFreNv0cVWpL,cplcFreNv0cVWpR,  & 
& cplcFuFdVWpL,cplcFuFdVWpR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWp,deltaM,              & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MNv0(3),MFu(3),MFd(3),MVWp,MFre

Complex(dp),Intent(in) :: cplcFreNv0cVWpL(3),cplcFreNv0cVWpR(3),cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3)

Real(dp),Intent(inout) :: IntegralVs(25000,9),IntegralVVss(500000,12)

Real(dp),Intent(inout) :: gTVWp

Integer, Intent(inout) :: NVs,NVVss
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFre 
 
Isum = 1 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFre).gt.(Abs(MFd(gt3))+Abs(MFu(gt2))+Abs(MNv0(gt1)))) Then 
!-------------- 
!  conj[VWp] 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWp 
Boson2(2) =gTVWp 
 
Boson4(1) = MVWp 
Boson4(2) =gTVWp 
Boson4(3) = MVWp 
Boson4(4) =gTVWp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MNv0(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFreNv0cVWpL(gt1)) 
coup(1) = Conjg(cplcFreNv0cVWpR(gt1)) 
coup(4) = Conjg(cplcFuFdVWpL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFdVWpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fre->Nv0 cFu Fd Propagator: conj[VWp]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWp]'



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:1))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFre)**3*g
End Subroutine FreToNv0cFuFd 
 
 
End Module Fre3Decays_radinertT13A 
 
