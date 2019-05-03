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
#PBS -l walltime=16:0:0

# Switch to current working directory
cd $PBS_O_WORKDIR



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

NX=2048 
NY=256
NZ=256
echo "================" >> $FILE 
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 24 $PROG $NX $NY $NZ $N_COILS >> $FILE
done

NX=8192
NY=128
NZ=128
echo "================" >> $FILE 
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 24 $PROG $NX $NY $NZ $N_COILS >> $FILE
done

NX=32768 
NY=64
NZ=64
echo "================" >> $FILE 
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 24 $PROG $NX $NY $NZ $N_COILS >> $FILE
done

NX=131072
NY=32
NZ=32
echo "================" >> $FILE 
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 24 $PROG $NX $NY $NZ $N_COILS >> $FILE
done

NX=524288
NY=16
NZ=16
echo "================" >> $FILE 
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 24 $PROG $NX $NY $NZ $N_COILS >> $FILE
done

NX=2097152
NY=8
NZ=8
echo "================" >> $FILE 
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 24 $PROG $NX $NY $NZ $N_COILS >> $FILE
done

NX=8388608
NY=4
NZ=4
echo "================" >> $FILE 
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 24 $PROG $NX $NY $NZ $N_COILS >> $FILE
done

NX=33554432
NY=2
NZ=2
echo "================" >> $FILE 
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 24 $PROG $NX $NY $NZ $N_COILS >> $FILE
done

NX=134217728
NY=1
NZ=1
echo "================" >> $FILE 
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 24 $PROG $NX $NY $NZ $N_COILS >> $FILE
done


