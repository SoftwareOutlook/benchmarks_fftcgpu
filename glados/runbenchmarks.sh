#!/bin/bash


# CCP PET/MR
# N ~ 256, N_COILS ~ 32

# power of 2
qsub -v N_X=256,N_Y=256,N_Z=256,N_COILS=32 benchmark.sh 

# product of small primes 2*3*5*7=210
qsub -v N_X=210,N_Y=210,N_Z=210,N_COILS=32 benchmark.sh 

# prime numbers 257 
qsub -v N_X=257,N_Y=257,N_Z=257,N_COILS=32 benchmark.sh 



# Regular tests
# powers of 2
# square
qsub -v N_X=128,N_Y=128,N_Z=128,N_COILS=1 benchmark.sh
qsub -v N_X=256,N_Y=256,N_Z=256,N_COILS=1 benchmark.sh
qsub -v N_X=512,N_Y=512,N_Z=512,N_COILS=1 benchmark.sh  

#flattened
# ratio 16
qsub -v N_X=32768,N_Y=8,N_Z=8,N_COILS=1 benchmark.sh
qsub -v N_X=65536,N_Y=16,N_Z=16,N_COILS=1 benchmark.sh
qsub -v N_X=131072,N_Y=32,N_Z=32,N_COILS=1 benchmark.sh  


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
qsub -v N_X=210,N_Y=210,N_Z=210,N_COILS=1 benchmark.sh
qsub -v N_X=420,N_Y=420,N_Z=420,N_COILS=1 benchmark.sh

#flattened
#ratio 2*5=14
qsub -v N_X=41160,N_Y=15,N_Z=15,N_COILS=1 benchmark.sh
qsub -v N_X=82320,N_Y=30,N_Z=30,N_COILS=1 benchmark.sh


# primes
# 11 13 127 257 509 1021 2053 4093 8191 16381 32771
# square
qsub -v N_X=127,N_Y=127,N_Z=127,N_COILS=1 benchmark.sh
qsub -v N_X=257,N_Y=257,N_Z=257,N_COILS=1 benchmark.sh
qsub -v N_X=509,N_Y=509,N_Z=509,N_COILS=1 benchmark.sh  

# flattened
qsub -v N_X=32771,N_Y=7,N_Z=7,N_COILS=1 benchmark.sh
qsub -v N_X=65537,N_Y=17,N_Z=17,N_COILS=1 benchmark.sh
qsub -v N_X=131071,N_Y=31,N_Z=31,N_COILS=1 benchmark.sh