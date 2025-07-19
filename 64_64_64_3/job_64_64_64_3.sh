#!/bin/bash
#SBATCH -N 2
#SBATCH --ntasks-per-node=32
#SBATCH --error=job.%J.err
#SBATCH --output=job.%J.out
#SBATCH --time=00:20:00         ## wall-clock time limit
#SBATCH --partition=standard    ## can be "standard" or "cpu"

echo `date`
touch parallel_small_64.txt
touch parallel_small_32.txt
touch parallel_small_16.txt
touch parallel_small_8.txt
mpirun -np 64 ./executable data_64_64_64_3.bin.txt 4 4 4 64 64 64 3 o1.txt
mpirun -np 64 ./executable data_64_64_64_3.bin.txt 4 4 4 64 64 64 3 o2.txt
mpirun -np 64 ./executable data_64_64_64_3.bin.txt 4 4 4 64 64 64 3 o3.txt
mpirun -np 64 ./executable data_64_64_64_3.bin.txt 4 4 4 64 64 64 3 o4.txt
mpirun -np 64 ./executable data_64_64_64_3.bin.txt 4 4 4 64 64 64 3 o5.txt
cat o1.txt o2.txt o3.txt o4.txt o5.txt > parallel_small_64.txt
mpirun -np 32 ./executable data_64_64_64_3.bin.txt 4 4 2 64 64 64 3 o1.txt
mpirun -np 32 ./executable data_64_64_64_3.bin.txt 4 4 2 64 64 64 3 o2.txt
mpirun -np 32 ./executable data_64_64_64_3.bin.txt 4 4 2 64 64 64 3 o3.txt
mpirun -np 32 ./executable data_64_64_64_3.bin.txt 4 4 2 64 64 64 3 o4.txt
mpirun -np 32 ./executable data_64_64_64_3.bin.txt 4 4 2 64 64 64 3 o5.txt
cat o1.txt o2.txt o3.txt o4.txt o5.txt > parallel_small_32.txt
mpirun -np 16 ./executable data_64_64_64_3.bin.txt 4 2 2 64 64 64 3 o1.txt
mpirun -np 16 ./executable data_64_64_64_3.bin.txt 4 2 2 64 64 64 3 o2.txt
mpirun -np 16 ./executable data_64_64_64_3.bin.txt 4 2 2 64 64 64 3 o3.txt
mpirun -np 16 ./executable data_64_64_64_3.bin.txt 4 2 2 64 64 64 3 o4.txt
mpirun -np 16 ./executable data_64_64_64_3.bin.txt 4 2 2 64 64 64 3 o5.txt
cat o1.txt o2.txt o3.txt o4.txt o5.txt > parallel_small_16.txt
mpirun -np 8 ./executable data_64_64_64_3.bin.txt 2 2 2 64 64 64 3 o1.txt
mpirun -np 8 ./executable data_64_64_64_3.bin.txt 2 2 2 64 64 64 3 o2.txt
mpirun -np 8 ./executable data_64_64_64_3.bin.txt 2 2 2 64 64 64 3 o3.txt
mpirun -np 8 ./executable data_64_64_64_3.bin.txt 2 2 2 64 64 64 3 o4.txt
mpirun -np 8 ./executable data_64_64_64_3.bin.txt 2 2 2 64 64 64 3 o5.txt
cat o1.txt o2.txt o3.txt o4.txt o5.txt > parallel_small_8.txt
echo `date`