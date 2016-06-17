! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 11:51 on 17.6.2016   
! ----------------------------------------------------------------------  
 
 
Module SusyDecays_radinertT13A
 
Use Control 
Use DecayFunctions 
Use LoopCouplings_radinertT13A 
Use CouplingsForDecays_radinertT13A 
Use Model_Data_radinertT13A 
Use Mathematics, Only: Li2 
 
 Contains 
 
  
Subroutine FuTwoBodyDecay(i_in,deltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,          & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,MVWp2,MVZ,MVZ2,           & 
& TW,ZDR,ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,LSH,Yu,Yd,Ye,YR3,             & 
& YR1,YR4,Mn,MDF,mu2,MS2,v,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,YR3,YR1(3,3),YR4,MS2(3,3),v,MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),          & 
& MFre,MFre2,MFu(3),MFu2(3),MFv(3),MFv2(3),Mhh,Mhh2,MHp,MHp2,MNv0(3),MNv02(3),           & 
& MSs(3),MSs2(3),MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(in) :: Lam,LSH(3,3),Yu(3,3),Yd(3,3),Ye(3,3),Mn,MDF,mu2,ZDR(3,3),ZER(3,3),ZUR(3,3),           & 
& ZDL(3,3),ZEL(3,3),VSs(3,3),ZUL(3,3),Vv(3,3),ZvN(3,3),ZW(2,2)

