#!/bin/bash -l  
#SBATCH --time=24:00:00
#SBATCH --nodes=16
#SBATCH --job-name=I2
#SBATCH --ntasks-per-core=2
#SBATCH --ntasks-per-node=16
#SBATCH --cpus-per-task=1
#SBATCH --output=ba.out
#SBATCH --error=ba.err
#SBATCH --partition=base
#SBATCH --mem=250G
#####SBATCH --mem=184G
######SBATCH --hint=nomultithread

tmpdir=`pwd`
mkdir "$tmpdir.$SLURM_JOB_ID"
export TMPDIR="$tmpdir.$SLURM_JOB_ID"

######SBATCH --export=NONE
module load oneapi2023-env/2023.2.0
module load oneapi oneapi-mpi oneapi-mkl libint libxc gsl fftw

source /gxfs_home/cau/suphc355/software/cp2k_versions/cp2k/tools/toolchain/install/setup

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
#ulimit -s unlimited
#export CRAY_CUDA_MPS=1
#
mpirun -np 512 /gxfs_home/cau/suphc355/software/cp2k_versions/cp2k/exe/local/cp2k.psmp -i AE.inp -o AE_test.out
jobinfo
