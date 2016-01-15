#include <stdio.h>
#include <stdlib.h>
#include "omp.h"

int main (void)
{
#pragma omp parallel
 { 
  #pragma omp single
   {
    printf("Noam Chomsky said ");
    #pragma omp task
     {	printf("Colourless "); }
    #pragma omp task
     {  printf("green ");      }
    #pragma omp task
     {	printf("ideas ");      }
	printf("sleep furiously ");
   }
   }
 printf("\n");
 return(0);
}	
