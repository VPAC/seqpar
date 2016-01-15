       program colourless
	include "omp_lib.h"
	!$omp parallel
	 !$omp single
          print *, "Colourless "
	  print *, "green "
	  print *, "ideas "
	  print *, "sleep furiously "
	 !$omp end single
	!$omp end parallel
       end program colourless
