       program hello2omp
	include "omp_lib.h"
	integer :: id
	!$omp parallel num_threads(17) private(id)
	  id = omp_get_thread_num() 
          print *, "Hello world", id 
	!$omp end parallel
       end program hello2omp
