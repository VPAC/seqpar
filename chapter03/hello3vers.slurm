#!/bin/bash
#SBATCH --time=0:01:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
module load GCC/4.9.2
export OMP_NUM_THREADS=8
./hello3versompc
