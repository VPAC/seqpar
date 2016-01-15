#include <stdio.h>
#include  "omp.h"
int main(void)
{
	int id;

	#pragma omp parallel num_threads(4) private(id)
	{
	int id = omp_get_thread_num();
	printf("Hello world %d\n", id);
	}
return 0;
}
