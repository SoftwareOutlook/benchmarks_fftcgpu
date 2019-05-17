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

POWERS2_3D=(32 64 128 256 512)
PRODUCT_INTEGERS_3D=(30 70 105 210 420)
PRIMES_3D=(31 61 127 257 509)  

POWERS2_2D=(512 1024 2048 4096 8192)
PRODUCT_INTEGERS_2D=(504 1029 2058 4116 8232)
PRIMES_2D=(509 1021 2027 4049 8123)

POWERS2_1D=(256 1024 4096 16384 65536 262144 1048576 4194304 16777216 67108864) 
PRODUCT_INTEGERS_1D=(210 1260 4410 15750 66150 257250 1080450 4321800 15435000 64827000)
PRIMES_1D=(257 1021 4093 16381 65521 262139 1048573 4194301 16777213 67108859)




N=512
FILE=results/mpiconst.txt
echo "" > $FILE

N_PROCESSES=1
N_THREADS=24
echo "================" >> $FILE   
export OMP_NUM_THREADS=$N_THREADS 
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n $N_PROCESSES -N $N_PROCESSES -d $N_THREADS $PROG $N $N $N $N_COILS >> $FILE
done

N_PROCESSES=2
N_THREADS=12
echo "================" >> $FILE   
export OMP_NUM_THREADS=$N_THREADS 
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n $N_PROCESSES -N $N_PROCESSES -d $N_THREADS $PROG $N $N $N $N_COILS >> $FILE
done

N_PROCESSES=4
N_THREADS=6
echo "================" >> $FILE   
export OMP_NUM_THREADS=$N_THREADS 
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n $N_PROCESSES -N $N_PROCESSES -d $N_THREADS $PROG $N $N $N $N_COILS >> $FILE
done

N_PROCESSES=8
N_THREADS=3
echo "================" >> $FILE   
export OMP_NUM_THREADS=$N_THREADS 
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n $N_PROCESSES -N $N_PROCESSES -d $N_THREADS $PROG $N $N $N $N_COILS >> $FILE
done

N_PROCESSES=12
N_THREADS=2
echo "================" >> $FILE   
export OMP_NUM_THREADS=$N_THREADS 
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n $N_PROCESSES -N $N_PROCESSES -d $N_THREADS $PROG $N $N $N $N_COILS >> $FILE
done

N_PROCESSES=24
N_THREADS=1
echo "================" >> $FILE   
export OMP_NUM_THREADS=$N_THREADS 
for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
do
  echo "----------------" >> $FILE
  aprun -n $N_PROCESSES -N $N_PROCESSES -d $N_THREADS $PROG $N $N $N $N_COILS >> $FILE
done
