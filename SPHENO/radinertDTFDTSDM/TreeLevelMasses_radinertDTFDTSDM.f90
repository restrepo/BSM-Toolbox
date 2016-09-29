! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 15:27 on 28.9.2016   
! ----------------------------------------------------------------------  
 
 
Module TreeLevelMasses_radinertDTFDTSDM 
 
Use Control 
Use Mathematics 
Use MathematicsQP 
Use Model_Data_radinertDTFDTSDM 
!Use StandardModel 
 
 
Logical :: SignOfMassChanged =.False.  
Logical :: SignOfMuChanged =.False.  
Contains 
 
Subroutine TreeMasses(MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,MFe,MFe2,               & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,MXO,MXO2,             & 
& MXP,MXP2,O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,ZX0,ZXP,ZZ,v,g1,g2,g3,               & 
& lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,mu,             & 
& mH2,mEt2,mu3,GenerationMixing,kont)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,eta(3),A,B,Yf(3),Y3(3),              & 
& MTF,MDF,mu,mH2,mEt2,mu3

Complex(dp),Intent(in) :: Yu(3,3),Yd(3,3),Ye(3,3)

Real(dp),Intent(out) :: MAh,MAh2,MChi(2),MChi2(2),MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),            & 
& MFu2(3),MFv(3),MFv2(3),Mhh,Mhh2,MHp,MHp2,MNv(3),MNv2(3),MVWp,MVWp2,MVZ,MVZ2,           & 
& MXO(2),MXO2(2),MXP(2),MXP2(2),TW,ZZ(2,2)

Complex(dp),Intent(out) :: O(3,3),Q2(2,2),Q3(2,2),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),         & 
& Vv(3,3),ZW(2,2),ZX0(2,2),ZXP(2,2)

Real(dp),Intent(in) :: v

Logical, Intent(in) :: GenerationMixing 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,kontSave 
Iname = Iname + 1 
NameOfUnit(Iname) = 'TreeMassesradinert/DTFDTSDM'
 
kont = 0 
Call CalculateVPVZ(g1,g2,v,ZZ,MVZ,MVZ2,TW,kont)

Call CalculateVWp(g2,v,ZW,MVWp,MVWp2,kont)

MHp2 = -1._dp*(mH2) + (lam1*v**2)/2._dp + (g2**2*v**2*RXiWp)/4._dp 
  If (MHp2.ne.MHp2) Then 
      Write(*,*) 'NaN appearing in MHp2' 
      Call TerminateProgram 
    End If 
  If (MHp2.Ge.0._dp) Then 
MHp = sqrt(MHp2) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from MHp2' 
      Write(10,*) 'mass squarred is negative: ',MHp2 
    End If 
     Write(ErrCan,*) 'Warning from routine MHp2' 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) MHp2 
     Write(*,*) 'Warning from routine MHp2' 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) MHp2 
        MHp= 1._dp 
        MHp2= 1._dp 
   SignOfMassChanged = .True. 
 End if 


! ------------------------------- 
MAh2 = (-4._dp*(mH2) + 2*lam1*v**2 + v**2*RXiZ*(g2*Cos(TW) + g1*Sin(TW))              & 
& **2)/4._dp 
  If (MAh2.ne.MAh2) Then 
      Write(*,*) 'NaN appearing in MAh2' 
      Call TerminateProgram 
    End If 
  If (MAh2.Ge.0._dp) Then 
MAh = sqrt(MAh2) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from MAh2' 
      Write(10,*) 'mass squarred is negative: ',MAh2 
    End If 
     Write(ErrCan,*) 'Warning from routine MAh2' 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) MAh2 
     Write(*,*) 'Warning from routine MAh2' 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) MAh2 
        MAh= 1._dp 
        MAh2= 1._dp 
   SignOfMassChanged = .True. 
 End if 


! ------------------------------- 
Mhh2 = -1._dp*(mH2) + (3*lam1*v**2)/2._dp 
  If (Mhh2.ne.Mhh2) Then 
      Write(*,*) 'NaN appearing in Mhh2' 
      Call TerminateProgram 
    End If 
  If (Mhh2.Ge.0._dp) Then 
Mhh = sqrt(Mhh2) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Mhh2' 
      Write(10,*) 'mass squarred is negative: ',Mhh2 
    End If 
     Write(ErrCan,*) 'Warning from routine Mhh2' 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) Mhh2 
     Write(*,*) 'Warning from routine Mhh2' 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) Mhh2 
        Mhh= 1._dp 
        Mhh2= 1._dp 
   SignOfMassChanged = .True. 
 End if 


! ------------------------------- 
MetI2 = (2._dp*(mEt2) + (lam3 + lam4 - lam5)*v**2)/2._dp 
  If (MetI2.ne.MetI2) Then 
      Write(*,*) 'NaN appearing in MetI2' 
      Call TerminateProgram 
    End If 
  If (MetI2.Ge.0._dp) Then 
MetI = sqrt(MetI2) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from MetI2' 
      Write(10,*) 'mass squarred is negative: ',MetI2 
    End If 
     Write(ErrCan,*) 'Warning from routine MetI2' 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) MetI2 
     Write(*,*) 'Warning from routine MetI2' 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) MetI2 
        MetI= 1._dp 
        MetI2= 1._dp 
   SignOfMassChanged = .True. 
 End if 


! ------------------------------- 
Call CalculateMFv(Vv,MFv,kont)

MFv2 = MFv**2 
Call CalculateMNv(MTF,MDF,A,B,v,O,MNv,kont)

MNv2 = MNv**2 
Call CalculateMChi(MTF,MDF,A,B,v,Q2,Q3,MChi,kont)

MChi2 = MChi**2 
Call CalculateMXP(mEt2,lam3,mu3,lam7,mu,v,ZXP,MXP,MXP2,kont)

Call CalculateMXO(mEt2,lam3,lam4,mu3,lam7,mu,lam5,v,ZX0,MXO,MXO2,kont)

