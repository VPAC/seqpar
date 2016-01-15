  FUNCTION f(a)
    IMPLICIT NONE

    double precision a
    double precision f

    f = 2.d0 / SQRT(1.d0 - a*a)
  END

! ===================================================



  PROGRAM Compute_PI
   IMPLICIT NONE

   interface
     FUNCTION f(a)
     double precision a
     double precision f
     END FUNCTION
   end interface

   INTEGER           N, i, num_threads
   DOUBLE PRECISION  w, x, sum
   DOUBLE PRECISION  pi, mypi


   N = 50000000		!! Number of intervals
   w = 1.0d0/N  	!! width of each interval

   sum = 0.0d0

!$OMP    PARALLEL PRIVATE(x, mypi)

   mypi = 0.0d0;

!$OMP    DO
   DO i = 0, N-1                !! Parallel Loop
     x = w * (i + 0.5d0)
     mypi = mypi + w*f(x)
   END DO
!$OMP    END DO

!$OMP CRITICAL
   pi = pi + mypi
!$OMP END CRITICAL

!$OMP    END PARALLEL 

   PRINT *, "Pi = ", pi

   END PROGRAM
