C     THE CORE SUBROUTINE CALLED BY CUTTOOLS WHICH CONTAINS THE HELAS
C      CALLS BUILDING THE LOOP

      SUBROUTINE MG5_1_LOOPNUM(Q,RES)
C     
C     CONSTANTS 
C     
      INCLUDE 'polynomial_specs.inc'
      INTEGER    NLOOPGROUPS
      PARAMETER (NLOOPGROUPS=13)
C     These are constants related to the split orders
      INTEGER    NSQUAREDSO
      PARAMETER (NSQUAREDSO=1)
C     
C     ARGUMENTS 
C     
      COMPLEX*16 Q(0:3)
      COMPLEX*16 RES
C     
C     GLOBAL VARIABLES
C     
      INTEGER ID,SQSOINDEX,RANK
      COMMON/MG5_1_LOOP/ID,SQSOINDEX,RANK

      COMPLEX*16 LOOPCOEFS(0:LOOPMAXCOEFS-1,NSQUAREDSO,NLOOPGROUPS)
      COMMON/MG5_1_LCOEFS/LOOPCOEFS

      RES=(0.0D0,0.0D0)

      CALL MG5_1_EVAL_POLY(LOOPCOEFS(0,SQSOINDEX,ID),RANK,-Q,RES)
      END

      SUBROUTINE MG5_1_MPLOOPNUM(Q,RES)
C     
C     MODULE
C     
      INCLUDE 'cts_mprec.h'
      INCLUDE 'polynomial_specs.inc'
C     
C     CONSTANTS 
C     
      INTEGER    NLOOPGROUPS
      PARAMETER (NLOOPGROUPS=13)
      INTEGER    NEXTERNAL
      PARAMETER (NEXTERNAL=4)
C     These are constants related to the split orders
      INTEGER    NSQUAREDSO
      PARAMETER (NSQUAREDSO=1)
C     
C     ARGUMENTS 
C     
      INCLUDE 'cts_mpc.h'                                             
     $ , INTENT(IN), DIMENSION(0:3) :: Q
      INCLUDE 'cts_mpc.h'                                             
     $ , INTENT(OUT) :: RES
C     
C     LOCAL VARIABLES 
C     
      COMPLEX*32 QRES
      REAL*8 DUMMY(3,0:NSQUAREDSO)
      REAL*16 QPP(0:3,NEXTERNAL)
      COMPLEX*32 QQ(0:3)
      INTEGER I,J
C     
C     GLOBAL VARIABLES
C     
      LOGICAL MP_DONE
      COMMON/MG5_1_MP_DONE/MP_DONE

      INTEGER ID,SQSOINDEX,RANK
      COMMON/MG5_1_LOOP/ID,SQSOINDEX,RANK

      COMPLEX*32 LOOPCOEFS(0:LOOPMAXCOEFS-1,NSQUAREDSO,NLOOPGROUPS)
      COMMON/MG5_1_MP_LCOEFS/LOOPCOEFS

C     MP_PS IS THE FIXED (POSSIBLY IMPROVED) MP PS POINT AND MP_P IS
C      THE ONE WHICH CAN BE MODIFIED (I.E. ROTATED ETC.) FOR STABILITY
C      PURPOSE
      REAL*16 MP_PS(0:3,NEXTERNAL),MP_P(0:3,NEXTERNAL)
      COMMON/MG5_1_MP_PSPOINT/MP_PS,MP_P

C     ----------
C     BEGIN CODE
C     ----------
      DO I=0,3
        QQ(I) = Q(I)
      ENDDO
      QRES=(0.0E0_16,0.0E0_16)

      IF (.NOT.MP_DONE) THEN
        CALL MG5_1_MP_COMPUTE_LOOP_COEFS(MP_P,DUMMY)
        MP_DONE=.TRUE.
      ENDIF

      CALL MP_MG5_1_EVAL_POLY(LOOPCOEFS(0,SQSOINDEX,ID),RANK,-QQ,QRES)
      RES=QRES

      END

      SUBROUTINE MG5_1_MPLOOPNUM_DUMMY(Q,RES)
C     
C     MODULE
C     
      INCLUDE 'cts_mprec.h'
C     
C     ARGUMENTS 
C     
      INCLUDE 'cts_mpc.h'                                             
     $ , INTENT(IN), DIMENSION(0:3) :: Q
      INCLUDE 'cts_mpc.h'                                             
     $ , INTENT(OUT) :: RES
C     
C     LOCAL VARIABLES 
C     
      COMPLEX*16 DRES
      COMPLEX*16 DQ(0:3)
      INTEGER I
C     ----------
C     BEGIN CODE
C     ----------
      DO I=0,3
        DQ(I) = Q(I)
      ENDDO

      CALL MG5_1_LOOPNUM(DQ,DRES)
      RES=DRES

      END

