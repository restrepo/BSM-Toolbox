! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 12:33 on 3.11.2016   
! ----------------------------------------------------------------------  
 
 
Module Fd3Decays_radinertDTFDTSDM 
 
Use Control 
Use CouplingsForDecays_radinertDTFDTSDM 
Use ThreeBodyPhaseSpace 
 
Contains 
 
Subroutine FdThreeBodyDecay(n_in,MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,             & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,             & 
& MXO,MXO2,MXP,MXP2,O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,ZX0,ZXP,ZZ,g1,              & 
& g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,              & 
& MDF,mu,mH2,mEt2,mu3,v,gThh,gTVWp,gTVZ,gFdFdcChiChi,gFdFdcFdFd,gFdFdcFeFe,              & 
& gFdFdcFuFu,gFdFdNvNv,gFdFdFvFv,gFdFuFvFe,gFdFucChiNv,epsI,deltaM,CheckRealStates,      & 
& gT,gPartial,BR)

Implicit None 
 
Real(dp),Intent(in) :: MAh,MAh2,MChi(2),MChi2(2),MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),            & 
& MFu2(3),MFv(3),MFv2(3),Mhh,Mhh2,MHp,MHp2,MNv(3),MNv2(3),MVWp,MVWp2,MVZ,MVZ2,           & 
& MXO(2),MXO2(2),MXP(2),MXP2(2),TW,ZZ(2,2)

Complex(dp),Intent(in) :: O(3,3),Q2(2,2),Q3(2,2),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),         & 
& Vv(3,3),ZW(2,2),ZX0(2,2),ZXP(2,2)

Complex(dp) :: cplcChiChihhL(2,2),cplcChiChihhR(2,2),cplcChiChiVZL(2,2),cplcChiChiVZR(2,2),          & 
& cplcChiNvVWpL(2,3),cplcChiNvVWpR(2,3),cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),               & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),               & 
& cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFdVWpL(3,3), & 
& cplcFuFdVWpR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3), & 
& cplFvFeVWpL(3,3),cplFvFeVWpR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplNvNvhhL(3,3),     & 
& cplNvNvhhR(3,3),cplNvNvVZL(3,3),cplNvNvVZR(3,3)

Real(dp),Intent(in) :: g1,g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,eta(3),A,B,Yf(3),Y3(3),              & 
& MTF,MDF,mu,mH2,mEt2,mu3,v

Complex(dp),Intent(in) :: Yu(3,3),Yd(3,3),Ye(3,3)

Real(dp),Intent(inout) :: gFdFdcChiChi(3,3,2,2),gFdFdcFdFd(3,3,3,3),gFdFdcFeFe(3,3,3,3),gFdFdcFuFu(3,3,3,3),    & 
& gFdFdNvNv(3,3,3,3),gFdFdFvFv(3,3,3,3),gFdFuFvFe(3,3,3,3),gFdFucChiNv(3,3,2,3)

Real(dp),Intent(in) :: gThh,gTVWp,gTVZ

Real(dp) :: gFdFdcChiChii(3,2,2),gFdFdcFdFdi(3,3,3),gFdFdcFeFei(3,3,3),gFdFdcFuFui(3,3,3),        & 
& gFdFdNvNvi(3,3,3),gFdFdFvFvi(3,3,3),gFdFuFvFei(3,3,3),gFdFucChiNvi(3,2,3)

Real(dp) :: gThhtemp,gTVWptemp,gTVZtemp
Integer :: NVs,NVst,NSs,NVVst,NVVss,NVSss,NVSst,NSSss,NSSst
Complex(dp), Allocatable :: IntegralVVst(:,:),IntegralVSss(:,:),IntegralVSst(:,:),IntegralSSss(:,:)               & 
& ,IntegralSSst(:,:)
Real(dp), Allocatable :: IntegralVs(:,:),IntegralVst(:,:),IntegralSs(:,:),IntegralVVss(:,:)
Real(dp), Intent(inout), Optional :: BR(:,:), gPartial(:,:) 
Real(dp), Intent(inout) :: gT(:) 
Integer, Intent(in) :: n_in 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Intent(in) ::  CheckRealStates 
Integer :: i_start, i_end, i_run, n_out, n_length, gt1, gt2, gt3, i1 
Logical :: check 
Iname = Iname +1 
NameOfUnit(Iname) = 'FdThreeBodyDecay' 
 
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
gThhtemp = 0._dp 
gTVWptemp = 0._dp 
gTVZtemp = 0._dp 
Else 
gThhtemp = gThh 
gTVWptemp = gTVWp 
gTVZtemp = gTVZ 
End If 
 
