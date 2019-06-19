#!/bin/bash --login
#
# Parallel script produced by bolt
#        Resource: ARCHER (Cray XC30 (24-core per node))
#    Batch system: PBSPro_select
#
# bolt is written by EPCC (http://www.epcc.ed.ac.uk)
#
#PBS -l select=4
#PBS -N benchmark-FFT
#PBS -A c01-hec
#PBS -l walltime=16:0:0

# Switch to current working directory
cd $PBS_O_WORKDIR


export PMI_NO_FORK=1
export KMP_AFFINITY=disabled
source ${DATA}/FFTC/mpi/init.sh


# 3D
# 256 x 256 x 256
# 
# 1 process,    1 threads
# 1 process,    2 threads
# 1 process,    4 threads
# 1 process,    6 threads
# 1 process,   12 threads
# 1 process,   24 threads
# 2 processes, 48 threads
# 4 processes, 96 threads


N_X=6144
N_Y=2048
N_Z=1
PROG=${DATA}/FFTC/mpi/testmkl 
 

N_RUNS=10

FILE=/work/c01/c01/gambron/benchmarks_fftcgpu/archer/mpi/results/mkl-mpi-multithr-2d.txt
echo "" > $FILE

echo "===========================\n"
echo "1 process\n"
echo "1 thread\n"
export OMP_NUM_THREADS=1
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 1 $PROG $N_X $N_Y $N_Z >> $FILE
done

echo "===========================\n"
echo "1 process\n"
echo "2 thread\n"
export OMP_NUM_THREADS=2
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 2 $PROG $N_X $N_Y $N_Z >> $FILE
done

echo "===========================\n"
echo "1 process\n"
echo "4 thread\n"
export OMP_NUM_THREADS=4
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 4 $PROG $N_X $N_Y $N_Z >> $FILE
done

echo "===========================\n"
echo "1 process\n"
echo "6 thread\n"
export OMP_NUM_THREADS=6
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 6 $PROG $N_X $N_Y $N_Z >> $FILE
done

echo "===========================\n"
echo "1 process\n"
echo "12 thread\n"
export OMP_NUM_THREADS=12
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 12 $PROG $N_X $N_Y $N_Z >> $FILE
done

echo "===========================\n"
echo "1 process\n"
echo "24 thread\n"
export OMP_NUM_THREADS=24
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 24 $PROG $N_X $N_Y $N_Z >> $FILE
done

echo "===========================\n"
echo "2 process\n"
echo "48 thread\n"
export OMP_NUM_THREADS=24
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 2 -N 1 -d 24 $PROG $N_X $N_Y $N_Z >> $FILE
done

echo "===========================\n"
echo "4 process\n"
echo "96 thread\n"
export OMP_NUM_THREADS=24
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 4 -N 1 -d 24 $PROG $N_X $N_Y $N_Z >> $FILE
done
