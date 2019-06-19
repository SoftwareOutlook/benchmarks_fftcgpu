#!/bin/bash --login
#
# Parallel script produced by bolt
#        Resource: ARCHER (Cray XC30 (24-core per node))
#    Batch system: PBSPro_select
#
# bolt is written by EPCC (http://www.epcc.ed.ac.uk)
#
##PBS -l select=4
#PBS -l select=8
#PBS -N benchmark-FFT
#PBS -A c01-hec
#PBS -l walltime=16:0:0

# Switch to current working directory
cd $PBS_O_WORKDIR


export PMI_NO_FORK=1
export KMP_AFFINITY=disabled
source ${DATA}/FFTC/mpi/init.sh

export OMP_NUM_THREADS=1
# 3D
# 256 x 256 x 256
# 


N_X=6144
N_Y=2048
N_Z=1
PROG=${DATA}/FFTC/mpi/testmkl 
 

N_RUNS=10
RESULTS_DIR=/work/c01/c01/gambron/benchmarks_fftcgpu/archer/mpi/results
FILE=${RESULTS_DIR}/mkl-mpi-2d.txt
echo "" > $FILE

echo "===========================\n" >> $FILE
echo "1 process\n" >> $FILE
echo "1 thread\n" >> $FILE

for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 1 $PROG $N_X $N_Y $N_Z >> $FILE
done


echo "===========================\n" >> $FILE
echo "6 process\n" >> $FILE
echo "1 thread\n" >> $FILE

for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 6 -N 6 -d 1 $PROG $N_X $N_Y $N_Z >> $FILE
done

echo "===========================\n" >> $FILE
echo "8 process\n" >> $FILE
echo "1 thread\n" >> $FILE

for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 8 -N 8 -d 1 $PROG $N_X $N_Y $N_Z >> $FILE
done


echo "===========================\n" >> $FILE
echo "12 process\n" >> $FILE
echo "1 thread\n" >> $FILE

for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 12 -N 12 -d 1 $PROG $N_X $N_Y $N_Z >> $FILE
done

echo "===========================\n" >> $FILE
echo "16 process\n" >> $FILE
echo "1 thread\n" >> $FILE

for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 16 -N 16 -d 1 $PROG $N_X $N_Y $N_Z >> $FILE
done

echo "===========================\n" >> $FILE
echo "24 process\n" >> $FILE
echo "1 thread\n" >> $FILE
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 24 -N 24 -d 1 $PROG $N_X $N_Y $N_Z >> $FILE
done

echo "===========================\n" >> $FILE
echo "48 process\n" >> $FILE
echo "1 thread\n" >> $FILE

for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 48 -N 24 -d 1 $PROG $N_X $N_Y $N_Z >> $FILE
#   aprun -n 48 -N 12 -d 1 $PROG $N_X $N_Y $N_Z >> $FILE
done

echo "===========================\n" >> $FILE
echo "96 process\n" >> $FILE
echo "1 thread\n" >> $FILE

for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 96 -N 24 -d 1 $PROG $N_X $N_Y $N_Z >> $FILE
# aprun -n 96 -N 24 -d 1 $PROG $N_X $N_Y $N_Z >> $FILE
done
