#!/bin/bash

export OMP_PROC_BIND=spread

N_RUNS=10

PROGRAMS=(/home/pgambron/GPU/cuda/test /home/pgambron/GPU/opencl/test /home/pgambron/GPU/openacc/test)
PROGRAMSPROD=(/home/pgambron/GPU/kokkos/test /home/pgambron/GPU/openmp/test)

POWERS2_3D=(32 64 128 256 512)
PRODUCT_INTEGERS_3D=(30 70 105 210 420)
PRIMES_3D=(31 61 127 257 509)  

POWERS2_2D=(512 1024 2048 4096 8192)
PRODUCT_INTEGERS_2D=(504 1029 2058 4116 8232)
PRIMES_2D=(509 1021 2027 4049 8123)  

POWERS2_1D=(256 1024 4096 16384 65536 262144 1048576 4194304 16777216 67108864) 
PRODUCT_INTEGERS_1D=(210 1260 4410 15750 66150 257250 1080450 4321800 15435000 64827000)
PRIMES_1D=(257 1021 4093 16381 65521 262139 1048573 4194301 16777213 67108859)

echo "PRODUCT"
echo "======="
echo ""

N_COILS=1

for PROG in ${PROGRAMSPROD[@]}
do
  echo "===================================="
  echo "===================================="
  echo "===================================="
  echo $PROG 
  echo "===="
  for N in ${POWERS2_1D[@]}
  do
    echo "===================================="
    echo "===================================="
    for ((I_RUN=0; I_RUN<${N_RUNS}; I_RUN++))
    do
	echo "===================================="
	$PROG $N $N_COILS
    done
  done	
done


echo "FFT - POW 2 - 1D"
echo "================"
echo ""

N_COILS=1

for PROG in ${PROGRAMS[@]}
do
  echo "===================================="
  echo "===================================="
  echo "===================================="
  echo $PROG 
  echo "===="
  for N in ${POWERS2_1D[@]}
  do
    echo "===================================="
    echo "===================================="
    for ((I_RUN=0; I_RUN<${N_RUNS}; I_RUN++))
    do
	echo "===================================="
	$PROG $N 1 1 $N_COILS
    done
  done	
done


echo "FFT - PROD INT - 1D"
echo "==================="
echo ""

N_COILS=1

for PROG in ${PROGRAMS[@]}
do
  echo "===================================="
  echo "===================================="
  echo "===================================="
  echo $PROG 
  echo "===="
  for N in ${PRODUCT_INTEGERS_1D[@]}
  do
    echo "===================================="
    echo "===================================="
    for ((I_RUN=0; I_RUN<${N_RUNS}; I_RUN++))
    do
	echo "===================================="
	$PROG $N 1 1 $N_COILS
    done
  done	
done


echo "FFT - PROD INT - 1D"
echo "==================="
echo ""

N_COILS=1

for PROG in ${PROGRAMS[@]}
do
  echo "===================================="
  echo "===================================="
  echo "===================================="
  echo $PROG 
  echo "===="
  for N in ${PRIMES_1D[@]}
  do
    echo "===================================="
    echo "===================================="
    for ((I_RUN=0; I_RUN<${N_RUNS}; I_RUN++))
    do
	echo "===================================="
	$PROG $N 1 1 $N_COILS
    done
  done	
done



echo "FFT - POW 2 - 2D"
echo "================"
echo ""

N_COILS=1

for PROG in ${PROGRAMS[@]}
do
  echo "===================================="
  echo "===================================="
  echo "===================================="
  echo $PROG 
  echo "===="
  for N in ${POWERS2_2D[@]}
  do
    echo "===================================="
    echo "===================================="
    for ((I_RUN=0; I_RUN<${N_RUNS}; I_RUN++))
    do
	echo "===================================="
	$PROG $N $N 1 $N_COILS
    done
  done	
done


echo "FFT - PROD INT - 2D"
echo "==================="
echo ""

N_COILS=1

for PROG in ${PROGRAMS[@]}
do
  echo "===================================="
  echo "===================================="
  echo "===================================="
  echo $PROG 
  echo "===="
  for N in ${PRODUCT_INTEGERS_2D[@]}
  do
    echo "===================================="
    echo "===================================="
    for ((I_RUN=0; I_RUN<${N_RUNS}; I_RUN++))
    do
	echo "===================================="
	$PROG $N $N 1 $N_COILS
    done
  done	
done


echo "FFT - PRIMES 2D"
echo "==================="
echo ""

N_COILS=1

for PROG in ${PROGRAMS[@]}
do
  echo "===================================="
  echo "===================================="
  echo "===================================="
  echo $PROG 
  echo "===="
  for N in ${PRIMES_2D[@]}
  do
    echo "===================================="
    echo "===================================="
    for ((I_RUN=0; I_RUN<${N_RUNS}; I_RUN++))
    do
	echo "===================================="
	$PROG $N $N 1 $N_COILS
    done
  done	
done



echo "FFT - POW 2 - 3D"
echo "================"
echo ""