check=CheckRealStates 

 
If (n_in.Lt.0) Then 
 i_start = 1 
 i_end = 3 
 Else If ( (n_in.Ge.1).And.(n_in.Le. 3) ) Then 
 i_start = n_in 
 i_end = n_in 
Else 
 If (ErrorLevel.Ge.-1) Then 
   Write (ErrCan, *) 'Problem in subroutine'//NameOfUnit(Iname) 
   Write (ErrCan, *) 'Value of n_in out of range, (n_in,3) = ',n_in,3 
 End If 
 
 If (ErrorLevel.Gt.0) Call TerminateProgram 
 
 If (Present(BR)) BR = 0._dp 
 Iname = Iname - 1 
 Return 
End If 
 
Do i_run = i_start, i_end 
 
Call CouplingsFor_Fd_decays_3B(MFd(i_run),i_run,MAh,MAh2,MChi,MChi2,MetI,             & 
& MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,             & 
& MVWp2,MVZ,MVZ2,MXO,MXO2,MXP,MXP2,O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,             & 
& ZX0,ZXP,ZZ,g1,g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,              & 
& A,B,Yf,Y3,MTF,MDF,mu,mH2,mEt2,mu3,v,cplcChiChihhL,cplcChiChihhR,cplcChiChiVZL,         & 
& cplcChiChiVZR,cplcChiNvVWpL,cplcChiNvVWpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,         & 
& cplcFdFdVZR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,           & 
& cplcFeFeVZR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplFvFeVWpL,cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,cplNvNvhhL,cplNvNvhhR,       & 
& cplNvNvVZL,cplNvNvVZR,deltaM)

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

 
gFdFdcChiChii = 0._dp 
Call FdToFdcChiChi(i_run,MFd,MChi,MVZ,Mhh,cplcChiChihhL,cplcChiChihhR,cplcChiChiVZL,  & 
& cplcChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,IntegralSs,              & 
& IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,           & 
& gTVZtemp,gThhtemp,deltaM,epsI,check,gFdFdcChiChii)

gFdFdcChiChi(i_run,:,:,:) = gFdFdcChiChii 
gT(i_run) = gT(i_run) + Sum(gFdFdcChiChii) 
 
gFdFdcFdFdi = 0._dp 
Call FdToFdcFdFd(i_run,MFd,MVZ,Mhh,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,               & 
& cplcFdFdVZR,IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,              & 
& IntegralVSst,IntegralVVss,IntegralVVst,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,          & 
& NVVst,gTVZtemp,gThhtemp,deltaM,epsI,check,gFdFdcFdFdi)

gFdFdcFdFd(i_run,:,:,:) = gFdFdcFdFdi 
gT(i_run) = gT(i_run) + Sum(gFdFdcFdFdi) 
 
gFdFdcFeFei = 0._dp 
Call FdToFdcFeFe(i_run,MFd,MFe,MVZ,Mhh,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,           & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,IntegralSs,IntegralSSss,   & 
& IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZtemp,               & 
& gThhtemp,deltaM,epsI,check,gFdFdcFeFei)

gFdFdcFeFe(i_run,:,:,:) = gFdFdcFeFei 
gT(i_run) = gT(i_run) + Sum(gFdFdcFeFei) 
 
gFdFdcFuFui = 0._dp 
Call FdToFdcFuFu(i_run,MFd,MFu,MVZ,MVWp,Mhh,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,      & 
& cplcFdFdVZR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,         & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,   & 
& IntegralVSst,IntegralVVss,IntegralVVst,NSs,NSSss,NVs,NVSss,NVSst,NVVss,NVVst,          & 
& gTVZtemp,gTVWptemp,gThhtemp,deltaM,epsI,check,gFdFdcFuFui)