Call CalculateMFd(Yd,v,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
Call CalculateMFu(Yu,v,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 
Call CalculateMFe(Ye,v,ZEL,ZER,MFe,kont)

MFe2 = MFe**2 

 
 Call SortGoldstones(MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,             & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,MXO,MXO2,MXP,             & 
& MXP2,O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,ZX0,ZXP,ZZ,kont)

If (SignOfMassChanged) Then  
 If (.Not.IgnoreNegativeMasses) Then 
  Write(*,*) " Stopping calculation because of negative mass squared." 
  Call TerminateProgram 
 Else 
  SignOfMassChanged= .False. 
  kont=0  
 End If 
End If 
If (SignOfMuChanged) Then 
 If (.Not.IgnoreMuSignFlip) Then 
  Write(*,*) " Stopping calculation because of negative mass squared in tadpoles." 
  Call TerminateProgram 
 Else 
  SignOfMuChanged= .False. 
  kont=0 
 End If 
End If 

 ! -------------------------------- 
! Setting Goldstone masses 
! -------------------------------- 
 
TW = ACos(Abs(ZZ(1,1)))
Iname = Iname - 1 
 
End Subroutine  TreeMasses 
 
 
Subroutine RunningFermionMasses(MFeIN,MFe2IN,MFdIN,MFd2IN,MFuIN,MFu2IN,               & 
& v,g1,g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,             & 
& MTF,MDF,mu,mH2,mEt2,mu3,kont)

Implicit None 
 
Integer, Intent(inout) :: kont 
Real(dp),Intent(in) :: g1,g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,eta(3),A,B,Yf(3),Y3(3),              & 
& MTF,MDF,mu,mH2,mEt2,mu3

Complex(dp),Intent(in) :: Yu(3,3),Yd(3,3),Ye(3,3)

Real(dp),Intent(in) :: v

Real(dp),Intent(inout) :: MFeIN(3),MFe2IN(3),MFdIN(3),MFd2IN(3),MFuIN(3),MFu2IN(3)

Real(dp) :: MFe(3),MFe2(3),MFd(3),MFd2(3),MFu(3),MFu2(3)

Call CalculateMFe(Ye,v,ZEL,ZER,MFe,kont)

MFe2 = MFe**2 
MFeIN(1:2) = MFe(1:2) 
MFe2IN(1:2) = MFe2(1:2) 
Call CalculateMFd(Yd,v,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
MFdIN(1:2) = MFd(1:2) 
MFd2IN(1:2) = MFd2(1:2) 
Call CalculateMFu(Yu,v,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 
MFuIN(1:2) = MFu(1:2) 
MFu2IN(1:2) = MFu2(1:2) 
End Subroutine RunningFermionMasses 

Subroutine TreeMassesEffPot(MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,MXO,             & 
& MXO2,MXP,MXP2,O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,ZX0,ZXP,ZZ,v,g1,g2,             & 
& g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,             & 
& mu,mH2,mEt2,mu3,GenerationMixing,kont)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,eta(3),A,B,Yf(3),Y3(3),              & 
& MTF,MDF,mu,mH2,mEt2,mu3

Complex(dp),Intent(in) :: Yu(3,3),Yd(3,3),Ye(3,3)

Real(dp),Intent(out) :: MAh,MAh2,MChi(2),MChi2(2),MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),            & 
& MFu2(3),MFv(3),MFv2(3),Mhh,Mhh2,MHp,MHp2,MNv(3),MNv2(3),MVWp,MVWp2,MVZ,MVZ2,           & 
& MXO(2),MXO2(2),MXP(2),MXP2(2),TW,ZZ(2,2)

Complex(dp),Intent(out) :: O(3,3),Q2(2,2),Q3(2,2),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),         & 
& Vv(3,3),ZW(2,2),ZX0(2,2),ZXP(2,2)

Real(dp),Intent(in) :: v

Logical, Intent(in) :: GenerationMixing 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,kontSave 
Iname = Iname + 1 
NameOfUnit(Iname) = 'TreeMassesradinert/DTFDTSDM'
 
kont = 0 
Call CalculateVPVZEffPot(g1,g2,v,ZZ,MVZ,MVZ2,TW,kont)

Call CalculateVWpEffPot(g2,v,ZW,MVWp,MVWp2,kont)

MHp2 = -1._dp*(mH2) + (lam1*v**2)/2._dp + (g2**2*v**2*RXiWp)/4._dp 
  If (MHp2.ne.MHp2) Then 
      Write(*,*) 'NaN appearing in MHp2' 
      Call TerminateProgram 
    End If 
  If (MHp2.Ge.0._dp) Then 
MHp = sqrt(MHp2) 
  Else 
 End if 


! ------------------------------- 
MAh2 = (-4._dp*(mH2) + 2*lam1*v**2 + v**2*RXiZ*(g2*Cos(TW) + g1*Sin(TW))              & 
& **2)/4._dp 
  If (MAh2.ne.MAh2) Then 
      Write(*,*) 'NaN appearing in MAh2' 
      Call TerminateProgram 
    End If 
  If (MAh2.Ge.0._dp) Then 
MAh = sqrt(MAh2) 
  Else 
 End if 


! ------------------------------- 
Mhh2 = -1._dp*(mH2) + (3*lam1*v**2)/2._dp 
  If (Mhh2.ne.Mhh2) Then 
      Write(*,*) 'NaN appearing in Mhh2' 
      Call TerminateProgram 
    End If 
  If (Mhh2.Ge.0._dp) Then 
Mhh = sqrt(Mhh2) 
  Else 
 End if 


! ------------------------------- 
MetI2 = (2._dp*(mEt2) + (lam3 + lam4 - lam5)*v**2)/2._dp 
  If (MetI2.ne.MetI2) Then 
      Write(*,*) 'NaN appearing in MetI2' 
      Call TerminateProgram 
    End If 
  If (MetI2.Ge.0._dp) Then 
MetI = sqrt(MetI2) 
  Else 
 End if 


! ------------------------------- 
Call CalculateMFvEffPot(Vv,MFv,kont)

MFv2 = MFv**2 
Call CalculateMNvEffPot(MTF,MDF,A,B,v,O,MNv,kont)

MNv2 = MNv**2 
Call CalculateMChiEffPot(MTF,MDF,A,B,v,Q2,Q3,MChi,kont)

MChi2 = MChi**2 
Call CalculateMXPEffPot(mEt2,lam3,mu3,lam7,mu,v,ZXP,MXP,MXP2,kont)

Call CalculateMXOEffPot(mEt2,lam3,lam4,mu3,lam7,mu,lam5,v,ZX0,MXO,MXO2,kont)

Call CalculateMFdEffPot(Yd,v,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
Call CalculateMFuEffPot(Yu,v,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 
Call CalculateMFeEffPot(Ye,v,ZEL,ZER,MFe,kont)

MFe2 = MFe**2 

 
 If (SignOfMassChanged) Then  
 If (.Not.IgnoreNegativeMasses) Then 
  Write(*,*) " Stopping calculation because of negative mass squared." 
  Call TerminateProgram 
 Else 
  SignOfMassChanged= .False. 
  kont=0  
 End If 
End If 
If (SignOfMuChanged) Then 
 If (.Not.IgnoreMuSignFlip) Then 
  Write(*,*) " Stopping calculation because of negative mass squared in tadpoles." 
  Call TerminateProgram 
 Else 
  SignOfMuChanged= .False. 
  kont=0 
 End If 
End If 
Iname = Iname - 1 
 
End Subroutine  TreeMassesEffPot 
 
 
Subroutine CalculateMFv(Vv,MFv,kont)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr, pos 
Integer :: j1,j2,j3,j4 
Logical :: SecondDiagonalisationNeeded 
Real(dp), Intent(out) :: MFv(3) 
Complex(dp), Intent(out) ::  Vv(3,3) 
                              
Complex(dp) :: mat(3,3), mat2(3,3), phaseM, E3(3) 

Real(dp) :: Vva(3,3), test(2), eig(3) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFv'
 
mat(1,1) = 0._dp 
mat(1,2) = 0._dp 
mat(1,3) = 0._dp 
mat(2,2) = 0._dp 
mat(2,3) = 0._dp 
mat(3,3) = 0._dp 

 
 Do i1=2,3
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
If (Maxval(Abs(Aimag(mat))).Eq.0._dp) Then 
Call EigenSystem(Real(mat,dp),Eig,Vva,ierr,test) 
 
   Do i1=1,3
   If ((Eig(i1).Lt.0._dp).or.(Abs(eig(i1)).lt.1E-15)) Then 
    MFv(i1) = - Eig(i1) 
    Vv(i1,:) = (0._dp,1._dp)*Vva(i1,:) 
   Else 
    MFv(i1) = Eig(i1) 
    Vv(i1,:) = Vva(i1,:)
    End If 
   End Do 
 
Do i1=1,2
  Do i2=i1+1,3
    If (MFv(i1).Gt.MFv(i2)) Then 
      Eig(1) = MFv(i1) 
      MFv(i1) = MFv(i2) 
      MFv(i2) =  Eig(1) 
      E3 = Vv(i1,:) 
      Vv(i1,:) = Vv(i2,:) 
      Vv(i2,:) = E3
    End If 
   End Do 
End Do 
 
Else 
 
mat2 = Matmul( Transpose(Conjg( mat) ), mat ) 
Call Eigensystem(mat2, Eig, Vv, ierr, test) 
mat2 = Matmul( Conjg(Vv), Matmul( mat, Transpose( Conjg(Vv)))) 
! Special efforts are needed for matrices like the Higgsinos one 
SecondDiagonalisationNeeded = .False. 
Do i1=1,3-1
If (MaxVal(Abs(mat2(i1,(i1+1):3))).gt.Abs(mat2(i1,i1))) SecondDiagonalisationNeeded = .True. 

  If (Eig(i1).ne.Eig(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End do 
If (SecondDiagonalisationNeeded) Then 
Call EigenSystem(Real(mat2,dp),Eig,Vva,ierr,test) 
 
     Vv = MatMul(Vv,Vva)
  Do i1=1,3
   If ((Eig(i1).Lt.0._dp).or.(Abs(eig(i1)).lt.1E-15)) Then 
    MFv(i1) = - Eig(i1) 
    Vv(i1,:) = (0._dp,1._dp)*Vva(i1,:) 
   Else 
    MFv(i1) = Eig(i1) 
    Vv(i1,:) = Vva(i1,:)
    End If 
   End Do 
 
Else 
Do i1=1,3
  If (Eig(i1).ne.Eig(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  Vv(i1,:)= phaseM * Vv(i1,:) 
End if 
  If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
MFv = Sqrt( Eig ) 
 
End if ! Second diagonalisation 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFv, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Iname = Iname - 1 
 
End Subroutine CalculateMFv 

Subroutine CalculateMNv(MTF,MDF,A,B,v,O,MNv,kont)

Real(dp) ,Intent(in) :: MTF,MDF,A,B,v

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr, pos 
Integer :: j1,j2,j3,j4 
Logical :: SecondDiagonalisationNeeded 
Real(dp), Intent(out) :: MNv(3) 
Complex(dp), Intent(out) ::  O(3,3) 
                              
Complex(dp) :: mat(3,3), mat2(3,3), phaseM, E3(3) 

Real(dp) :: Oa(3,3), test(2), eig(3) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMNv'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+MTF
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(A*v)/2._dp
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)-(B*v)/2._dp
mat(2,2) = 0._dp 
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)-1._dp*(MDF)
mat(3,3) = 0._dp 

 
 Do i1=2,3
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
If (Maxval(Abs(Aimag(mat))).Eq.0._dp) Then 
Call EigenSystem(Real(mat,dp),Eig,Oa,ierr,test) 
 
   Do i1=1,3
   If ((Eig(i1).Lt.0._dp).or.(Abs(eig(i1)).lt.1E-15)) Then 
    MNv(i1) = - Eig(i1) 
    O(i1,:) = (0._dp,1._dp)*Oa(i1,:) 
   Else 
    MNv(i1) = Eig(i1) 
    O(i1,:) = Oa(i1,:)
    End If 
   End Do 
 
Do i1=1,2
  Do i2=i1+1,3
    If (MNv(i1).Gt.MNv(i2)) Then 
      Eig(1) = MNv(i1) 
      MNv(i1) = MNv(i2) 
      MNv(i2) =  Eig(1) 
      E3 = O(i1,:) 
      O(i1,:) = O(i2,:) 
      O(i2,:) = E3
    End If 
   End Do 
End Do 
 
Else 
 
mat2 = Matmul( Transpose(Conjg( mat) ), mat ) 
Call Eigensystem(mat2, Eig, O, ierr, test) 
mat2 = Matmul( Conjg(O), Matmul( mat, Transpose( Conjg(O)))) 
! Special efforts are needed for matrices like the Higgsinos one 
SecondDiagonalisationNeeded = .False. 
Do i1=1,3-1
If (MaxVal(Abs(mat2(i1,(i1+1):3))).gt.Abs(mat2(i1,i1))) SecondDiagonalisationNeeded = .True. 

  If (Eig(i1).ne.Eig(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End do 
If (SecondDiagonalisationNeeded) Then 
Call EigenSystem(Real(mat2,dp),Eig,Oa,ierr,test) 
 
     O = MatMul(O,Oa)
  Do i1=1,3
   If ((Eig(i1).Lt.0._dp).or.(Abs(eig(i1)).lt.1E-15)) Then 
    MNv(i1) = - Eig(i1) 
    O(i1,:) = (0._dp,1._dp)*Oa(i1,:) 
   Else 
    MNv(i1) = Eig(i1) 
    O(i1,:) = Oa(i1,:)
    End If 
   End Do 
 
Else 
Do i1=1,3
  If (Eig(i1).ne.Eig(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  O(i1,:)= phaseM * O(i1,:) 
End if 
  If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
MNv = Sqrt( Eig ) 
 
End if ! Second diagonalisation 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMNv, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Iname = Iname - 1 
 
End Subroutine CalculateMNv 

Subroutine CalculateMChi(MTF,MDF,A,B,v,Q2,Q3,MChi,kont)

Real(dp),Intent(in) :: MTF,MDF,A,B,v

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MChi(2) 
 Complex(dp), Intent(out) :: Q2(2,2), Q3(2,2) 
 
 Complex(dp) :: mat(2,2)=0._dp, mat2(2,2)=0._dp, phaseM 

Complex(dp) :: Q22(2,2), Q32(2,2) 
 
 Real(dp) :: Q21(2,2), Q31(2,2), test(2), MChi2(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMChi'
 
MChi = 0._dp 
Q2 = 0._dp 
Q3 = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+MTF
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(A*v)/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)+(B*v)/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+MDF

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MChi2,Q31,ierr,test) 
Q32 = Q31 
Else 
Call EigenSystem(mat2,MChi2,Q32,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MChi2,Q21,ierr,test) 
                  
                  
Q22 = Q21 
Else 
Call EigenSystem(mat2,MChi2,Q22,ierr,test) 
 
 
End If 
Q22 = Conjg(Q22) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(Q22),mat),Transpose( Conjg(Q32))) 
Do i1=1,2
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
Q32(i1,:) = phaseM *Q32(i1,:) 
 End if 
End Do 
 
Do i1=1,2
If (Abs(Q32(i1,i1)).gt.0._dp) Then 
phaseM = Q32(i1,i1) / Abs(Q32(i1,i1)) 
Q32(i1,:) = Conjg(phaseM) *Q32(i1,:) 
 Q22(i1,:) = phaseM *Q22(i1,:) 
 End if 
  If (MChi2(i1).ne.MChi2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MChi2(i1)).Le.MaxMassNumericalZero) MChi2(i1) = Abs(MChi2(i1))+1.E-10_dp 
  If (MChi2(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MChi2(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,MChi2(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MChi2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MChi2(i1) 
  MChi2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMChi, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MChi = Sqrt( MChi2 ) 
Q2 = Q22 
Q3 = Q32 
Iname = Iname - 1 
 
End Subroutine CalculateMChi 

Subroutine CalculateMXP(mEt2,lam3,mu3,lam7,mu,v,ZXP,MXP,MXP2,kont)

Real(dp), Intent(in) :: mEt2,lam3,mu3,lam7,mu,v

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: MXP(2), MXP2(2) 
Complex(dp), Intent(out) :: ZXP(2,2) 
 
Complex(dp) :: mat(2,2)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMXP'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+mEt2
mat(1,1) = mat(1,1)+(lam3*v**2)/2._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(mu*v)/2._dp
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+mu3
mat(2,2) = mat(2,2)+(lam7*v**2)/2._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = Conjg(mat(i2,i1)) 
  End do 
End do 

 
Call EigenSystem(mat,MXP2,ZXP,ierr,test) 
 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Abs(MXP2(i1)).Le.MaxMassNumericalZero) MXP2(i1) = 1.E-10_dp 
  If (MXP2(i1).ne.MXP2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MXP2(i1).Ge.0._dp) Then 
  MXP(i1)=Sqrt(MXP2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MXP2(i1) 
    End If 
  MXP(i1) = 1._dp 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MXP2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MXP2(i1) 
  MXP2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMXP 

Subroutine CalculateMXO(mEt2,lam3,lam4,mu3,lam7,mu,lam5,v,ZX0,MXO,MXO2,kont)

Real(dp), Intent(in) :: mEt2,lam3,lam4,mu3,lam7,mu,lam5,v

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: MXO(2), MXO2(2) 
Complex(dp), Intent(out) :: ZX0(2,2) 
 
Complex(dp) :: mat(2,2)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMXO'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+mEt2
mat(1,1) = mat(1,1)+(lam3*v**2)/2._dp
mat(1,1) = mat(1,1)+(lam4*v**2)/2._dp
mat(1,1) = mat(1,1)+(lam5*v**2)/2._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-(mu*v)/2._dp
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+mu3
mat(2,2) = mat(2,2)+(lam7*v**2)/2._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,MXO2,ZX0,ierr,test) 
 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Abs(MXO2(i1)).Le.MaxMassNumericalZero) MXO2(i1) = 1.E-10_dp 
  If (MXO2(i1).ne.MXO2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MXO2(i1).Ge.0._dp) Then 
  MXO(i1)=Sqrt(MXO2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MXO2(i1) 
    End If 
  MXO(i1) = 1._dp 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MXO2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MXO2(i1) 
  MXO2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMXO 

Subroutine CalculateMFd(Yd,v,ZDL,ZDR,MFd,kont)

Real(dp),Intent(in) :: v

Complex(dp),Intent(in) :: Yd(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFd(3) 
 Complex(dp), Intent(out) :: ZDL(3,3), ZDR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZDL2(3,3), ZDR2(3,3) 
 
 Real(dp) :: ZDL1(3,3), ZDR1(3,3), test(2), MFd2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFd'
 
MFd = 0._dp 
ZDL = 0._dp 
ZDR = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)-((v*Yd(1,1))/sqrt(2._dp))
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-((v*Yd(2,1))/sqrt(2._dp))
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)-((v*Yd(3,1))/sqrt(2._dp))
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)-((v*Yd(1,2))/sqrt(2._dp))
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)-((v*Yd(2,2))/sqrt(2._dp))
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)-((v*Yd(3,2))/sqrt(2._dp))
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)-((v*Yd(1,3))/sqrt(2._dp))
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)-((v*Yd(2,3))/sqrt(2._dp))
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)-((v*Yd(3,3))/sqrt(2._dp))

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFd2,ZDL1,ierr,test) 
                  
                  
ZDL2 = ZDL1 
Else 
Call EigenSystem(mat2,MFd2,ZDL2,ierr,test) 
 
 
End If 
ZDL2 = Conjg(ZDL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZDL2),mat),Transpose( Conjg(ZDR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZDR2(i1,:) = phaseM *ZDR2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZDR2(i1,i1)).gt.0._dp) Then 
phaseM = ZDR2(i1,i1) / Abs(ZDR2(i1,i1)) 
ZDR2(i1,:) = Conjg(phaseM) *ZDR2(i1,:) 
 ZDL2(i1,:) = phaseM *ZDL2(i1,:) 
 End if 
  If (MFd2(i1).ne.MFd2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFd2(i1)).Le.MaxMassNumericalZero) MFd2(i1) = Abs(MFd2(i1))+1.E-10_dp 
  If (MFd2(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MFd2(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,MFd2(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MFd2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MFd2(i1) 
  MFd2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFd, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFd = Sqrt( MFd2 ) 
ZDL = ZDL2 
ZDR = ZDR2 
Iname = Iname - 1 
 
End Subroutine CalculateMFd 

Subroutine CalculateMFu(Yu,v,ZUL,ZUR,MFu,kont)

Real(dp),Intent(in) :: v

Complex(dp),Intent(in) :: Yu(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFu(3) 
 Complex(dp), Intent(out) :: ZUL(3,3), ZUR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZUL2(3,3), ZUR2(3,3) 
 
 Real(dp) :: ZUL1(3,3), ZUR1(3,3), test(2), MFu2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFu'
 
MFu = 0._dp 
ZUL = 0._dp 
ZUR = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(v*Yu(1,1))/sqrt(2._dp)
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(v*Yu(2,1))/sqrt(2._dp)
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+(v*Yu(3,1))/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)+(v*Yu(1,2))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(v*Yu(2,2))/sqrt(2._dp)
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+(v*Yu(3,2))/sqrt(2._dp)
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)+(v*Yu(1,3))/sqrt(2._dp)
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)+(v*Yu(2,3))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(v*Yu(3,3))/sqrt(2._dp)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFu2,ZUL1,ierr,test) 
                  
                  
ZUL2 = ZUL1 
Else 
Call EigenSystem(mat2,MFu2,ZUL2,ierr,test) 
 
 
End If 
ZUL2 = Conjg(ZUL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZUL2),mat),Transpose( Conjg(ZUR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZUR2(i1,:) = phaseM *ZUR2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZUR2(i1,i1)).gt.0._dp) Then 
phaseM = ZUR2(i1,i1) / Abs(ZUR2(i1,i1)) 
ZUR2(i1,:) = Conjg(phaseM) *ZUR2(i1,:) 
 ZUL2(i1,:) = phaseM *ZUL2(i1,:) 
 End if 
  If (MFu2(i1).ne.MFu2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFu2(i1)).Le.MaxMassNumericalZero) MFu2(i1) = Abs(MFu2(i1))+1.E-10_dp 
  If (MFu2(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MFu2(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,MFu2(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MFu2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MFu2(i1) 
  MFu2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFu, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFu = Sqrt( MFu2 ) 
ZUL = ZUL2 
ZUR = ZUR2 
Iname = Iname - 1 
 
End Subroutine CalculateMFu 

Subroutine CalculateMFe(Ye,v,ZEL,ZER,MFe,kont)

Real(dp),Intent(in) :: v

Complex(dp),Intent(in) :: Ye(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFe(3) 
 Complex(dp), Intent(out) :: ZEL(3,3), ZER(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZEL2(3,3), ZER2(3,3) 
 
 Real(dp) :: ZEL1(3,3), ZER1(3,3), test(2), MFe2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFe'
 
MFe = 0._dp 
ZEL = 0._dp 
ZER = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)-((v*Ye(1,1))/sqrt(2._dp))
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-((v*Ye(2,1))/sqrt(2._dp))
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)-((v*Ye(3,1))/sqrt(2._dp))
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)-((v*Ye(1,2))/sqrt(2._dp))
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)-((v*Ye(2,2))/sqrt(2._dp))
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)-((v*Ye(3,2))/sqrt(2._dp))
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)-((v*Ye(1,3))/sqrt(2._dp))
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)-((v*Ye(2,3))/sqrt(2._dp))
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)-((v*Ye(3,3))/sqrt(2._dp))

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFe2,ZEL1,ierr,test) 
                  
                  
ZEL2 = ZEL1 
Else 
Call EigenSystem(mat2,MFe2,ZEL2,ierr,test) 
 
 
End If 
ZEL2 = Conjg(ZEL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZEL2),mat),Transpose( Conjg(ZER2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZER2(i1,:) = phaseM *ZER2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZER2(i1,i1)).gt.0._dp) Then 
phaseM = ZER2(i1,i1) / Abs(ZER2(i1,i1)) 
ZER2(i1,:) = Conjg(phaseM) *ZER2(i1,:) 
 ZEL2(i1,:) = phaseM *ZEL2(i1,:) 
 End if 
  If (MFe2(i1).ne.MFe2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFe2(i1)).Le.MaxMassNumericalZero) MFe2(i1) = Abs(MFe2(i1))+1.E-10_dp 
  If (MFe2(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MFe2(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,MFe2(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MFe2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MFe2(i1) 
  MFe2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFe, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFe = Sqrt( MFe2 ) 
ZEL = ZEL2 
ZER = ZER2 
Iname = Iname - 1 
 
End Subroutine CalculateMFe 

Subroutine CalculateVPVZ(g1,g2,v,ZZ,MVZ,MVZ2,TW,kont)

Real(dp), Intent(in) :: g1,g2,v

Real(dp), Intent(out) :: TW

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MVZ, MVZ2
Real(dp) :: VPVZ2(2),VPVZ(2)  

Real(dp), Intent(out) :: ZZ(2,2) 
 
Real(dp) :: mat(2,2)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateVPVZ'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(g1**2*v**2)/4._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-(g1*g2*v**2)/4._dp
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g2**2*v**2)/4._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,VPVZ2,ZZ,ierr,test) 
 
 
ZZ = Transpose(ZZ) 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Abs(VPVZ2(i1)).Le.1.E-10_dp*(Maxval(VPVZ2))) VPVZ2(i1) = 1.E-10_dp 
  If (VPVZ2(i1).ne.VPVZ2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (VPVZ2(i1).Ge.0._dp) Then 
  VPVZ(i1) =Sqrt(VPVZ2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,VPVZ2(i1) 
    End If 
  VPVZ(i1)= 1._dp 
  VPVZ2(i1)= 1._dp  
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,VPVZ2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,VPVZ2(i1) 
  VPVZ(i1)= 1._dp 
  VPVZ2(i1) = 1._dp  
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
MVZ = VPVZ(2) 
MVZ2 = VPVZ2(2) 
TW = ACos(Abs(ZZ(1,1)))

 Iname = Iname - 1 
 
End Subroutine CalculateVPVZ 

Subroutine CalculateVWp(g2,v,ZW,MVWp,MVWp2,kont)

Real(dp), Intent(in) :: g2,v

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MVWp, MVWp2
Real(dp) :: VWp2(2),VWp(2)  

Complex(dp), Intent(out) :: ZW(2,2) 
 
Complex(dp) :: mat(2,2)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateVWp'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(g2**2*v**2)/4._dp
mat(1,2) = 0._dp 
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g2**2*v**2)/4._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = Conjg(mat(i2,i1)) 
  End do 
End do 

 
Call EigenSystem(mat,VWp2,ZW,ierr,test) 
 
 
ZW = Transpose(ZW) 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Abs(VWp2(i1)).Le.1.E-10_dp*(Maxval(VWp2))) VWp2(i1) = 1.E-10_dp 
  If (VWp2(i1).ne.VWp2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (VWp2(i1).Ge.0._dp) Then 
  VWp(i1) =Sqrt(VWp2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,VWp2(i1) 
    End If 
  VWp(i1)= 1._dp 
  VWp2(i1)= 1._dp  
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,VWp2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,VWp2(i1) 
  VWp(i1)= 1._dp 
  VWp2(i1) = 1._dp  
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
MVWp = VWp(1) 
MVWp2 = VWp2(1) 

 Iname = Iname - 1 
 
End Subroutine CalculateVWp 

Subroutine CalculateMFvEffPot(Vv,MFv,kont)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr, pos 
Integer :: j1,j2,j3,j4 
Logical :: SecondDiagonalisationNeeded 
Real(dp), Intent(out) :: MFv(3) 
Complex(dp), Intent(out) ::  Vv(3,3) 
                              
Complex(dp) :: mat(3,3), mat2(3,3), phaseM, E3(3) 

Real(dp) :: Vva(3,3), test(2), eig(3) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFv'
 
mat(1,1) = 0._dp 
mat(1,2) = 0._dp 
mat(1,3) = 0._dp 
mat(2,2) = 0._dp 
mat(2,3) = 0._dp 
mat(3,3) = 0._dp 

 
 Do i1=2,3
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
If (Maxval(Abs(Aimag(mat))).Eq.0._dp) Then 
Call EigenSystem(Real(mat,dp),Eig,Vva,ierr,test) 
 
   Do i1=1,3
   If ((Eig(i1).Lt.0._dp).or.(Abs(eig(i1)).lt.1E-15)) Then 
    MFv(i1) = - Eig(i1) 
    Vv(i1,:) = (0._dp,1._dp)*Vva(i1,:) 
   Else 
    MFv(i1) = Eig(i1) 
    Vv(i1,:) = Vva(i1,:)
    End If 
   End Do 
 
  Do i1=1,3
   pos=Maxloc(Abs(Vv(i1,:)),1) 
   If (Abs(Real(Vv(i1,pos),dp)).gt.Abs(Aimag(Vv(i1,pos)))) Then 
      If (Real(Vv(i1,pos),dp).lt.0._dp) Then 
        Vv(i1,:)=-Vv(i1,:) 
       End If 
    Else 
      If (Aimag(Vv(i1,pos)).lt.0._dp) Then 
        Vv(i1,:)=-Vv(i1,:) 
      End If 
    End If 
 End Do 
 
Do i1=1,2
  Do i2=i1+1,3
    If (MFv(i1).Gt.MFv(i2)) Then 
      Eig(1) = MFv(i1) 
      MFv(i1) = MFv(i2) 
      MFv(i2) =  Eig(1) 
      E3 = Vv(i1,:) 
      Vv(i1,:) = Vv(i2,:) 
      Vv(i2,:) = E3
    End If 
   End Do 
End Do 
 
Else 
 
mat2 = Matmul( Transpose(Conjg( mat) ), mat ) 
Call Eigensystem(mat2, Eig, Vv, ierr, test) 
mat2 = Matmul( Conjg(Vv), Matmul( mat, Transpose( Conjg(Vv)))) 
! Special efforts are needed for matrices like the Higgsinos one 
SecondDiagonalisationNeeded = .False. 
Do i1=1,3-1
If (MaxVal(Abs(mat2(i1,(i1+1):3))).gt.Abs(mat2(i1,i1))) SecondDiagonalisationNeeded = .True. 

  If (Eig(i1).ne.Eig(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End do 
If (SecondDiagonalisationNeeded) Then 
Call EigenSystem(Real(mat2,dp),Eig,Vva,ierr,test) 
 
     Vv = MatMul(Vv,Vva)
  Do i1=1,3
   If ((Eig(i1).Lt.0._dp).or.(Abs(eig(i1)).lt.1E-15)) Then 
    MFv(i1) = - Eig(i1) 
    Vv(i1,:) = (0._dp,1._dp)*Vva(i1,:) 
   Else 
    MFv(i1) = Eig(i1) 
    Vv(i1,:) = Vva(i1,:)
    End If 
   End Do 
 
Else 
Do i1=1,3
  If (Eig(i1).ne.Eig(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  Vv(i1,:)= phaseM * Vv(i1,:) 
End if 
  If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
MFv = Sqrt( Eig ) 
 
End if ! Second diagonalisation 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFv, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Iname = Iname - 1 
 
End Subroutine CalculateMFvEffPot 

Subroutine CalculateMNvEffPot(MTF,MDF,A,B,v,O,MNv,kont)

Real(dp) ,Intent(in) :: MTF,MDF,A,B,v

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr, pos 
Integer :: j1,j2,j3,j4 
Logical :: SecondDiagonalisationNeeded 
Real(dp), Intent(out) :: MNv(3) 
Complex(dp), Intent(out) ::  O(3,3) 
                              
Complex(dp) :: mat(3,3), mat2(3,3), phaseM, E3(3) 

Real(dp) :: Oa(3,3), test(2), eig(3) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMNv'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+MTF
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(A*v)/2._dp
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)-(B*v)/2._dp
mat(2,2) = 0._dp 
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)-1._dp*(MDF)
mat(3,3) = 0._dp 

 
 Do i1=2,3
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
If (Maxval(Abs(Aimag(mat))).Eq.0._dp) Then 
Call EigenSystem(Real(mat,dp),Eig,Oa,ierr,test) 
 
   Do i1=1,3
   If ((Eig(i1).Lt.0._dp).or.(Abs(eig(i1)).lt.1E-15)) Then 
    MNv(i1) = - Eig(i1) 
    O(i1,:) = (0._dp,1._dp)*Oa(i1,:) 
   Else 
    MNv(i1) = Eig(i1) 
    O(i1,:) = Oa(i1,:)
    End If 
   End Do 
 
  Do i1=1,3
   pos=Maxloc(Abs(O(i1,:)),1) 
   If (Abs(Real(O(i1,pos),dp)).gt.Abs(Aimag(O(i1,pos)))) Then 
      If (Real(O(i1,pos),dp).lt.0._dp) Then 
        O(i1,:)=-O(i1,:) 
       End If 
    Else 
      If (Aimag(O(i1,pos)).lt.0._dp) Then 
        O(i1,:)=-O(i1,:) 
      End If 
    End If 
 End Do 
 
Do i1=1,2
  Do i2=i1+1,3
    If (MNv(i1).Gt.MNv(i2)) Then 
      Eig(1) = MNv(i1) 
      MNv(i1) = MNv(i2) 
      MNv(i2) =  Eig(1) 
      E3 = O(i1,:) 
      O(i1,:) = O(i2,:) 
      O(i2,:) = E3
    End If 
   End Do 
End Do 
 
Else 
 
mat2 = Matmul( Transpose(Conjg( mat) ), mat ) 
Call Eigensystem(mat2, Eig, O, ierr, test) 
mat2 = Matmul( Conjg(O), Matmul( mat, Transpose( Conjg(O)))) 
! Special efforts are needed for matrices like the Higgsinos one 
SecondDiagonalisationNeeded = .False. 
Do i1=1,3-1
If (MaxVal(Abs(mat2(i1,(i1+1):3))).gt.Abs(mat2(i1,i1))) SecondDiagonalisationNeeded = .True. 

  If (Eig(i1).ne.Eig(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End do 
If (SecondDiagonalisationNeeded) Then 
Call EigenSystem(Real(mat2,dp),Eig,Oa,ierr,test) 
 
     O = MatMul(O,Oa)
  Do i1=1,3
   If ((Eig(i1).Lt.0._dp).or.(Abs(eig(i1)).lt.1E-15)) Then 
    MNv(i1) = - Eig(i1) 
    O(i1,:) = (0._dp,1._dp)*Oa(i1,:) 
   Else 
    MNv(i1) = Eig(i1) 
    O(i1,:) = Oa(i1,:)
    End If 
   End Do 
 
Else 
Do i1=1,3
  If (Eig(i1).ne.Eig(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  O(i1,:)= phaseM * O(i1,:) 
End if 
  If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
MNv = Sqrt( Eig ) 
 
End if ! Second diagonalisation 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMNv, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Iname = Iname - 1 
 
End Subroutine CalculateMNvEffPot 

Subroutine CalculateMChiEffPot(MTF,MDF,A,B,v,Q2,Q3,MChi,kont)

Real(dp),Intent(in) :: MTF,MDF,A,B,v

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MChi(2) 
 Complex(dp), Intent(out) :: Q2(2,2), Q3(2,2) 
 
 Complex(dp) :: mat(2,2)=0._dp, mat2(2,2)=0._dp, phaseM 

Complex(dp) :: Q22(2,2), Q32(2,2) 
 
 Real(dp) :: Q21(2,2), Q31(2,2), test(2), MChi2(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMChi'
 
MChi = 0._dp 
Q2 = 0._dp 
Q3 = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+MTF
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(A*v)/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)+(B*v)/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+MDF

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MChi2,Q31,ierr,test) 
Q32 = Q31 
Else 
Call EigenSystem(mat2,MChi2,Q32,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MChi2,Q21,ierr,test) 
                  
                  
Q22 = Q21 
Else 
Call EigenSystem(mat2,MChi2,Q22,ierr,test) 
 
 
End If 
Q22 = Conjg(Q22) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(Q22),mat),Transpose( Conjg(Q32))) 
Do i1=1,2
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
Q32(i1,:) = phaseM *Q32(i1,:) 
 End if 
End Do 
 
Do i1=1,2
If (Abs(Q32(i1,i1)).gt.0._dp) Then 
phaseM = Q32(i1,i1) / Abs(Q32(i1,i1)) 
Q32(i1,:) = Conjg(phaseM) *Q32(i1,:) 
 Q22(i1,:) = phaseM *Q22(i1,:) 
 End if 
  If (MChi2(i1).ne.MChi2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MChi2(i1)).Le.MaxMassNumericalZero) MChi2(i1) = Abs(MChi2(i1))+1.E-10_dp 
  If (MChi2(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMChi, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MChi = Sqrt( MChi2 ) 
Q2 = Q22 
Q3 = Q32 
Iname = Iname - 1 
 
End Subroutine CalculateMChiEffPot 

Subroutine CalculateMXPEffPot(mEt2,lam3,mu3,lam7,mu,v,ZXP,MXP,MXP2,kont)

Real(dp), Intent(in) :: mEt2,lam3,mu3,lam7,mu,v

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: MXP(2), MXP2(2) 
Complex(dp), Intent(out) :: ZXP(2,2) 
 
Complex(dp) :: mat(2,2)  

Real(dp) :: MXP2temp(2), Q2 
Complex(dp) :: ZXPtemp(2,2), ZXPtemp2(2,2) 
 
Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMXP'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+mEt2
mat(1,1) = mat(1,1)+(lam3*v**2)/2._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(mu*v)/2._dp
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+mu3
mat(2,2) = mat(2,2)+(lam7*v**2)/2._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = Conjg(mat(i2,i1)) 
  End do 
End do 

 
Call EigenSystem(mat,MXP2,ZXP,ierr,test) 
 
 
! Fix order
  ZXPtemp2=ZXP
Do i1=1,2
  pos=Maxloc(Abs(ZXPtemp2(i1,:)),1)
  ZXPtemp(pos,:)=ZXP(i1,:)
  MXP2temp(pos)=MXP2(i1)
  ZXPtemp2(:,pos)=0._dp
End do
  MXP2 = MXP2temp
  ZXP = ZXPtemp
! Fix phases
Do i1=1,2
  pos=Maxloc(Abs(ZXP(i1,:)),1)
  If (Real(ZXP(i1,pos),dp).lt.0._dp) Then
    ZXP(i1,:)=-ZXP(i1,:)
  End if
End do
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (MXP2(i1).ne.MXP2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MXP2(i1).Ge.0._dp) Then 
  MXP(i1)=Sqrt(MXP2(i1) ) 
  Else 
  MXP(i1) = 1._dp 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMXPEffPot 

Subroutine CalculateMXOEffPot(mEt2,lam3,lam4,mu3,lam7,mu,lam5,v,ZX0,MXO,              & 
& MXO2,kont)

Real(dp), Intent(in) :: mEt2,lam3,lam4,mu3,lam7,mu,lam5,v

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: MXO(2), MXO2(2) 
Complex(dp), Intent(out) :: ZX0(2,2) 
 
Complex(dp) :: mat(2,2)  

Real(dp) :: MXO2temp(2), Q2 
Complex(dp) :: ZX0temp(2,2), ZX0temp2(2,2) 
 
Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMXO'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+mEt2
mat(1,1) = mat(1,1)+(lam3*v**2)/2._dp
mat(1,1) = mat(1,1)+(lam4*v**2)/2._dp
mat(1,1) = mat(1,1)+(lam5*v**2)/2._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-(mu*v)/2._dp
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+mu3
mat(2,2) = mat(2,2)+(lam7*v**2)/2._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,MXO2,ZX0,ierr,test) 
 
 
! Fix order
  ZX0temp2=ZX0
Do i1=1,2
  pos=Maxloc(Abs(ZX0temp2(i1,:)),1)
  ZX0temp(pos,:)=ZX0(i1,:)
  MXO2temp(pos)=MXO2(i1)
  ZX0temp2(:,pos)=0._dp
End do
  MXO2 = MXO2temp
  ZX0 = ZX0temp
! Fix phases
Do i1=1,2
  pos=Maxloc(Abs(ZX0(i1,:)),1)
  If (Real(ZX0(i1,pos),dp).lt.0._dp) Then
    ZX0(i1,:)=-ZX0(i1,:)
  End if
End do
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (MXO2(i1).ne.MXO2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MXO2(i1).Ge.0._dp) Then 
  MXO(i1)=Sqrt(MXO2(i1) ) 
  Else 
  MXO(i1) = 1._dp 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMXOEffPot 

Subroutine CalculateMFdEffPot(Yd,v,ZDL,ZDR,MFd,kont)

Real(dp),Intent(in) :: v

Complex(dp),Intent(in) :: Yd(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFd(3) 
 Complex(dp), Intent(out) :: ZDL(3,3), ZDR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZDL2(3,3), ZDR2(3,3) 
 
 Real(dp) :: ZDL1(3,3), ZDR1(3,3), test(2), MFd2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFd'
 
MFd = 0._dp 
ZDL = 0._dp 
ZDR = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)-((v*Yd(1,1))/sqrt(2._dp))
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-((v*Yd(2,1))/sqrt(2._dp))
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)-((v*Yd(3,1))/sqrt(2._dp))
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)-((v*Yd(1,2))/sqrt(2._dp))
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)-((v*Yd(2,2))/sqrt(2._dp))
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)-((v*Yd(3,2))/sqrt(2._dp))
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)-((v*Yd(1,3))/sqrt(2._dp))
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)-((v*Yd(2,3))/sqrt(2._dp))
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)-((v*Yd(3,3))/sqrt(2._dp))

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFd2,ZDL1,ierr,test) 
                  
                  
ZDL2 = ZDL1 
Else 
Call EigenSystem(mat2,MFd2,ZDL2,ierr,test) 
 
 
End If 
ZDL2 = Conjg(ZDL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZDL2),mat),Transpose( Conjg(ZDR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZDR2(i1,:) = phaseM *ZDR2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZDR2(i1,i1)).gt.0._dp) Then 
phaseM = ZDR2(i1,i1) / Abs(ZDR2(i1,i1)) 
ZDR2(i1,:) = Conjg(phaseM) *ZDR2(i1,:) 
 ZDL2(i1,:) = phaseM *ZDL2(i1,:) 
 End if 
  If (MFd2(i1).ne.MFd2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFd2(i1)).Le.MaxMassNumericalZero) MFd2(i1) = Abs(MFd2(i1))+1.E-10_dp 
  If (MFd2(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFd, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFd = Sqrt( MFd2 ) 
ZDL = ZDL2 
ZDR = ZDR2 
Iname = Iname - 1 
 
End Subroutine CalculateMFdEffPot 

Subroutine CalculateMFuEffPot(Yu,v,ZUL,ZUR,MFu,kont)

Real(dp),Intent(in) :: v

Complex(dp),Intent(in) :: Yu(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFu(3) 
 Complex(dp), Intent(out) :: ZUL(3,3), ZUR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZUL2(3,3), ZUR2(3,3) 
 
 Real(dp) :: ZUL1(3,3), ZUR1(3,3), test(2), MFu2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFu'
 
MFu = 0._dp 
ZUL = 0._dp 
ZUR = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(v*Yu(1,1))/sqrt(2._dp)
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(v*Yu(2,1))/sqrt(2._dp)
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+(v*Yu(3,1))/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)+(v*Yu(1,2))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(v*Yu(2,2))/sqrt(2._dp)
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+(v*Yu(3,2))/sqrt(2._dp)
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)+(v*Yu(1,3))/sqrt(2._dp)
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)+(v*Yu(2,3))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(v*Yu(3,3))/sqrt(2._dp)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFu2,ZUL1,ierr,test) 
                  
                  
ZUL2 = ZUL1 
Else 
Call EigenSystem(mat2,MFu2,ZUL2,ierr,test) 
 
 
End If 
ZUL2 = Conjg(ZUL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZUL2),mat),Transpose( Conjg(ZUR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZUR2(i1,:) = phaseM *ZUR2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZUR2(i1,i1)).gt.0._dp) Then 
phaseM = ZUR2(i1,i1) / Abs(ZUR2(i1,i1)) 
ZUR2(i1,:) = Conjg(phaseM) *ZUR2(i1,:) 
 ZUL2(i1,:) = phaseM *ZUL2(i1,:) 
 End if 
  If (MFu2(i1).ne.MFu2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFu2(i1)).Le.MaxMassNumericalZero) MFu2(i1) = Abs(MFu2(i1))+1.E-10_dp 
  If (MFu2(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFu, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFu = Sqrt( MFu2 ) 
ZUL = ZUL2 
ZUR = ZUR2 
Iname = Iname - 1 
 
End Subroutine CalculateMFuEffPot 

Subroutine CalculateMFeEffPot(Ye,v,ZEL,ZER,MFe,kont)

Real(dp),Intent(in) :: v

Complex(dp),Intent(in) :: Ye(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFe(3) 
 Complex(dp), Intent(out) :: ZEL(3,3), ZER(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZEL2(3,3), ZER2(3,3) 
 
 Real(dp) :: ZEL1(3,3), ZER1(3,3), test(2), MFe2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFe'
 
MFe = 0._dp 
ZEL = 0._dp 
ZER = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)-((v*Ye(1,1))/sqrt(2._dp))
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-((v*Ye(2,1))/sqrt(2._dp))
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)-((v*Ye(3,1))/sqrt(2._dp))
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)-((v*Ye(1,2))/sqrt(2._dp))
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)-((v*Ye(2,2))/sqrt(2._dp))
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)-((v*Ye(3,2))/sqrt(2._dp))
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)-((v*Ye(1,3))/sqrt(2._dp))
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)-((v*Ye(2,3))/sqrt(2._dp))
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)-((v*Ye(3,3))/sqrt(2._dp))

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFe2,ZEL1,ierr,test) 
                  
                  
ZEL2 = ZEL1 
Else 
Call EigenSystem(mat2,MFe2,ZEL2,ierr,test) 
 
 
End If 
ZEL2 = Conjg(ZEL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZEL2),mat),Transpose( Conjg(ZER2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZER2(i1,:) = phaseM *ZER2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZER2(i1,i1)).gt.0._dp) Then 
phaseM = ZER2(i1,i1) / Abs(ZER2(i1,i1)) 
ZER2(i1,:) = Conjg(phaseM) *ZER2(i1,:) 
 ZEL2(i1,:) = phaseM *ZEL2(i1,:) 
 End if 
  If (MFe2(i1).ne.MFe2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFe2(i1)).Le.MaxMassNumericalZero) MFe2(i1) = Abs(MFe2(i1))+1.E-10_dp 
  If (MFe2(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFe, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFe = Sqrt( MFe2 ) 
ZEL = ZEL2 
ZER = ZER2 
Iname = Iname - 1 
 
End Subroutine CalculateMFeEffPot 

Subroutine CalculateVPVZEffPot(g1,g2,v,ZZ,MVZ,MVZ2,TW,kont)

Real(dp), Intent(in) :: g1,g2,v

Real(dp), Intent(out) :: TW

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MVZ, MVZ2
Real(dp) :: VPVZ2(2),VPVZ(2)  

Real(dp), Intent(out) :: ZZ(2,2) 
 
Real(dp) :: mat(2,2)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateVPVZ'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(g1**2*vFix**2)/4._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-(g1*g2*vFix**2)/4._dp
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g2**2*vFix**2)/4._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,VPVZ2,ZZ,ierr,test) 
 
 
ZZ = Transpose(ZZ) 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Abs(VPVZ2(i1)).Le.1.E-10_dp*(Maxval(VPVZ2))) VPVZ2(i1) = 1.E-10_dp 
  If (VPVZ2(i1).ne.VPVZ2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (VPVZ2(i1).Ge.0._dp) Then 
  VPVZ(i1) =Sqrt(VPVZ2(i1) ) 
  Else 
  VPVZ(i1)= 1._dp 
  VPVZ(i1)= 1._dp 
! kont = -104 
 End if 
End Do 
 
MVZ = VPVZ(2) 
MVZ2 = VPVZ2(2) 

 Iname = Iname - 1 
 
End Subroutine CalculateVPVZEffPot 

Subroutine CalculateVWpEffPot(g2,v,ZW,MVWp,MVWp2,kont)

Real(dp), Intent(in) :: g2,v

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MVWp, MVWp2
Real(dp) :: VWp2(2),VWp(2)  

Complex(dp), Intent(out) :: ZW(2,2) 
 
Complex(dp) :: mat(2,2)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateVWp'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(g2**2*vFix**2)/4._dp
mat(1,2) = 0._dp 
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g2**2*vFix**2)/4._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = Conjg(mat(i2,i1)) 
  End do 
