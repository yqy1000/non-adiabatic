#!/bin/bash -l
# Standard output and error:
#SBATCH -o ./tjob.out.%j
#SBATCH -e ./tjob.err.%j
# Initial working directory:
#SBATCH -D ./
# Job Name:
#SBATCH -J band
# Number of nodes and MPI tasks per node:
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#
#SBATCH --mem=20GB
#
# Wall clock limit:
#SBATCH --time=00:30:00
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

#srun pw.x -npools 72 -i nbn.band.in > nbn.band.out
srun bands.x -i nbn.bands.in > nbn.bands.out
#srun projwfc.x < nbn_projwfc.in > ngb2_projwfc.out