N_COILS=1

for PROG in ${PROGRAMS[@]}
do
  echo "===================================="
  echo "===================================="
  echo "===================================="
  echo $PROG 
  echo "===="
  for N in ${POWERS2_3D[@]}
  do
    echo "===================================="
    echo "===================================="
    for ((I_RUN=0; I_RUN<${N_RUNS}; I_RUN++))
    do
	echo "===================================="
	$PROG $N $N $N $N_COILS
    done
  done	
done


echo "FFT - PROD INT - 3D"
echo "==================="
echo ""

N_COILS=1

for PROG in ${PROGRAMS[@]}
do
  echo "===================================="
  echo "===================================="
  echo "===================================="
  echo $PROG 
  echo "===="
  for N in ${PRODUCT_INTEGERS_3D[@]}
  do
    echo "===================================="
    echo "===================================="
    for ((I_RUN=0; I_RUN<${N_RUNS}; I_RUN++))
    do
	echo "===================================="
	$PROG $N $N $N $N_COILS
    done
  done	
done


echo "FFT - PRIMES 3D"
echo "==============="
echo ""

N_COILS=1

for PROG in ${PROGRAMS[@]}
do
  echo "===================================="
  echo "===================================="
  echo "===================================="
  echo $PROG 
  echo "===="
  for N in ${PRIMES_3D[@]}
  do
    echo "===================================="
    echo "===================================="
    for ((I_RUN=0; I_RUN<${N_RUNS}; I_RUN++))
    do
	echo "===================================="
	$PROG $N $N $N $N_COILS
    done
  done	
done


echo "CCP PETMR"
echo "========="
echo ""
CCPPETMR=(252 256 257)
N_COILS=32
for PROG in ${PROGRAMS[@]}
do
  echo "===================================="
  echo "===================================="
  echo "===================================="
  echo $PROG 
  echo "===="
  for N in ${CCPPETMR[@]}
  do
    echo "===================================="
    echo "===================================="
    for ((I_RUN=0; I_RUN<${N_RUNS}; I_RUN++))
    do
	echo "===================================="
	$PROG $N $N 1 $N_COILS
    done
  done	
done



echo "FLATNESS"
echo "========"
echo ""
N_COILS=1

NX=512 
NY=512
NZ=512
for PROG in ${PROGRAMS[@]}
do
   echo "================" 
   for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
   do
     echo "----------------"
     aprun -n 1 -N 1 -d 24 $PROG $NX $NY $NZ $N_COILS
   done
done

NX=256
NY=256
NZ=2048
for PROG in ${PROGRAMS[@]}
do
  echo "================"  
  for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
  do
    echo "----------------" 
    aprun -n 1 -N 1 -d 24 $PROG $NX $NY $NZ $N_COILS
  done
done

NX=128
NY=128
NZ=8192
for PROG in ${PROGRAMS[@]}
do
  echo "================"
  for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
  do
    echo "----------------"
    aprun -n 1 -N 1 -d 24 $PROG $NX $NY $NZ $N_COILS 
  done
done

NX=64
NY=64
NZ=32768
for PROG in ${PROGRAMS[@]}
do
  echo "================" 
  for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
  do
    echo "----------------"
    aprun -n 1 -N 1 -d 24 $PROG $NX $NY $NZ $N_COILS 
  done
done

NX=32
NY=32
NZ=131072
for PROG in ${PROGRAMS[@]}
do
  echo "================"  
  for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
  do
    echo "----------------" 
    aprun -n 1 -N 1 -d 24 $PROG $NX $NY $NZ $N_COILS 
  done
done

NX=16
NY=16
NZ=524288
for PROG in ${PROGRAMS[@]}
do
  echo "================"  
  for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
  do
    echo "----------------"
    aprun -n 1 -N 1 -d 24 $PROG $NX $NY $NZ $N_COILS 
  done
done

NX=8
NY=8
NZ=2097152
for PROG in ${PROGRAMS[@]}
do
  echo "================" >> $FILE 
  for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
  do
    echo "----------------"
    aprun -n 1 -N 1 -d 24 $PROG $NX $NY $NZ $N_COILS 
  done
done

NX=4
NY=4
NZ=8388608
for PROG in ${PROGRAMS[@]}
do
  echo "================"  
  for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
  do
    echo "----------------" 
    aprun -n 1 -N 1 -d 24 $PROG $NX $NY $NZ $N_COILS 
  done
done

NX=2
NY=2
NZ=33554432
for PROG in ${PROGRAMS[@]}
do
  echo "================"  
  for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
  do
    echo "----------------"
    aprun -n 1 -N 1 -d 24 $PROG $NX $NY $NZ $N_COILS 
  done
done

NX=1
NY=1
NZ=134217728
for PROG in ${PROGRAMS[@]}
do
  echo "================" 
  for ((I_RUN=0; I_RUN<$N_RUNS; I_RUN++))
  do
    echo "----------------"
    aprun -n 1 -N 1 -d 24 $PROG $NX $NY $NZ $N_COILS 
  done
done
