#include <stdio.h>
#include <stdlib.h>
#include "omp.h"

int main (int argc, char *argv[])
	{
#pragma omp parallel
 { 
   #pragma omp single
   {
	printf("Colourless ");
        #pragma omp task
        {
	printf("green ");
	}
        #pragma omp task
	{	
	printf("ideas ");
	}
        #pragma omp taskwait
	printf("sleep furiously ");
   }
 }
 printf("\n");
 return(0);
}	
