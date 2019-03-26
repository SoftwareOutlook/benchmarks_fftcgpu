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
#PBS -l walltime=1:0:0

# Switch to current working directory
cd $PBS_O_WORKDIR

#aprun -n 1 -N 1 -d 24  prog N_X N_Y N_Z N_COILS


PROG=${DATA}/FFTC/test

NAME=results/results-Nx${N_X}-Ny${N_Y}-Nz${N_Z}-Nc${N_COILS}

export OMP_NUM_THREADS=1
aprun -n 1 -N 1 -d 24  $PROG $N_X $N_Y $N_Z $N_COILS > ${NAME}-t${OMP_NUM_THREADS}.txt 

export OMP_NUM_THREADS=2
aprun -n 1 -N 1 -d 24  $PROG $N_X $N_Y $N_Z $N_COILS > ${NAME}-t${OMP_NUM_THREADS}.txt 

export OMP_NUM_THREADS=4
aprun -n 1 -N 1 -d 24  $PROG $N_X $N_Y $N_Z $N_COILS > ${NAME}-t${OMP_NUM_THREADS}.txt 

export OMP_NUM_THREADS=8
aprun -n 1 -N 1 -d 24  $PROG $N_X $N_Y $N_Z $N_COILS > ${NAME}-t${OMP_NUM_THREADS}.txt 

export OMP_NUM_THREADS=16
aprun -n 1 -N 1 -d 24  $PROG $N_X $N_Y $N_Z $N_COILS > ${NAME}-t${OMP_NUM_THREADS}.txt 

export OMP_NUM_THREADS=24
aprun -n 1 -N 1 -d 24  $PROG $N_X $N_Y $N_Z $N_COILS > ${NAME}-t${OMP_NUM_THREADS}.txt 
