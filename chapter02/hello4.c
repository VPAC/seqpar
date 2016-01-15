#include <stdio.h> 
int main(void) 
{ 
   char greetings[] = "Hello world!"; 
int c = 99;
do {
	printf("%s\n", greetings); 
	c++;
   }
while( c < 11 );

   return 0;
}
