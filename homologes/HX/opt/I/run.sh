#!/bin/bash -l  
#SBATCH --time=24:00:00
#SBATCH --nodes=2
#SBATCH --job-name=HI_opt
#SBATCH --ntasks-per-core=2
#SBATCH --ntasks-per-node=16
#SBATCH --cpus-per-task=2
#SBATCH --output=ba.out
#SBATCH --error=ba.err
#SBATCH --partition=base
#SBATCH --mem=160G
#####SBATCH --mem=184G
######SBATCH --hint=nomultithread

tmpdir=`pwd`
mkdir "$tmpdir.$SLURM_JOB_ID"
export TMPDIR="$tmpdir.$SLURM_JOB_ID"

######SBATCH --export=NONE
module load oneapi2023-env/2023.2.0
module load oneapi oneapi-mpi oneapi-mkl libint libxc gsl fftw
#module load cp2k

source /gxfs_home/cau/suphc355/software/cp2k/tools/toolchain/install/setup

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
#ulimit -s unlimited
#export CRAY_CUDA_MPS=1
#
##/gxfs_home/cau/suphc355/software/cp2k/exe/local/cp2k.sopt -i cp2k.inp -o osc.out
mpirun -np 64 /gxfs_home/cau/suphc355/software/cp2k/exe/local/cp2k.psmp -i opt.inp -o opt.out
jobinfo
