program pingpong
! Test communication time between two processors to find the latency 
!   and bandwidth.  See p 251 in Pacheco
! Mark Petersen, CU Applied Math, Oct 03

! if you are using mpich:
  use mpi, myMPI_Wtime => MPI_Wtime
  use iflport, only: hostnam
  implicit none
! if you are using scali mpi:
! include '/opt/scali/include/mpif.h'

  integer, parameter :: ntotal=17  ! go up to 16 for max test
  double precision A(2**ntotal)
  real time(0:ntotal), time_begin, time_end, slope(0:ntotal)
  integer n,j,jtotal(ntotal),m
  integer myid, p, ierr, rc, status(MPI_STATUS_SIZE)
  integer :: istatus(4)
  character :: host_name *25
  istatus = hostnam(host_name)
 
  call MPI_INIT( ierr )
  call MPI_COMM_RANK( MPI_COMM_WORLD, myid, ierr )
  call MPI_COMM_SIZE( MPI_COMM_WORLD, p, ierr )

  A=0; slope=0
  print *, 'Process ', myid, ' is alive on ',trim(host_name)
  if (myid==0)  then 
    print *, '    size   number      time        slope      bandwidth'
    print *, '    bytes  iterations  microsec    sec/MB     MB/sec   '
  endif 

  do n=0,ntotal 
    m=2**n
    jtotal(n) = 1000/real(n+1)
    A(1:m) = sqrt(2.)
    do j=1,jtotal(n)
      if (j==3)  time_begin=myMPI_Wtime() ! begin timer after 2 coms
      if (myid==0) then
        call MPI_SEND(A(1:m),m,MPI_double_precision, 1, j*10 , &
                  MPI_COMM_WORLD,ierr)
        call MPI_RECV(A(1:m),m,MPI_double_precision, 1, j*10+1 , &
                    MPI_COMM_WORLD,status,ierr)
      elseif (myid==1) then
        call MPI_RECV(A(1:m),m,MPI_double_precision, 0, j*10 , &
                    MPI_COMM_WORLD,status,ierr)
        call MPI_SEND(A(1:m),m,MPI_double_precision, 0, j*10+1 , &
                  MPI_COMM_WORLD,ierr)
      endif
    enddo
    time_end = myMPI_Wtime()
    ! Time per send/recv, in seconds 
    ! -2 is because first 2 are not timed
    ! /2 is for each send/receive pair
    time(n) = (time_end -time_begin)/(jtotal(n)-2)/2

    ! slope on this chart is dt/dMB
    ! 2**20 is 1 MB, 8*2**n is the current message size.
    if (n>0) slope(n)=(time(n)-time(n-1))*2**20/8/(2**n-2**(n-1))

    if (myid==0)  then 
      print '(2i10,f12.1,2es12.2)', 8*2**n, jtotal(n), &
        time(n)*1e6, slope(n), 1/slope(n)
    endif 

  enddo

  call MPI_FINALIZE(rc)

end program pingpong