gFdFdcFuFu(i_run,:,:,:) = gFdFdcFuFui 
gT(i_run) = gT(i_run) + Sum(gFdFdcFuFui) 
 
gFdFdNvNvi = 0._dp 
Call FdToFdNvNv(i_run,MFd,MNv,MVZ,Mhh,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,            & 
& cplcFdFdVZR,cplNvNvhhL,cplNvNvhhR,cplNvNvVZL,cplNvNvVZR,IntegralSs,IntegralSSss,       & 
& IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZtemp,               & 
& gThhtemp,deltaM,epsI,check,gFdFdNvNvi)

gFdFdNvNv(i_run,:,:,:) = gFdFdNvNvi 
gT(i_run) = gT(i_run) + Sum(gFdFdNvNvi) 
 
gFdFdFvFvi = 0._dp 
Call FdToFdFvFv(i_run,MFd,MFv,MVZ,cplcFdFdVZL,cplcFdFdVZR,cplFvFvVZL,cplFvFvVZR,      & 
& IntegralVs,IntegralVVss,NVs,NVVss,gTVZtemp,deltaM,epsI,check,gFdFdFvFvi)

gFdFdFvFv(i_run,:,:,:) = gFdFdFvFvi 
gT(i_run) = gT(i_run) + Sum(gFdFdFvFvi) 
 
gFdFuFvFei = 0._dp 
Call FdToFuFvFe(i_run,MFu,MFv,MFe,MVWp,MFd,cplcFdFucVWpL,cplcFdFucVWpR,               & 
& cplFvFeVWpL,cplFvFeVWpR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWptemp,deltaM,            & 
& epsI,check,gFdFuFvFei)

gFdFuFvFe(i_run,:,:,:) = gFdFuFvFei 
gT(i_run) = gT(i_run) + Sum(gFdFuFvFei) 
 
gFdFucChiNvi = 0._dp 
Call FdToFucChiNv(i_run,MFu,MChi,MNv,MVWp,MFd,cplcChiNvVWpL,cplcChiNvVWpR,            & 
& cplcFdFucVWpL,cplcFdFucVWpR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWptemp,               & 
& deltaM,epsI,check,gFdFucChiNvi)

gFdFucChiNv(i_run,:,:,:) = gFdFucChiNvi 
gT(i_run) = gT(i_run) + Sum(gFdFucChiNvi) 
 
End Do 
 

If (Present(gPartial)) Then
Do i1 = i_start, i_end 
 
