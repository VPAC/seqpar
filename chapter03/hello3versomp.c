#include <stdio.h> 
#include  "omp.h"
int main(void) 
{ 
   char greetingsen[] = "Hello world!"; 
   char greetingsde[] = "Hallo Welt!";
   char greetingsfr[] = "Bonjour le monde!";
   int a,b,c;

   #pragma omp parallel sections
   {
   #pragma omp section
   	{
   	for ( a = 0; a < 10; a = a + 1 )
		{
		printf ("id = %d, %s\n", omp_get_thread_num(), greetingsen); 
   		}
	}

   #pragma omp section
   	{
	for ( b = 0; b < 10; b = b + 1 )
		{
		printf ("id = %d, %s\n", omp_get_thread_num(), greetingsde); 
		}
   	}

   #pragma omp section
   	{
	for ( c = 0; c < 10; c = c + 1 )
		{
		printf ("id = %d, %s\n", omp_get_thread_num(), greetingsfr);
		} 
   	}
    }
return 0;
}
