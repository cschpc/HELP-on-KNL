#!/bin/bash
export MKL_FAST_MEMORY_LIMIT=0
export I_MPI_SHM_LMT=direct
#export KMP_STACKSIZE=536870912
#ulimit -s unlimited
for j in 1 2 #4
do
  export KMP_HW_SUBSET=${j}T
  #echo $KMP_HW_SUBSET
  #for omp in 1 2 4 8 16 32 64
  #do
     #export OMP_NUM_THREADS=$omp
     #mpi=$(expr $j \* 64 / $omp)
     mpi=$(expr $j \* 64)
     #echo $mpi
     for pin in "compact" "scatter" "spread" "bunch"
     do
       #echo $pin
       export I_MPI_PIN_ORDER=$pin
       outfile=su3_${mpi}_${j}T_${pin}.out.3
       rm $outfile
       mpirun -np $mpi ./su3_clov &> $outfile
     done
  done
done