n_length=1
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,2
gPartial(i1,n_length)= gFdFdcChiChi(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt1,3
gPartial(i1,n_length)= gFdFdcFdFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFdFdcFeFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFdFdcFuFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt2,3
gPartial(i1,n_length)= gFdFdNvNv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt2,3
gPartial(i1,n_length)= gFdFdFvFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFdFuFvFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,3
gPartial(i1,n_length)= gFdFucChiNv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
If (Present(BR).And.(gT(i1).Gt.0._dp)) Then 
BR(i1,:)=gPartial(i1,:)/gT(i1)
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
 
End Subroutine FdThreeBodyDecay
 
 
Subroutine FdToFdcChiChi(iIN,MFd,MChi,MVZ,Mhh,cplcChiChihhL,cplcChiChihhR,            & 
& cplcChiChiVZL,cplcChiChiVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,           & 
& IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,            & 
& NVSss,NVVss,gTVZ,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFd(3),MChi(2),MVZ,Mhh

Complex(dp),Intent(in) :: cplcChiChihhL(2,2),cplcChiChihhR(2,2),cplcChiChiVZL(2,2),cplcChiChiVZR(2,2),          & 
& cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSss(500000,12)

Real(dp),Intent(inout) :: gTVZ,gThh

Integer, Intent(inout) :: NSs,NSSss,NVs,NVSss,NVVss
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
mass(1) = MFd(iIN) 
 
Isum = 4 
Allocate( gSum(3,2,2, Isum) ) 
Allocate( Contribution(3,2,2, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,2
        Do gt3=1,2
Isum = 0 
 
If(Abs(MFd(iIN)).gt.(Abs(MChi(gt3))+Abs(MChi(gt2))+Abs(MFd(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup(2) = Conjg(cplcFdFdVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdVZR(iIN,gt1)) 
coup(4) = Conjg(cplcChiChiVZL(gt2,gt3)) 
coup(3) = Conjg(cplcChiChiVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cChi Chi Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  hh 
!-------------- 
Isum = Isum + 1 
Boson2(1) = Mhh 
Boson2(2) =gThh 
 
Boson4(1) = Mhh 
Boson4(2) =gThh 
Boson4(3) = Mhh 
Boson4(4) =gThh 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup(2) = Conjg(cplcFdFdhhL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdhhR(iIN,gt1)) 
coup(4) = Conjg(cplcChiChihhL(gt2,gt3)) 
coup(3) = Conjg(cplcChiChihhR(gt2,gt3))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cChi Chi Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'



!-------------- 
!  VZ, hh 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh 
Boson4(4) = gThh 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1))  
coup2(5) = cplcChiChiVZL(gt2,gt3) 
coup2(6) = cplcChiChiVZR(gt2,gt3) 
coup2(7) = Conjg(cplcChiChihhL(gt2,gt3)) 
coup2(8) = Conjg(cplcChiChihhR(gt2,gt3)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cChi Chi Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'



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
    Do gt1=1, iIN-1
      Do gt2=1,2
        Do gt3=1,2
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:4))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFd(iIN))**3*g
End Subroutine FdToFdcChiChi 
 
 
Subroutine FdToFdcFdFd(iIN,MFd,MVZ,Mhh,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,           & 
& cplcFdFdVZR,IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,              & 
& IntegralVSst,IntegralVVss,IntegralVVst,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,          & 
& NVVst,gTVZ,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFd(3),MVZ,Mhh

Complex(dp),Intent(in) :: cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16),IntegralVVst(25000,12)

Real(dp),Intent(inout) :: gTVZ,gThh

Integer, Intent(inout) :: NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst
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
mass(1) = MFd(iIN) 
 
Isum = 4 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=gt1, iIN-1
Isum = 0 
 
If(Abs(MFd(iIN)).gt.(Abs(MFd(gt3))+Abs(MFd(gt2))+Abs(MFd(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFdFdVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFdVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFdVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt1) 
 
coup(2) = Conjg(cplcFdFdVZL(iIN,gt3)) 
coup(1) = Conjg(cplcFdFdVZR(iIN,gt3)) 
coup(4) = Conjg(cplcFdFdVZL(gt2,gt1)) 
coup(3) = Conjg(cplcFdFdVZR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdVZL(iIN,gt3) 
coup2(2) = cplcFdFdVZR(iIN,gt3) 
coup2(4) = Conjg(cplcFdFdVZL(iIN,gt1)) 
coup2(3) = Conjg(cplcFdFdVZR(iIN,gt1))  
coup2(5) = cplcFdFdVZL(gt2,gt1) 
coup2(6) = cplcFdFdVZR(gt2,gt1) 
coup2(8) = Conjg(cplcFdFdVZL(gt2,gt3)) 
coup2(7) = Conjg(cplcFdFdVZR(gt2,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFd Fd Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  hh 
!-------------- 
Isum = Isum + 1 
Boson2(1) = Mhh 
Boson2(2) =gThh 
 
Boson4(1) = Mhh 
Boson4(2) =gThh 
Boson4(3) = Mhh 
Boson4(4) =gThh 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFdFdhhL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdhhR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFdhhL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFdhhR(gt2,gt3))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt1) 
 
coup(2) = Conjg(cplcFdFdhhL(iIN,gt3)) 
coup(1) = Conjg(cplcFdFdhhR(iIN,gt3)) 
coup(4) = Conjg(cplcFdFdhhL(gt2,gt1)) 
coup(3) = Conjg(cplcFdFdhhR(gt2,gt1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdhhL(iIN,gt3) 
coup2(2) = cplcFdFdhhR(iIN,gt3) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1))  
coup2(5) = cplcFdFdhhL(gt2,gt1) 
coup2(6) = cplcFdFdhhR(gt2,gt1) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFd Fd Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'



!-------------- 
!  VZ, hh 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh 
Boson4(4) = gThh 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdVZL(iIN,gt3) 
coup2(2) = cplcFdFdVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1))  
coup2(5) = cplcFdFdVZL(gt2,gt1) 
coup2(6) = cplcFdFdVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt1) 
 
coup2(1) = cplcFdFdVZL(iIN,gt3) 
coup2(2) = cplcFdFdVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt3)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt3))  
coup2(5) = cplcFdFdVZL(gt2,gt1) 
coup2(6) = cplcFdFdVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt1)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt1)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt3) 
mass(4) = MFd(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt3)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt3))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt1)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt1)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFd Fd Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'



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
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=gt1, iIN-1
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:4))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFd(iIN))**3*g
End Subroutine FdToFdcFdFd 
 
 
Subroutine FdToFdcFeFe(iIN,MFd,MFe,MVZ,Mhh,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,       & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,IntegralSs,IntegralSSss,   & 
& IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZ,gThh,              & 
& deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFd(3),MFe(3),MVZ,Mhh

Complex(dp),Intent(in) :: cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3), & 
& cplcFeFehhR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSss(500000,12)

