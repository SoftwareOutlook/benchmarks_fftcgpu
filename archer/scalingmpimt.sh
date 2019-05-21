#!/bin/bash --login
#
# Parallel script produced by bolt
#        Resource: ARCHER (Cray XC30 (24-core per node))
#    Batch system: PBSPro_select
#
# bolt is written by EPCC (http://www.epcc.ed.ac.uk)
#
#PBS -l select=8
#PBS -N benchmark-FFT
#PBS -A c01-hec
#PBS -l walltime=16:0:0

# Switch to current working directory
cd $PBS_O_WORKDIR


export PMI_NO_FORK=1
export KMP_AFFINITY=disabled
source ${DATA}/FFTC/init-archer.sh
PROG=${DATA}/FFTC/test


N_RUNS=10

N_COILS=1

POWERS2_3D=(32 64 128 256 512)
PRODUCT_INTEGERS_3D=(30 70 105 210 420)
PRIMES_3D=(31 61 127 257 509)  

POWERS2_2D=(512 1024 2048 4096 8192)
PRODUCT_INTEGERS_2D=(504 1029 2058 4116 8232)
PRIMES_2D=(509 1021 2027 4049 8123)

POWERS2_1D=(256 1024 4096 16384 65536 262144 1048576 4194304 16777216 67108864) 
PRODUCT_INTEGERS_1D=(210 1260 4410 15750 66150 257250 1080450 4321800 15435000 64827000)
PRIMES_1D=(257 1021 4093 16381 65521 262139 1048573 4194301 16777213 67108859)



N=256
FILE=results/scalingmpimt.txt
echo "" > $FILE



export OMP_NUM_THREADS=1
echo "================" >> $FILE    
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 1  $PROG $N $N $N $N_COILS >> $FILE
done


export OMP_NUM_THREADS=2
echo "================" >> $FILE    
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 2 $PROG $N $N $N $N_COILS >> $FILE
done

export OMP_NUM_THREADS=4
echo "================" >> $FILE    
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 4 $PROG $N $N $N $N_COILS >> $FILE
done

export OMP_NUM_THREADS=8
echo "================" >> $FILE    
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 8 $PROG $N $N $N $N_COILS >> $FILE
done

export OMP_NUM_THREADS=12
echo "================" >> $FILE    
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 1 -N 1 -d 12 $PROG $N $N $N $N_COILS >> $FILE
done

export OMP_NUM_THREADS=12
echo "================" >> $FILE    
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 2 -N 2 -d 12 $PROG $N $N $N $N_COILS >> $FILE
done

export OMP_NUM_THREADS=12
echo "================" >> $FILE    
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 4 -N 2 -d 12 $PROG $N $N $N $N_COILS >> $FILE
done

export OMP_NUM_THREADS=12
echo "================" >> $FILE    
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 8 -N 2 -d 12 $PROG $N $N $N $N_COILS >> $FILE
done

export OMP_NUM_THREADS=12
echo "================" >> $FILE    
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n 16 -N 2 -d 12 $PROG $N $N $N $N_COILS >> $FILE
done