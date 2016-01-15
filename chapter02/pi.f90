c   example from MPICH
      program main

      include 'mpif.h'

      double precision  PI25DT
      parameter        (PI25DT = 3.141592653589793238462643d0)

      double precision  mypi, pi, h, sum, x, f, a
      double precision startwtime, endwtime;
      integer n, myid, numprocs, i, rc, namelen
      character*(MPI_MAX_PROCESSOR_NAME) processor_name
c                                 function to integrate
      f(a) = 4.d0 / (1.d0 + a*a)

      call MPI_INIT( ierr )
      call MPI_COMM_RANK( MPI_COMM_WORLD, myid, ierr )
      call MPI_COMM_SIZE( MPI_COMM_WORLD, numprocs, ierr )
      call MPI_GET_PROCESSOR_NAME(processor_name, namelen, ierr )

      write(*,96)myid,numprocs,processor_name
 96   format("Process ",I10," of ",I10," on ",A20)

C      sizetype   = 1
C      sumtype    = 2
      n =10000     
 10   if ( myid .eq. 0 ) then
C         write(6,98)
C 98      format('Enter the number of intervals: (0 quits)')
C         read(5,99) n
C 99      format(i10)
        startwtime = MPI_WTIME();
      endif
      
      call MPI_BCAST(n,1,MPI_INTEGER,0,MPI_COMM_WORLD,ierr)

c                                 check for quit signal
      if ( n .le. 0 ) goto 30

c                                 calculate the interval size
      h = 1.0d0/n

      sum  = 0.0d0
      do 20 i = myid+1, n, numprocs
         x = h * (dble(i) - 0.5d0)
         sum = sum + f(x)
 20   continue
      mypi = h * sum

c                                 collect all the partial sums
      call MPI_REDUCE(mypi,pi,1,MPI_DOUBLE_PRECISION,MPI_SUM,0,
     $     MPI_COMM_WORLD,ierr)

c                                 node 0 prints the answer.
      if (myid .eq. 0) then
         write(6, 97) pi, abs(pi - PI25DT)
 97      format('pi is approximately: ', F18.16,
     +          ' Error is: ', F18.16)
         endwtime = MPI_WTIME();                                                                                            
         write(*, 95)endwtime-startwtime
 95      format('wall clock time = ',F);
      endif
      n = 0
      goto 10

 30   call MPI_FINALIZE(rc)

      end

