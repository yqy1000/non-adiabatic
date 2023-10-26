#!/bin/bash -l
# Standard output and error:
#SBATCH -o ./tjob.out.%j
#SBATCH -e ./tjob.err.%j
# Initial working directory:
#SBATCH -D ./
# Job Name:
#SBATCH -J nbn
# Number of nodes and MPI tasks per node:
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=72
#SBATCH --cpus-per-task=1
#
#SBATCH --mem=120GB
#
# Wall clock limit:
#SBATCH --time=01:50:00
#
# For pinning threads correctly:
export OMP_PLACES=cores
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

module purge
module load intel/21.6.0 impi/2021.6 mkl/2022.1
module load elpa/mpi/standard/2022.05.001
export LIBDIRS="${MKL_HOME}/lib/intel64"

qedir="/u/itlu/software/qe-github-forked"
export PATH="${qedir}/bin:${PATH}"

srun pw.x -npools 72 -i scf.in > scf.out
#srun ph.x -npools 12 -i ph.in > ph.out
#srun q2r.x -i q2r.in > q2r.out
#srun matdyn.x -inp matdyn.in > matdyn.out
