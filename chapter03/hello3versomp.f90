program hello
	implicit none 
        include "omp_lib.h"

	character(len=16) :: greetingsen
	character(len=16) :: greetingsde
	character(len=16) :: greetingsfr 
	integer :: a, b, c
	greetingsen = "Hello World! " 
	greetingsde = "Hallo Welt! "
	greetingsfr = "Bonjour le monde! "	

	!$omp parallel 
	!$omp sections

	!$omp section
	do a = 1, 10
	print *, greetingsen, "From thread: ", OMP_GET_THREAD_NUM()  
	end do

	!$omp section
	do b = 1, 10
	print *, greetingsde, "Aus dem Faden: ", OMP_GET_THREAD_NUM()
	end do

	!$omp section
	do c = 1, 10
	print *, greetingsfr, "De fil: ", OMP_GET_THREAD_NUM()
	end do

	!$omp end sections 
	!$omp end parallel
	
end program hello

