program hello
	include "omp_lib.h"
	! implicit none 
	character(len=16) :: greetings 
	integer :: a
	greetings = "Hello World!" 
	
	!$omp parallel
	!$omp do 
	! Hello World, one million times
	do a = 1, 1000000
	print *, greetings   
	end do
	!$omp end parallel
	
end program hello