Real(dp),Intent(inout) :: gTVZ,gThh

Integer, Intent(inout) :: NSs,NSSss,NVs,NVSss,NVVss
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
mass(1) = MFd(iIN) 
 
Isum = 4 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFd(iIN)).gt.(Abs(MFe(gt3))+Abs(MFe(gt2))+Abs(MFd(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFdFdVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFeVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFeVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFe Fe Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  hh 
!-------------- 
Isum = Isum + 1 
Boson2(1) = Mhh 
Boson2(2) =gThh 
 
Boson4(1) = Mhh 
Boson4(2) =gThh 
Boson4(3) = Mhh 
Boson4(4) =gThh 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFdFdhhL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdhhR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFehhL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFehhR(gt2,gt3))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFe Fe Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'



!-------------- 
!  VZ, hh 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh 
Boson4(4) = gThh 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFe Fe Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'



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
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:4))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFd(iIN))**3*g
End Subroutine FdToFdcFeFe 
 
 
Subroutine FdToFdcFuFu(iIN,MFd,MFu,MVZ,MVWp,Mhh,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFuFdVWpL,cplcFuFdVWpR,         & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,IntegralSs,IntegralSSss,               & 
& IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,IntegralVVst,NSs,NSSss,              & 
& NVs,NVSss,NVSst,NVVss,NVVst,gTVZ,gTVWp,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFd(3),MFu(3),MVZ,MVWp,Mhh

Complex(dp),Intent(in) :: cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFucVWpL(3,3),& 
& cplcFdFucVWpR(3,3),cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFuFuhhL(3,3),               & 
& cplcFuFuhhR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSss(500000,12),IntegralVSst(500000,16),              & 
& IntegralVVst(25000,12)

Real(dp),Intent(inout) :: gTVZ,gTVWp,gThh

Integer, Intent(inout) :: NSs,NSSss,NVs,NVSss,NVSst,NVVss,NVVst
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
mass(1) = MFd(iIN) 
 
Isum = 9 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFd(iIN)).gt.(Abs(MFu(gt3))+Abs(MFu(gt2))+Abs(MFd(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFdFdVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFuVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFuVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



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
 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt1) 
 
coup(2) = Conjg(cplcFdFucVWpL(iIN,gt3)) 
coup(1) = Conjg(cplcFdFucVWpR(iIN,gt3)) 
coup(4) = Conjg(cplcFuFdVWpL(gt2,gt1)) 
coup(3) = Conjg(cplcFuFdVWpR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: conj[VWp]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWp]'



!-------------- 
!  hh 
!-------------- 
Isum = Isum + 1 
Boson2(1) = Mhh 
Boson2(2) =gThh 
 
Boson4(1) = Mhh 
Boson4(2) =gThh 
Boson4(3) = Mhh 
Boson4(4) =gThh 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFdFdhhL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdhhR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFuhhL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFuhhR(gt2,gt3))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'



!-------------- 
!  VZ, conj[VWp] 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVWp 
Boson4(4) = gTVWp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt3) 
mass(4) = MFd(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFucVWpL(iIN,gt3)) 
coup2(3) = Conjg(cplcFdFucVWpR(iIN,gt3))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFuFdVWpL(gt2,gt1)) 
coup2(7) = Conjg(cplcFuFdVWpR(gt2,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VZ,conj[VWp]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,conj[VWp]'



!-------------- 
!  VZ, hh 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh 
Boson4(4) = gThh 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'



!-------------- 
!  conj[VWp], hh 
!-------------- 
Boson4(1) = MVWp 
Boson4(2) = gTVWp 
Boson4(3) = Mhh 
Boson4(4) = gThh 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFdFucVWpL(iIN,gt3) 
coup2(2) = cplcFdFucVWpR(iIN,gt3) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1))  
coup2(5) = cplcFuFdVWpL(gt2,gt1) 
coup2(6) = cplcFuFdVWpR(gt2,gt1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: conj[VWp],hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWp],hh'



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
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:9))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFd(iIN))**3*g
End Subroutine FdToFdcFuFu 
 
 
Subroutine FdToFdNvNv(iIN,MFd,MNv,MVZ,Mhh,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,        & 
& cplcFdFdVZR,cplNvNvhhL,cplNvNvhhR,cplNvNvVZL,cplNvNvVZR,IntegralSs,IntegralSSss,       & 
& IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZ,gThh,              & 
& deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFd(3),MNv(3),MVZ,Mhh

Complex(dp),Intent(in) :: cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplNvNvhhL(3,3),  & 
& cplNvNvhhR(3,3),cplNvNvVZL(3,3),cplNvNvVZR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSss(500000,12)

Real(dp),Intent(inout) :: gTVZ,gThh

Integer, Intent(inout) :: NSs,NSSss,NVs,NVSss,NVVss
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
mass(1) = MFd(iIN) 
 
Isum = 4 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=gt2,3
Isum = 0 
 
If(Abs(MFd(iIN)).gt.(Abs(MNv(gt3))+Abs(MNv(gt2))+Abs(MFd(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MNv(gt2) 
mass(4) = MNv(gt3) 
 
coup(2) = Conjg(cplcFdFdVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdVZR(iIN,gt1)) 
coup(4) = Conjg(cplNvNvVZL(gt2,gt3)) 
coup(3) = Conjg(cplNvNvVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt1) 
mass(3) = -MNv(gt3) 
mass(4) = MNv(gt2) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdVZL(iIN,gt1)) 
coup2(3) = Conjg(cplcFdFdVZR(iIN,gt1))  
coup2(5) = cplNvNvVZL(gt3,gt2) 
coup2(6) = cplNvNvVZR(gt3,gt2) 
coup2(8) = Conjg(cplNvNvVZL(gt2,gt3)) 
coup2(7) = Conjg(cplNvNvVZR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = -2._dp*resR 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd Nv Nv Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  hh 
!-------------- 
Isum = Isum + 1 
Boson2(1) = Mhh 
Boson2(2) =gThh 
 
Boson4(1) = Mhh 
Boson4(2) =gThh 
Boson4(3) = Mhh 
Boson4(4) =gThh 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MNv(gt2) 
mass(4) = MNv(gt3) 
 
coup(2) = Conjg(cplcFdFdhhL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdhhR(iIN,gt1)) 
coup(4) = Conjg(cplNvNvhhL(gt2,gt3)) 
coup(3) = Conjg(cplNvNvhhR(gt2,gt3))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt1) 
mass(3) = -MNv(gt3) 
mass(4) = MNv(gt2) 
 
coup2(1) = cplcFdFdhhL(iIN,gt1) 
coup2(2) = cplcFdFdhhR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1))  
coup2(5) = cplNvNvhhL(gt3,gt2) 
coup2(6) = cplNvNvhhR(gt3,gt2) 
coup2(7) = Conjg(cplNvNvhhL(gt2,gt3)) 
coup2(8) = Conjg(cplNvNvhhR(gt2,gt3)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd Nv Nv Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'



!-------------- 
!  VZ, hh 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh 
Boson4(4) = gThh 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MNv(gt2) 
mass(4) = MNv(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdhhL(iIN,gt1)) 
coup2(4) = Conjg(cplcFdFdhhR(iIN,gt1))  
coup2(5) = cplNvNvVZL(gt2,gt3) 
coup2(6) = cplNvNvVZR(gt2,gt3) 
coup2(7) = Conjg(cplNvNvhhL(gt2,gt3)) 
coup2(8) = Conjg(cplNvNvhhR(gt2,gt3)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd Nv Nv Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'



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
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=gt2,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:4))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFd(iIN))**3*g
End Subroutine FdToFdNvNv 
 
 
Subroutine FdToFdFvFv(iIN,MFd,MFv,MVZ,cplcFdFdVZL,cplcFdFdVZR,cplFvFvVZL,             & 
& cplFvFvVZR,IntegralVs,IntegralVVss,NVs,NVVss,gTVZ,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFd(3),MFv(3),MVZ

Complex(dp),Intent(in) :: cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3)

Real(dp),Intent(inout) :: IntegralVs(25000,9),IntegralVVss(500000,12)

Real(dp),Intent(inout) :: gTVZ

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
mass(1) = MFd(iIN) 
 
Isum = 1 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=gt2,3
Isum = 0 
 
If(Abs(MFd(iIN)).gt.(Abs(MFv(gt3))+Abs(MFv(gt2))+Abs(MFd(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFdFdVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdVZR(iIN,gt1)) 
coup(4) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdVZL(iIN,gt1)) 
coup2(3) = Conjg(cplcFdFdVZR(iIN,gt1))  
coup2(5) = cplFvFvVZL(gt3,gt2) 
coup2(6) = cplFvFvVZR(gt3,gt2) 
coup2(8) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup2(7) = Conjg(cplFvFvVZR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = -2._dp*resR 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd Fv Fv Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



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
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=gt2,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:1))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFd(iIN))**3*g
End Subroutine FdToFdFvFv 
 
 
Subroutine FdToFuFvFe(iIN,MFu,MFv,MFe,MVWp,MFd,cplcFdFucVWpL,cplcFdFucVWpR,           & 
& cplFvFeVWpL,cplFvFeVWpR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWp,deltaM,epsI,           & 
& check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFu(3),MFv(3),MFe(3),MVWp,MFd(3)

Complex(dp),Intent(in) :: cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),cplFvFeVWpL(3,3),cplFvFeVWpR(3,3)

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
mass(1) = MFd(iIN) 
 
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
 
If(Abs(MFd(iIN)).gt.(Abs(MFe(gt3))+Abs(MFv(gt2))+Abs(MFu(gt1)))) Then 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFdFucVWpL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFucVWpR(iIN,gt1)) 
coup(4) = Conjg(cplFvFeVWpL(gt2,gt3)) 
coup(3) = Conjg(cplFvFeVWpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fu Fv Fe Propagator: conj[VWp]" 
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
  g = oo512pi3 / Abs(MFd(iIN))**3*g
End Subroutine FdToFuFvFe 
 
 
Subroutine FdToFucChiNv(iIN,MFu,MChi,MNv,MVWp,MFd,cplcChiNvVWpL,cplcChiNvVWpR,        & 
& cplcFdFucVWpL,cplcFdFucVWpR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWp,deltaM,            & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFu(3),MChi(2),MNv(3),MVWp,MFd(3)

Complex(dp),Intent(in) :: cplcChiNvVWpL(2,3),cplcChiNvVWpR(2,3),cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3)

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
mass(1) = MFd(iIN) 
 
Isum = 1 
Allocate( gSum(3,2,3, Isum) ) 
Allocate( Contribution(3,2,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,2
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFd(iIN)).gt.(Abs(MNv(gt3))+Abs(MChi(gt2))+Abs(MFu(gt1)))) Then 
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
 
mass(2) = MFu(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MNv(gt3) 
 
coup(2) = Conjg(cplcFdFucVWpL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFucVWpR(iIN,gt1)) 
coup(4) = Conjg(cplcChiNvVWpL(gt2,gt3)) 
coup(3) = Conjg(cplcChiNvVWpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fu cChi Nv Propagator: conj[VWp]" 
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
      Do gt2=1,2
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:1))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFd(iIN))**3*g
End Subroutine FdToFucChiNv 
 
 
End Module Fd3Decays_radinertDTFDTSDM 
 