End do 

 
Call EigenSystem(mat,VWp2,ZW,ierr,test) 
 
 
ZW = Transpose(ZW) 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Abs(VWp2(i1)).Le.1.E-10_dp*(Maxval(VWp2))) VWp2(i1) = 1.E-10_dp 
  If (VWp2(i1).ne.VWp2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (VWp2(i1).Ge.0._dp) Then 
  VWp(i1) =Sqrt(VWp2(i1) ) 
  Else 
  VWp(i1)= 1._dp 
  VWp(i1)= 1._dp 
! kont = -104 
 End if 
End Do 
 
MVWp = VWp(1) 
MVWp2 = VWp2(1) 

 Iname = Iname - 1 
 
End Subroutine CalculateVWpEffPot 

Subroutine TreeMassesSM(MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVWp,MVWp2,               & 
& MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,ZZ,v,g1,g2,g3,lam1,lam2,lam3,lam4,           & 
& lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,mu,mH2,mEt2,mu3,GenerationMixing,kont)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,eta(3),A,B,Yf(3),Y3(3),              & 
& MTF,MDF,mu,mH2,mEt2,mu3

Complex(dp),Intent(in) :: Yu(3,3),Yd(3,3),Ye(3,3)

Real(dp),Intent(out) :: MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MVWp,MVWp2,               & 
& MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(out) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),Vv(3,3),ZW(2,2)

