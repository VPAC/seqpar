#include <stdio.h>
#include <omp.h>

int b;

void do_work()
{
    int i;

    #pragma omp parallel
    {
        #pragma omp for ordered private(b)
        // INCORRECT: private variable "b" not initialized before entry to the loop
        for (i = b; i < 9; i++) {
            b++;
            #pragma omp ordered
            printf("i = %d, #threads = %d, b = %d\n", i, omp_get_thread_num (), b);
        }

    }
}

int main(int argc, char **argv)
{
    b = 5;
    omp_set_num_threads(3);
    do_work();
    return 0;
}
        
