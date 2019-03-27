#!/bin/bash

export OMP_PROC_BIND=spread

#PROG=/home/pgambron/GPU/cuda/test
#PROG=/home/pgambron/GPU/kokkos/test
#PROG=/home/pgambron/GPU/opencl/test
#PROG=/home/pgambron/GPU/openacc/test
PROG=/home/pgambron/GPU/openmp/test

echo "===================================="
echo $PROG
echo

# CCP PET/MR
# N ~ 256, N_COILS ~ 32

# power of 2
$PROG 256 256 256 32 

# product of small primes 2*3*5*7=210
$PROG 210 210 210 32 

# prime numbers 257 
$PROG 257 257 257 32 



# Regular tests
# powers of 2
# square
$PROG 128 128 128 1 
$PROG 256 256 256 1 
$PROG 512 512 512 1   

#flattened
# ratio 16
$PROG 32768 8 8 1 
$PROG 65536 16 16 1 
$PROG 131072 32 32 1   


#product of small integers
#2^i*3^j*5^k*7*l
#1 1 1 1   210
#2 1 1 1   420
#2 2 1 1   1260
#2 1 2 1   2100
#1 2 1 2   4410
#2 2 1 2   8820
#1 2 3 1   15750
#2 2 3 1   31500

#square
$PROG 210 210 210 1 
$PROG 420 420 420 1 

#flattened
#ratio 2*5=14
$PROG 41160 15 15 1 
$PROG 82320 30 30 1 


# primes
# 11 13 127 257 509 1021 2053 4093 8191 16381 32771
# square
$PROG 127 127 127 1 
$PROG 257 257 257 1 
$PROG 509 509 509 1   

# flattened
$PROG 32771 7 7 1 
$PROG 65537 17 17 1 
$PROG 131071 31 31 1 
