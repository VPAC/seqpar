/************************************************************************
 * This file has been written as a sample solution to an exercise in a 
 * course given at the Edinburgh Parallel Computing Centre. It is made
 * freely available with the understanding that every copy of this file
 * must include this header and that EPCC takes no responsibility for
 * the use of the enclosed teaching material.
 *
 * Authors:     Joel Malard, Alan Simpson
 *
 * Contact:     epcc-tec@epcc.ed.ac.uk
 *
 * Purpose:     A program to experiment with point-to-point
 *              communications.   
 *
 * Contents:    C source code.
 *
 ************************************************************************/

#include <stdlib.h>
#include <stdio.h>
#include <mpi.h>


#define proc_A 0
#define proc_B 1
#define pingpongtag 101


void processor_A (void);
void processor_B (void);

int main ( int argc, char *argv[] )
{
     int rank, size;

     MPI_Init(&argc, &argv);

     MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	 MPI_Comm_size(MPI_COMM_WORLD, &size);
	
	if ( size != 2 ) {
		fprintf( stderr, "Error: unexpected processor count %u used by program %s "
			"(should be 2)! Aborting.\n", rank, argv[0] );
		MPI_Abort( MPI_COMM_WORLD, EXIT_FAILURE );
	}	
	
	if (rank == proc_A) {
		processor_A();
	}
	else if (rank == proc_B) {
		processor_B();
	}
	else {
		fprintf( stderr, "Error: unexpected processor %u used by program %s! Aborting.\n",
			rank, argv[0] );
		MPI_Abort( MPI_COMM_WORLD, EXIT_FAILURE );
	}	
    
     MPI_Finalize();
	return 0;
}

void processor_A( void )
{

    int ii;
    MPI_Status status;
    double start, finish, time;
    float buffer[100000];
    int length;

    printf("Length\tTotal Time\tTransfer Rate\n");

     for (length = 1; length <=  100000; length += 1000){ 

        start = MPI_Wtime();


        for (ii= 1; ii<= 100; ii++){

            MPI_Ssend(buffer, length, MPI_FLOAT, proc_B, pingpongtag,
                      MPI_COMM_WORLD);

            MPI_Recv(buffer, length, MPI_FLOAT, proc_B, pingpongtag,
                     MPI_COMM_WORLD, &status);

        }

        finish = MPI_Wtime();

        time = finish - start;

 	printf("%d\t%f\t%f\n", length, time/200.,
               (float)(2 * 8 * 100 * length)/time);

    }

}

void processor_B( void )
{
    int ii;
    MPI_Status status;
    float buffer[100000];
    int length;

    for (length = 1; length <= 100000; length += 1000) { 

            for (ii= 1; ii<= 100; ii++) {

                MPI_Recv(buffer, length, MPI_FLOAT, proc_A, pingpongtag,
                         MPI_COMM_WORLD, &status);

                MPI_Ssend(buffer, length, MPI_FLOAT, proc_A, pingpongtag,
                         MPI_COMM_WORLD);

            }

    }

}


