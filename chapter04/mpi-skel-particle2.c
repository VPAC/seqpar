#include <stdlib.h>
#include <stdio.h>
#include <mpi.h>
#include <math.h>

typedef double Coord[2];
typedef char Bool;
const char False = 0; 
const char True = 1; 

typedef struct Particle {
	unsigned int   globalId;
	unsigned int   tag;
	Coord          coord;
} Particle;

Coord attractorPoint = { 0.0, 0.0 };
double movementSpeedDivisor = 3;
unsigned int movementSign = 1;

void updateParticleTowardsAttractor( Particle* particle ) {
	Coord          movementVector;
	unsigned int   dim_I;
	
	for ( dim_I = 0; dim_I < 2; dim_I++ ) {
		movementVector[dim_I] = ( attractorPoint[dim_I] - particle->coord[dim_I] ) /
			movementSpeedDivisor;
		movementVector[dim_I] *= movementSign;
				
		particle->coord[dim_I] += movementVector[dim_I];
	}
}


double calculateDistanceFromAttractor( Coord coord ) {
	Coord          differenceVector;
	unsigned int   dim_I;

	for ( dim_I = 0; dim_I < 2; dim_I++ ) {
		differenceVector[dim_I] = attractorPoint[dim_I] - coord[dim_I];
	}

	return sqrt( pow( differenceVector[0], 2 ) + pow( differenceVector[1], 2 ) );
}


int main( int argc, char** argv ) {
	unsigned int  numTimeSteps = 10;
	unsigned int  timeStep_I = 0;
	unsigned int  globalParticlesCount = 100;
	unsigned int  localParticlesCount;
	unsigned int  gParticle_I;
	unsigned int  lParticle_I;
	Particle*     globalParticles = NULL;
	Particle*     localParticles = NULL;
	unsigned int  seed;
	double        closestDistance;
	unsigned int  closestParticleId;
	double        distance;
	int           myRank = 0;	

	MPI_Init( &argc, &argv );
	MPI_Comm_rank( MPI_COMM_WORLD, &myRank );

	// TODO: set up and commit your new particle datatype

	globalParticles = malloc( sizeof(Particle) * globalParticlesCount );

	// TODO: only processor 0 should perform this
	printf( "Please input a seed for the random particle coordinates:\n" );
	scanf( "%u", &seed );
	srand( seed );

	for ( gParticle_I = 0; gParticle_I < globalParticlesCount; gParticle_I++ ) {
		globalParticles[gParticle_I].globalId = gParticle_I;
		globalParticles[gParticle_I].tag = gParticle_I % 10;
		globalParticles[gParticle_I].coord[0] = 5 + (double)( rand() % 1000 ) / 200;
		globalParticles[gParticle_I].coord[1] = 5 + (double)( rand() % 1000 ) / 200;
	}

	localParticles = globalParticles;
	localParticlesCount = globalParticlesCount;
	// TODO : get rid of above 2 lines
	// TODO : calculate how many particles per processor, and allocate a localParticles array
	// localParticles = malloc( sizeof(Particle * localParticlesCount );
	// TODO : distribute globalParticles array between processors, into each processor's
	//	localParticles array
	// TODO : advanced 3: use scatterv to work with any number of processors
	
	for ( timeStep_I = 1; timeStep_I <= numTimeSteps; timeStep_I++ ) {
		closestDistance = 100000.0;

		for ( lParticle_I = 0; lParticle_I < localParticlesCount; lParticle_I++ ) {
			updateParticleTowardsAttractor( &localParticles[lParticle_I] );
			// record if particle is closest, and if so what distance is
			distance = calculateDistanceFromAttractor( localParticles[lParticle_I].coord );
			if ( distance < closestDistance ) {
				closestDistance = distance;
				closestParticleId = localParticles[lParticle_I].globalId;
			}
		}

		printf( "After timestep %d, closest particle is %d, at distance %g\n",
			timeStep_I, closestParticleId, closestDistance );
		// TODO advanced 1: if processor 0, calculate a _global_ minimum
		// TODO advanced 2: if closest global particle distance < 1.0, then flip
		// particles to move away from now on
	}

	MPI_Finalize();

	free( globalParticles );
	// TODO: free( localParticles );

	return 0;	
}


