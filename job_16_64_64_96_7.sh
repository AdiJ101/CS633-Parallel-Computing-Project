#!/bin/bash
#SBATCH -N 2
#SBATCH --ntasks-per-node=32
#SBATCH --error=job.%J.err
#SBATCH --output=job.%J.out
#SBATCH --time=00:20:00         ## wall-clock time limit
#SBATCH --partition=standard    ## can be "standard" or "cpu"

mpirun -np 16 ./executable data_64_64_96_7.bin.txt 4 2 2 64 64 96 7 output_64_64_96_7_16.txt