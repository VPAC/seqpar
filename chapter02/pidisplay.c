#include <stdio.h>
#include <math.h>

int main()
{
   char str[80];

   sprintf(str, "Value of Scientific Notation Pi = %E", M_PI);
   puts(str);
   sprintf(str, "Value of Decimal Floating Point Pi = %f", M_PI);
   puts(str);
   
   return(0);
}

