export KMP_AFFINITY=disabled
source ${DATA}/FFTC/init-archer.sh
PROG=${DATA}/FFTC/test


N_RUNS=10

N_COILS=1

POWERS2_3D=(32 64 128 256 512)
PRODUCT_INTEGERS_3D=(30 70 105 210 420)
PRIMES_3D=(31 61 127 257 509)  

POWERS2_1D=(256 1024 4096 16384 65536 262144 1048576 4194304 16777216 67108864) 
PRODUCT_INTEGERS_1D=(210 1260 4410 15750 66150 257250 1080450 4321800 15435000 64827000)
PRIMES_1D=(257 1021 4093 16381 65521 262139 1048573 4194301 16777213 67108859)

export OMP_NUM_THREADS=1

FILE=powers2-3d.txt
echo "" > $FILE
for N in ${POWERS2_3D[@]}
do
  echo "================" >> $FILE 
  for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
  do
    echo "----------------" >> $FILE
    aprun -n 1 -N 1 -d 24 $PROG $N $N $N $N_COILS >> $FILE
  done
done

FILE=productintegers-3d.txt
echo "" > $FILE
for N in ${PRODUCT_INTEGERS_3D[@]}
do
  echo "================" >> $FILE   
  for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
  do
    echo "----------------" >> $FILE
    aprun -n 1 -N 1 -d 24 $PROG $N $N $N $N_COILS >> $FILE
  done
done

FILE=primes-3d.txt
echo "" > $FILE
for N in ${PRIMES_3D[@]}
do
  echo "================" >> $FILE 
  for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
  do
    echo "----------------" >> $FILE
    aprun -n 1 -N 1 -d 24 $PROG $N $N $N $N_COILS >> $FILE
  done
done

FILE=powers2-1d.txt
echo "" > $FILE
for N in ${POWERS2_1D[@]}
do
   echo "================" >> $FILE  
  for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
  do
    echo "----------------" >> $FILE
    aprun -n 1 -N 1 -d 24 $PROG $N $N $N $N_COILS >> $FILE
  done
done

FILE=productintegers-1d.txt
echo "" > $FILE
for N in ${PRODUCT_INTEGERS_1D[@]}
do
  echo "================" >> $FILE   
  for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
  do
    echo "----------------" >> $FILE
    aprun -n 1 -N 1 -d 24 $PROG $N $N $N $N_COILS >> $FILE
  done
done

FILE=primes-1d.txt
echo "" > $FILE
for N in ${PRIMES_1D[@]}
do
  echo "================" >> $FILE    
  for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
  do
    echo "----------------" >> $FILE
    aprun -n 1 -N 1 -d 24 $PROG $N $N $N $N_COILS >> $FILE
  done
done


MULTITHREADING=(1 2 4 8 16 24)
N=512
FILE=multithreading.txt
echo "" > $FILE
for N_THREADS in ${MULITHREADING[@]}
do
  echo "================" >> $FILE   
  export OMP_NUM_THREADS=$N_THREADS 
  for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
  do
    echo "----------------" >> $FILE
    aprun -n 1 -N 1 -d 24 $PROG $N $N $N $N_COILS >> $FILE
  done
done


export OMP_NUM_THREADS=1
FILE=ccppetmr.txt
CCPPETMR=(252 256 257)
N_COILS=32
echo "" > $FILE
for N in ${CCPPETMR[@]}
do
  echo "================" >> $FILE    
  for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
  do
    echo "----------------" >> $FILE
    aprun -n 1 -N 1 -d 24 $PROG $N $N $N $N_COILS >> $FILE
  done
done

