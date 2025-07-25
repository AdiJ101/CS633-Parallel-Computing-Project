#!/bin/bash
#SBATCH -N 2
#SBATCH --ntasks-per-node=32
#SBATCH --error=job.%J.err
#SBATCH --output=job.%J.out
#SBATCH --time=00:20:00         ## wall-clock time limit
#SBATCH --partition=standard    ## can be "standard" or "cpu"

mpirun -np 64 ./executable data_64_64_64_3.bin.txt 4 4 4 64 64 64 3 output_64_64_64_3_64.txt