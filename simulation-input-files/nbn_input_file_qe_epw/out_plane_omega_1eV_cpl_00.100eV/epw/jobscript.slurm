#!/bin/bash -l
# Standard output and error:
#SBATCH -o ./tjob.out.%j
#SBATCH -e ./tjob.err.%j
# Initial working directory:
#SBATCH -D ./
# Job Name:
#SBATCH -J epw-pristine
# Number of nodes and MPI tasks per node:
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=72
#SBATCH --cpus-per-task=1
#
##SBATCH --mem=220GB
#
# Wall clock limit:
#SBATCH --time=01:00:00
#
# For pinning threads correctly:
export OMP_PLACES=cores
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

module purge
module load gcc/10 openmpi/4 mkl/2021.4

qedir="/u/itlu/software/qe-github-forked-local"
export PATH="${qedir}/bin:${PATH}"

#srun pw.x -npools 12 -i nscf.in > nscf.out
#srun epw.x -npools 72 -i epw1.in > epw1.out

srun epw.x -npools 72 -i epw2.in > epw2.out

#srun epw.x -npools 72 -i epw3.in > epw3.out