Complex(dp) :: cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFuFuVZL(3,3),& 
& cplcFuFuVZR(3,3)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'FuTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 3
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.3) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,3

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,3

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MFu(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Fu_decays_2B(m_in,i1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,               & 
& MFre2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,MVWp2,              & 
& MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,LSH,Yu,              & 
& Yd,Ye,YR3,YR1,YR4,Mn,MDF,mu2,MS2,v,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,              & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Fd, VWp
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFd(gt1)
m2out = MVWp
coupL = cplcFuFdVWpL(i1,gt1)
coupR = cplcFuFdVWpR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
If (gt1.eq.3) Then 
  BR_tWb = gPartial(i1,i_count) 
End if 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fu, hh
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFu(gt1)
m2out = Mhh
coupL = cplcFuFuhhL(i1,gt1)
coupR = cplcFuFuhhR(i1,gt1)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fu, VZ
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFu(gt1)
m2out = MVZ
coupL = cplcFuFuVZL(i1,gt1)
coupR = cplcFuFuVZR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
End Subroutine FuTwoBodyDecay
 
 
Subroutine hhTwoBodyDecay(i_in,deltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,          & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,MVWp2,MVZ,MVZ2,           & 
& TW,ZDR,ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,LSH,Yu,Yd,Ye,YR3,             & 
& YR1,YR4,Mn,MDF,mu2,MS2,v,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,YR3,YR1(3,3),YR4,MS2(3,3),v,MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),          & 
& MFre,MFre2,MFu(3),MFu2(3),MFv(3),MFv2(3),Mhh,Mhh2,MHp,MHp2,MNv0(3),MNv02(3),           & 
& MSs(3),MSs2(3),MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(in) :: Lam,LSH(3,3),Yu(3,3),Yd(3,3),Ye(3,3),Mn,MDF,mu2,ZDR(3,3),ZER(3,3),ZUR(3,3),           & 
& ZDL(3,3),ZEL(3,3),VSs(3,3),ZUL(3,3),Vv(3,3),ZvN(3,3),ZW(2,2)

Complex(dp) :: cplHiggsPP,cplHiggsGG,cplHiggsZZvirt,cplHiggsWWvirt,cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),& 
& cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplhhhhhh,         & 
& cplNv0Nv0hhL(3,3),cplNv0Nv0hhR(3,3),cplhhSsSs(3,3),cplhhcVWpVWp,cplhhVZVZ

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Real(dp) :: alpha3 
Iname = Iname + 1 
NameOfUnit(Iname) = 'hhTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 1 
  gT = 0._dp 
  gPartial = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,1

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,1

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
i1=1 
m_in = Mhh 
Call CouplingsFor_hh_decays_2B(m_in,i1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,               & 
& MFre2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,MVWp2,              & 
& MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,LSH,Yu,              & 
& Yd,Ye,YR3,YR1,YR4,Mn,MDF,mu2,MS2,v,cplHiggsPP,cplHiggsGG,cplHiggsZZvirt,               & 
& cplHiggsWWvirt,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplhhhhhh,cplNv0Nv0hhL,cplNv0Nv0hhR,cplhhSsSs,cplhhcVWpVWp,cplhhVZVZ,deltaM)

!alpha3 = AlphaSDR(m_in,MFd,MFu) 
alpha3 = g3running**2/(4._dp*Pi) 
i_count = 1 

 
! ----------------------------------------------
! VP, VP
! ----------------------------------------------

 
m1out = 0.
m2out = 0.
gam = G_F * m_in**3 * oosqrt2 * oo128pi3 * Abs(cplHiggsPP)**2 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VG, VG
! ----------------------------------------------

 
m1out = 0.
m2out = 0.
gam = G_F * m_in**3 * oosqrt2 * oo36pi3 * Abs(cplHiggsGG)**2 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VZ, VZ
! ----------------------------------------------

 
m1out = MVZ
m2out = MVZ
If (m_in.le.2._dp*m1out) Then 
coupReal = cplHiggsZZvirt
Call ScalarToVectorBosonsVR(m_in,m1out,coupReal,gam) 
Else 
gam = 0._dp 
End if 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWp, VWp
! ----------------------------------------------

 
m1out = MVWp
m2out = MVWp
If (m_in.le.2._dp*m1out) Then 
coupReal = cplHiggsWWvirt
Call ScalarToVectorBosonsVR(m_in,m1out,coupReal,gam) 
Else 
gam = 0._dp 
End if 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! bar[Fd], Fd
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFd(gt1)
m2out = MFd(gt2)
coupL = cplcFdFdhhL(gt1,gt2)
coupR = cplcFdFdhhR(gt1,gt2)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gam = gam * FFqcd(m1out,m_in,alpha3) 
gPartial(1,i_count) = 3*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fe], Fe
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFe(gt1)
m2out = MFe(gt2)
coupL = cplcFeFehhL(gt1,gt2)
coupR = cplcFeFehhR(gt1,gt2)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fu], Fu
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFu(gt1)
m2out = MFu(gt2)
coupL = cplcFuFuhhL(gt1,gt2)
coupR = cplcFuFuhhR(gt1,gt2)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gam = gam * FFqcd(m1out,m_in,alpha3) 
gPartial(1,i_count) = 3*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, hh
! ----------------------------------------------

 
m1out = Mhh
m2out = Mhh
coup = cplhhhhhh
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1._dp/2._dp*gam 
gT = gT + gPartial(1,i_count) 
  BRHHH(1,1) = gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! Nv0, Nv0
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2= gt1, 3
m1out = MNv0(gt1)
m2out = MNv0(gt2)
coupL = cplNv0Nv0hhL(gt1,gt2)
coupR = cplNv0Nv0hhR(gt1,gt2)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(1,i_count) = 1._dp/2._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Ss, Ss
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2= gt1, 3
m1out = MSs(gt1)
m2out = MSs(gt2)
coup = cplhhSsSs(gt1,gt2)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(1,i_count) = 1._dp/2._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! VWp, conj[VWp]
! ----------------------------------------------

 
m1out = MVWp
m2out = MVWp
coup = cplhhcVWpVWp
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VZ, VZ
! ----------------------------------------------

 
m1out = MVZ
m2out = MVZ
coup = cplhhVZVZ
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1._dp/2._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  BRHHH(1,1) = BRHHH(1,1)/gT 
If ((Present(BR)).And.(gT.Eq.0)) Then 
  BR(1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(1,:) = gPartial(1,:)/gT 
End if 
 
Iname = Iname - 1 
 
Contains 
 
  Real(dp) Function FFqcd(mf, mA, alpha_s)
  Implicit None
   Real(dp) , Intent(in) :: mf, mA, alpha_s
   Real(dp) :: fac, beta, beta2, ratio, R_beta_1, Ln_R_beta_1, Ln_beta

   FFqcd = 0._dp
   ratio = mf / mA
   If (ratio.Ge.0.5_dp) Return ! decay is kinematically forbitten

   If (ratio.Ge.0.495_dp) Return ! Coloumb singularity

    beta2 = 1._dp - 4._dp * ratio**2
    beta = Sqrt(beta2)
    
    R_beta_1 = (1. - beta) / (1._dp + beta)
    Ln_beta = Log(beta)
    Ln_R_beta_1 = Log(R_beta_1)

    fac = (3._dp + 34._dp * beta2 - 13._dp * beta**4) / (16._dp * beta**3)  &
      &     * (-Ln_R_beta_1)                                                &
      & + 0.375_dp * (7._dp - beta2) - 3._dp * Log(4._dp/(1._dp - beta**2)) &
      & - 4._dp * Ln_beta                                                   &
      & + (1._dp + beta**2)                                                 &
      &       * ( 4._dp * Li2(R_beta_1) + 2._dp * Li2(- R_beta_1)           &
      &         + Ln_R_beta_1 * ( 3._dp * Log(2._dp/(1._dp + beta))         &
      &                         + 2._dp * Ln_beta )  ) / beta

    fac = fac - 3._dp * Log(ratio)  ! absorb large logarithms in mass

    FFqcd = 1._dp + 5._dp * alpha_s * fac * oo3pi 

  End  Function FFqcd
End Subroutine hhTwoBodyDecay
 
 
Subroutine SsTwoBodyDecay(i_in,deltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,          & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,MVWp2,MVZ,MVZ2,           & 
& TW,ZDR,ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,LSH,Yu,Yd,Ye,YR3,             & 
& YR1,YR4,Mn,MDF,mu2,MS2,v,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,YR3,YR1(3,3),YR4,MS2(3,3),v,MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),          & 
& MFre,MFre2,MFu(3),MFu2(3),MFv(3),MFv2(3),Mhh,Mhh2,MHp,MHp2,MNv0(3),MNv02(3),           & 
& MSs(3),MSs2(3),MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(in) :: Lam,LSH(3,3),Yu(3,3),Yd(3,3),Ye(3,3),Mn,MDF,mu2,ZDR(3,3),ZER(3,3),ZUR(3,3),           & 
& ZDL(3,3),ZEL(3,3),VSs(3,3),ZUL(3,3),Vv(3,3),ZvN(3,3),ZW(2,2)

Complex(dp) :: cplcFreFeSsL(3,3),cplcFreFeSsR(3,3),cplFvNv0SsL(3,3,3),cplFvNv0SsR(3,3,3),            & 
& cplhhSsSs(3,3)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'SsTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 3
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.3) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,3

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,3

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MSs(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Ss_decays_2B(m_in,i1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,               & 
& MFre2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,MVWp2,              & 
& MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,LSH,Yu,              & 
& Yd,Ye,YR3,YR1,YR4,Mn,MDF,mu2,MS2,v,cplcFreFeSsL,cplcFreFeSsR,cplFvNv0SsL,              & 
& cplFvNv0SsR,cplhhSsSs,deltaM)

i_count = 1 

 
! ----------------------------------------------
! bar[Fre], Fe
! ----------------------------------------------

 
  Do gt2=1, 3
m1out = MFre
m2out = MFe(gt2)
coupL = cplcFreFeSsL(gt2,i1)
coupR = cplcFreFeSsR(gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
End Do 
 

 
! ----------------------------------------------
! Nv0, Fv
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MNv0(gt1)
m2out = MFv(gt2)
coupL = cplFvNv0SsL(gt2,gt1,i1)
coupR = cplFvNv0SsR(gt2,gt1,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Ss, hh
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MSs(gt1)
m2out = Mhh
coup = cplhhSsSs(i1,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
End Subroutine SsTwoBodyDecay
 
 
Subroutine Nv0TwoBodyDecay(i_in,deltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,               & 
& MFre2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,MVWp2,              & 
& MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,LSH,Yu,              & 
& Yd,Ye,YR3,YR1,YR4,Mn,MDF,mu2,MS2,v,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,YR3,YR1(3,3),YR4,MS2(3,3),v,MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),          & 
& MFre,MFre2,MFu(3),MFu2(3),MFv(3),MFv2(3),Mhh,Mhh2,MHp,MHp2,MNv0(3),MNv02(3),           & 
& MSs(3),MSs2(3),MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(in) :: Lam,LSH(3,3),Yu(3,3),Yd(3,3),Ye(3,3),Mn,MDF,mu2,ZDR(3,3),ZER(3,3),ZUR(3,3),           & 
& ZDL(3,3),ZEL(3,3),VSs(3,3),ZUL(3,3),Vv(3,3),ZvN(3,3),ZW(2,2)

Complex(dp) :: cplNv0FreVWpL(3),cplNv0FreVWpR(3),cplFvNv0SsL(3,3,3),cplFvNv0SsR(3,3,3),              & 
& cplNv0Nv0hhL(3,3),cplNv0Nv0hhR(3,3),cplNv0Nv0VZL(3,3),cplNv0Nv0VZR(3,3)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Nv0TwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 3
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.3) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,3

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,3

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MNv0(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Nv0_decays_2B(m_in,i1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,              & 
& MFre2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,MVWp2,              & 
& MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,LSH,Yu,              & 
& Yd,Ye,YR3,YR1,YR4,Mn,MDF,mu2,MS2,v,cplNv0FreVWpL,cplNv0FreVWpR,cplFvNv0SsL,            & 
& cplFvNv0SsR,cplNv0Nv0hhL,cplNv0Nv0hhR,cplNv0Nv0VZL,cplNv0Nv0VZR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Fre, VWp
! ----------------------------------------------

 
m1out = MFre
m2out = MVWp
coupL = cplNv0FreVWpL(i1)
coupR = cplNv0FreVWpR(i1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! Fv, Ss
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFv(gt1)
m2out = MSs(gt2)
coupL = cplFvNv0SsL(gt1,i1,gt2)
coupR = cplFvNv0SsR(gt1,i1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Nv0, hh
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MNv0(gt1)
m2out = Mhh
coupL = cplNv0Nv0hhL(i1,gt1)
coupR = cplNv0Nv0hhR(i1,gt1)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Nv0, VZ
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MNv0(gt1)
m2out = MVZ
coupL = cplNv0Nv0VZL(i1,gt1)
coupR = cplNv0Nv0VZR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
End Subroutine Nv0TwoBodyDecay
 
 
Subroutine FreTwoBodyDecay(i_in,deltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,               & 
& MFre2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,MVWp2,              & 
& MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,LSH,Yu,              & 
& Yd,Ye,YR3,YR1,YR4,Mn,MDF,mu2,MS2,v,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,YR3,YR1(3,3),YR4,MS2(3,3),v,MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),          & 
& MFre,MFre2,MFu(3),MFu2(3),MFv(3),MFv2(3),Mhh,Mhh2,MHp,MHp2,MNv0(3),MNv02(3),           & 
& MSs(3),MSs2(3),MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(in) :: Lam,LSH(3,3),Yu(3,3),Yd(3,3),Ye(3,3),Mn,MDF,mu2,ZDR(3,3),ZER(3,3),ZUR(3,3),           & 
& ZDL(3,3),ZEL(3,3),VSs(3,3),ZUL(3,3),Vv(3,3),ZvN(3,3),ZW(2,2)

Complex(dp) :: cplcFreFeSsL(3,3),cplcFreFeSsR(3,3),cplcFreFreVZL,cplcFreFreVZR,cplcFreNv0cVWpL(3),   & 
& cplcFreNv0cVWpR(3)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'FreTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 1 
  gT = 0._dp 
  gPartial = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,1

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,1

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
i1=1 
m_in = MFre 
Call CouplingsFor_Fre_decays_2B(m_in,i1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,              & 
& MFre2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,MVWp2,              & 
& MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,LSH,Yu,              & 
& Yd,Ye,YR3,YR1,YR4,Mn,MDF,mu2,MS2,v,cplcFreFeSsL,cplcFreFeSsR,cplcFreFreVZL,            & 
& cplcFreFreVZR,cplcFreNv0cVWpL,cplcFreNv0cVWpR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Fe, Ss
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFe(gt1)
m2out = MSs(gt2)
coupL = cplcFreFeSsL(gt1,gt2)
coupR = cplcFreFeSsR(gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fre, VZ
! ----------------------------------------------

 
m1out = MFre
m2out = MVZ
coupL = cplcFreFreVZL
coupR = cplcFreFreVZR
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! Nv0, conj[VWp]
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MNv0(gt1)
m2out = MVWp
coupL = cplcFreNv0cVWpL(gt1)
coupR = cplcFreNv0cVWpR(gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
If ((Present(BR)).And.(gT.Eq.0)) Then 
  BR(1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(1,:) = gPartial(1,:)/gT 
End if 
 
Iname = Iname - 1 
 
End Subroutine FreTwoBodyDecay
 
 
Subroutine ScalarToTwoVectorbosonsNew(mS,mV1,mV2,coup,width)
  implicit none
   real(dp), intent(in) :: mS,mV1,mV2
   real(dp), intent(out) :: width
   complex(dp), intent(in) :: coup

   real(dp) :: mSsq,mV1sq, mV2sq,kappa

   if ( abs(mS).le.( abs(mV1)+abs(mV2) ) ) then
    width = 0._dp

   elseif (mV1.eq.0._dp) then
    write(ErrCan,*) 'Server warning, in subroutine ScalarToTwoVectorbosons'
    write(ErrCan,*) 'm_V1 = 0, setting width to 0'
    width = 0._dp

   elseif (mV2.eq.0._dp) then
    write(ErrCan,*) 'Server warning, in subroutine ScalarToTwoVectorbosons'
    write(ErrCan,*) 'm_V2 = 0, setting width to 0'
    width = 0._dp


   elseif (Abs(coup).eq.0._dp) then
    width = 0._dp

   else
    mSsq = mS * mS
    mV1sq = mV1**2
    mV2sq = mV2**2
    kappa = Sqrt( (mSsq-mV1sq-mV2sq)**2 - 4._dp * mV1sq*mV2sq )/(mS**3)
    width = coup**2/(4._dp*mV1sq*mV2sq)*(mV1sq**2 + 10._dp*mV1sq*mV2sq - &
             & 2._dp*(mV1sq+mV2sq)*mSsq + mV2sq**2 +mSsq**2)
    width = oo16Pi*width*kappa

   endif

  End Subroutine ScalarToTwoVectorbosonsNew

Subroutine FermionToFermionVectorBosonMassless(mFin,mFout,mV,coupL,coupR,width)
  implicit none
   real(dp), intent(in) :: mFin,mFout,mV
   real(dp), intent(out) :: width
   complex(dp), intent(in) :: coupL, coupR


   if ( abs(mFin).le.( abs(mFout)+abs(mV) ) ) then
    width = 0._dp

   else

    width = 0.5_dp*oo16Pi*(Abs(coupL)**2 + Abs(coupR)**2)*mFin**3


   endif

  End Subroutine FermionToFermionVectorBosonMassless

End Module SusyDecays_radinertT13A 
 
