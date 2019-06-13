#!/bin/bash --login
#
# Parallel script produced by bolt
#        Resource: ARCHER (Cray XC30 (24-core per node))
#    Batch system: PBSPro_select
#
# bolt is written by EPCC (http://www.epcc.ed.ac.uk)
#
#PBS -l select=1
#PBS -N benchmark-FFT
#PBS -A c01-hec
#PBS -l walltime=24:0:0

# Switch to current working directory
cd $PBS_O_WORKDIR


export PMI_NO_FORK=1
export KMP_AFFINITY=disabled
source ${DATA}/FFTC/init-archer.sh
PROG=${DATA}/FFTC/test


N_RUNS=10

N_COILS=1


export OMP_NUM_THREADS=1

FILE=results/flatness.txt
echo "" > $FILE


NX=512 
NY=512
NZ=512
echo "================" >> $FILE 
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 24 $PROG $NX $NY $NZ $N_COILS >> $FILE
done

NX=256
NY=256
NZ=2048 
echo "================" >> $FILE 
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 24 $PROG $NX $NY $NZ $N_COILS >> $FILE
done

NX=128
NY=128
NZ=8192
echo "================" >> $FILE 
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 24 $PROG $NX $NY $NZ $N_COILS >> $FILE
done

NX=64
NY=64
NZ=32768 
echo "================" >> $FILE 
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 24 $PROG $NX $NY $NZ $N_COILS >> $FILE
done

NX=32
NY=32
NZ=131072
echo "================" >> $FILE 
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 24 $PROG $NX $NY $NZ $N_COILS >> $FILE
done

NX=16
NY=16
NZ=524288
echo "================" >> $FILE 
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 24 $PROG $NX $NY $NZ $N_COILS >> $FILE
done

NX=8
NY=8
NZ=2097152
echo "================" >> $FILE 
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 24 $PROG $NX $NY $NZ $N_COILS >> $FILE
done

NX=4
NY=4
NZ=8388608
echo "================" >> $FILE 
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 24 $PROG $NX $NY $NZ $N_COILS >> $FILE
done

NX=2
NY=2
NZ=33554432
echo "================" >> $FILE 
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 24 $PROG $NX $NY $NZ $N_COILS >> $FILE
done

NX=1
NY=1
NZ=134217728
echo "================" >> $FILE 
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 24 $PROG $NX $NY $NZ $N_COILS >> $FILE
done


