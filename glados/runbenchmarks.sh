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


# 3D

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
$PROG 32 32 32 1 
$PROG 64 64 64 1 
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
$PROG 30 30 30 1
$PROG 70 70 70 1
$PROG 105 105 105 1
$PROG 210 210 210 1 
$PROG 420 420 420 1 

#flattened
#ratio 2*5=14
$PROG 41160 15 15 1 
$PROG 82320 30 30 1 


# primes
# 11 13 127 257 509 1021 2053 4093 8191 16381 32771
# square

$PROG 31 31 31 1
$PROG 61 61 61 1
$PROG 127 127 127 1 
$PROG 257 257 257 1 
$PROG 509 509 509 1   

# flattened
$PROG 32771 7 7 1 
$PROG 65537 17 17 1 
$PROG 131071 31 31 1 



# 2D

# CCP PET/MR
# N ~ 256, N_COILS ~ 32

# power of 2
$PROG 256 256 1 32  

# product of small primes 2*3*5*7=210
$PROG 210 210 1 32  

# prime numbers 257 
$PROG 257 257 1 32  



# Regular tests
# powers of 2
# square
$PROG 128 128 1 1 
$PROG 256 256 1 1 
$PROG 512 512 1 1   
$PROG 1024 1024 1   
$PROG 2048 2048 1 1  
$PROG 4096 4096 1 1  
$PROG 8192 8192 1 1  


#flattened
# ratio 64*64=4096
$PROG 32768 8 1 1 
$PROG 65536 16 1 1 
$PROG 131072 32 1 1  
$PROG 262144 64 1 1  
$PROG 524288 128 1 1  

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
$PROG 210 210 1 1 
$PROG 420 420 1 1 
$PROG 1260 1260 1 1 
$PROG 4410 4410 1 1 
$PROG 8820 8820 1 1 

#flattened
#ratio 3*5*5*7*7=3675
$PROG 55125 15 1 1 
$PROG 110250 30 1 1 
$PROG 220500 60 1 1 
$PROG 441000 120 1 1 


# primes
# 11 13 127 257 509 1021 2053 4093 8191 16381 32771
# square
$PROG 127 127 1 1 
$PROG 257 257 1 1 
$PROG 509 509 1 1 
$PROG 1021 1021 1 1 
$PROG 2053 2053 1 1 
$PROG 4093 4093 1 1 
$PROG 8191 8191 1 1 


# flattened
$PROG 65563 17 1 1 
$PROG 131071 31 1 1 
$PROG 262147 61 1 1 
$PROG 524287 127 1 1 








# 1D

# CCP PET/MR
# N ~ 256, N_COILS ~ 32

# power of 2
$PROG 256 1 1 32  

# product of small primes 2*3*5*7=210
$PROG 210 1 1 32  

# prime numbers 257 
$PROG 257 1 1 32  



# Regular tests
# powers of 2
# square
$PROG 256 1 1 1 
$PROG 1024 1 1 1   
$PROG 4096 1 1 1   
$PROG 16384 1 1 1   
$PROG 65536 1 1 1   
$PROG 262144 1 1 1   
$PROG 1048576 1 1 1  
$PROG 4194304 1 1 1  
$PROG 16777216 1 1 1  
$PROG 67108864 1 1 1  


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


$PROG 210 1 1 1 
$PROG 1260 1 1 1 
$PROG 4410 1 1 1 
$PROG 15750 1 1 1 
$PROG 66150 1 1 1 
$PROG 257250 1 1 1 
$PROG 1080450 1 1 1 
$PROG 4321800 1 1 1 
$PROG 15435000 1 1 1 
$PROG 64827000 1 1 1 


#primes
$PROG 257 1 1 1
$PROG 1021 1 1 1 
$PROG 4093 1 1 1 
$PROG 16381 1 1 1 
$PROG 65521 1 1 1 
$PROG 262139 1 1 1 
$PROG 1048573 1 1 1 
$PROG 4194301 1 1 1 
$PROG 16777213 1 1 1 
$PROG 67108859 1 1 1 

