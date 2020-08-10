      PROGRAM VEC_ADD_DO

!     Vector-add program
!     Arrays A, B, C, and variable N will be shared by all threads.
!     Variable I will be private to each thread; each thread will have its own unique copy.
!     The iterations of the loop will be distributed dynamically in CHUNK sized pieces.
!     Threads will not synchronize upon completing their individual pieces of work (NOWAIT).

       INTEGER N, CHUNKSIZE, CHUNK, I
       PARAMETER (N=1000) 
       PARAMETER (CHUNKSIZE=100) 
       REAL A(N), B(N), C(N)

 !     Some initializations
       DO I = 1, N
         A(I) = I * 1.0
         B(I) = A(I)
       ENDDO
       CHUNK = CHUNKSIZE
        
 !$OMP PARALLEL SHARED(A,B,C,CHUNK) PRIVATE(I)

 !$OMP DO SCHEDULE(DYNAMIC,CHUNK)
       DO I = 1, N
          C(I) = A(I) + B(I)
       ENDDO
 !$OMP END DO NOWAIT

 !$OMP END PARALLEL

       END

