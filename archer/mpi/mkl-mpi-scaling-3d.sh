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

PROG=${DATA}/FFTC/mpi/testmkl 
 

N_RUNS=10
RESULTS_DIR=/work/c01/c01/gambron/benchmarks_fftcgpu/archer/mpi/results
FILE=${RESULTS_DIR}/mkl-mpi-scaling-3d.txt
echo "" > $FILE

export OMP_NUM_THREADS=24




N_X=192
N_Y=8
N_Z=8
echo "===========================\n" >> $FILE
echo $N_X $N_Y $N_Z >> $FILE
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 4 -N 1 -d 24 $PROG $N_X $N_Y $N_Z >> $FILE
done


N_X=384
N_Y=16
N_Z=16
echo "===========================\n" >> $FILE
echo $N_X $N_Y $N_Z >> $FILE
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 4 -N 1 -d 24 $PROG $N_X $N_Y $N_Z >> $FILE
done


N_X=768
N_Y=32
N_Z=32
echo "===========================\n" >> $FILE
echo $N_X $N_Y $N_Z >> $FILE
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 4 -N 1 -d 24 $PROG $N_X $N_Y $N_Z >> $FILE
done


N_X=1536
N_Y=64
N_Z=64
echo "===========================\n" >> $FILE
echo $N_X $N_Y $N_Z >> $FILE
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 4 -N 1 -d 24 $PROG $N_X $N_Y $N_Z >> $FILE
done

N_X=3072
N_Y=128
N_Z=128
echo "===========================\n" >> $FILE
echo $N_X $N_Y $N_Z >> $FILE
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 4 -N 1 -d 24 $PROG $N_X $N_Y $N_Z >> $FILE
done


