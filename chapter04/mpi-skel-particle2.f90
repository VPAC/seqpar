        program particle_advector

          implicit none

          include 'mpif.h'

          real, parameter       :: movementSpeedDivisor=3
          integer               :: movementSign=1
          real, parameter, dimension(2) :: attractorPoint=0.0

          integer               :: numTimeSteps=10
          integer               :: timeStep_I=0
          integer               :: globalParticlesCount=50
          integer               :: localParticlesCount
          integer               :: gParticle_I, lParticle_I

          integer       :: seed
          real          :: closestDistance
          integer       :: closestParticleId
          real          :: distance, distFromAttractor

          integer       :: myRank=0, nProc=0, ierr

          integer, parameter :: bigNum = 1000000
          integer            :: randXCoord,randYCoord
          real               :: randNumX, randNumY

          ! derived data type on which the MPI data type is to be based
          type particle
            integer     :: id
            integer     :: tag
            real        :: xCoord
            real        :: yCoord
          end type

          type(particle), dimension(:), allocatable :: localParticles
          type(particle), dimension(:), allocatable :: globalParticles
          
          call MPI_INIT(ierr)
          call MPI_COMM_RANK( MPI_COMM_WORLD, myRank, ierr )
          call MPI_COMM_SIZE( MPI_COMM_WORLD, nProc, ierr )

          ! TODO: set up and commit new data type

            ! only the root processor should do this
            allocate( globalParticles(globalParticlesCount), stat=ierr )

            seed = 101
            call RANDOM_SEED( seed )

            ! initialise particle properties - do on root processor only
            do gParticle_I = 1, globalParticlesCount
              globalParticles(gParticle_I)%id = gParticle_I
              globalParticles(gParticle_I)%tag = MOD( gParticle_I, 10 )
              call RANDOM_NUMBER( randNumX )
              randXCoord = bigNum * randNumX
              globalParticles(gParticle_I)%xCoord = 5.0 +  &
              &   1.0 * MOD( randXCoord, 1000 ) / 200
              call RANDOM_NUMBER( randNumY )
              randYCoord = bigNum * randNumY
              globalParticles(gParticle_I)%yCoord = 5.0 + &
              &   1.0 * MOD( randYCoord, 1000 ) / 200
            end do

          ! TODO: calculate how many particles are to be assigned to each
          ! processor and modify accordingly
          localParticlesCount = globalParticlesCount

          allocate( localParticles(localParticlesCount), stat=ierr )

          ! distribute globalParticles arrays between processor, into each
          ! processor's localParticles arrays 

          ! TODO : advanced 3: use scatterv to work with any number of
          ! processors

          do timeStep_I = 1, numTimeSteps
            closestDistance = 100000.0

            do lParticle_I = 1, localParticlesCount
              call updatePartToAttr( &
              &       localParticles(lParticle_I)%xCoord, &
              &       localParticles(lParticle_I)%yCoord, &
              &       attractorPoint, movementSpeedDivisor, &
              &       movementSign )

              distance = distFromAttractor( &
              &             localParticles(lParticle_I)%xCoord, &
              &             localParticles(lParticle_I)%yCoord, &
              &             attractorPoint ) 

              if( distance .lt. closestDistance ) then
                closestDistance = distance
                closestParticleId = localParticles(lParticle_I)%id
              end if
            end do
 
            print*, myRank, ': After timestep', timeStep_I, &
            &       'closest particle is', closestParticleId, &
            &       ', at distance', closestDistance 

            ! TODO advanced 1: if processor 0, calculate a global minimum
            ! TODO advanced 2: if closest global particle < 0, then flip
            ! particles to move away from now on
          end do

          ! do this on root processor only
            deallocate( globalParticles )

          deallocate( localParticles )

          call MPI_FINALIZE(ierr)

        end program

        subroutine updatePartToAttr( xCoord, yCoord, attractorPoint, &
        &                            movementSpeedDivisor, &
        &                            movementSign )

          implicit none

          real               :: xCoord,yCoord
          real, dimension(2) :: attractorPoint
          real               :: movementSpeedDivisor
          integer            :: movementSign

          real, dimension(2) :: movementVector
          integer            :: dim_I

          movementVector(1) = (attractorPoint(1) - xCoord) / &
          &                   movementSpeedDivisor
          movementVector(2) = (attractorPoint(2) - yCoord) / &
          &                   movementSpeedDivisor

          do dim_I = 1, 2
            movementVector(dim_I) = movementVector(dim_I) * &
            &                       movementSign
          end do

          xCoord = xCoord + movementVector(1)
          yCoord = yCoord + movementVector(2)

        end subroutine

        real function distFromAttractor( xCoord, yCoord, &
        &                                attractorPoint )

          implicit none

          real               :: xCoord, yCoord
          real, dimension(2) :: attractorPoint

          real, dimension(2) :: differenceVector

          differenceVector(1) = attractorPoint(1) - xCoord
          differenceVector(2) = attractorPoint(2) - yCoord

          distFromAttractor = SQRT( differenceVector(1) * &
          &                         differenceVector(1) + &
          &                         differenceVector(2) * &
          &                         differenceVector(2) )

        end function