Real(dp),Intent(in) :: v

Logical, Intent(in) :: GenerationMixing 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,kontSave 
Iname = Iname + 1 
NameOfUnit(Iname) = 'TreeMassesradinert/DTFDTSDM'
 
kont = 0 
Call CalculateMFv(Vv,MFv,kont)

MFv2 = MFv**2 
Call CalculateMFd(Yd,v,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
Call CalculateMFu(Yu,v,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 
Call CalculateMFe(Ye,v,ZEL,ZER,MFe,kont)

MFe2 = MFe**2 

 
 Call CalculateVPVZ(g1,g2,v,ZZ,MVZ,MVZ2,TW,kont)

Call CalculateVWp(g2,v,ZW,MVWp,MVWp2,kont)

Iname = Iname - 1 
 
End Subroutine  TreeMassesSM 
 
 
Subroutine SortGoldstones(MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,MXO,MXO2,             & 
& MXP,MXP2,O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,ZX0,ZXP,ZZ,kont)

Real(dp),Intent(inout) :: MAh,MAh2,MChi(2),MChi2(2),MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),            & 
& MFu2(3),MFv(3),MFv2(3),Mhh,Mhh2,MHp,MHp2,MNv(3),MNv2(3),MVWp,MVWp2,MVZ,MVZ2,           & 
& MXO(2),MXO2(2),MXP(2),MXP2(2),TW,ZZ(2,2)

Complex(dp),Intent(inout) :: O(3,3),Q2(2,2),Q3(2,2),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),         & 
& Vv(3,3),ZW(2,2),ZX0(2,2),ZXP(2,2)

Integer, Intent(inout) :: kont 
Integer :: i1, i2, pos 


End subroutine SortGoldstones 


End Module TreeLevelMasses_radinertDTFDTSDM 
 