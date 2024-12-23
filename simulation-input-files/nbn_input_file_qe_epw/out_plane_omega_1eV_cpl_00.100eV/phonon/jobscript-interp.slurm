#!/bin/bash -l
# Standard output and error:
#SBATCH -o ./tjob.out.%j
#SBATCH -e ./tjob.err.%j
# Initial working directory:
#SBATCH -D ./
# Job Name:
#SBATCH -J nbn-phonon
# Number of nodes and MPI tasks per node:
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#
#SBATCH --mem=40GB
#
# Wall clock limit:
#SBATCH --time=00:30:00
#
# For pinning threads correctly:
export OMP_PLACES=cores
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

module purge
module load gcc/10 openmpi/4 mkl/2021.4

qedir="/u/itlu/software/qe-github-forked-local"
export PATH="${qedir}/bin:${PATH}"

#srun pw.x -npools 72 -i scf.in > scf.out
#srun ph.x -npools 12 -i ph.in > ph.out
srun q2r.x -i q2r.in > q2r.out
srun matdyn.x -inp matdyn.in > matdyn.out
