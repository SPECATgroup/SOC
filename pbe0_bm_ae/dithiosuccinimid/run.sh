#!/bin/bash
#SBATCH --job-name=dithiosuccinid
#SBATCH --nodes=8
#SBATCH --ntasks-per-node=8
#SBATCH --cpus-per-task=2
#SBATCH --mem=32GB
#SBATCH --time=04:00:00
#SBATCH --output=batch.out
#SBATCH --error=batch.err
#SBATCH --partition=base

module load intel2021-env/2021.6.0
module load intel/2021.6.0 intel-mpi/2021.6.0 libint/2.6.0 

source ~/software/cp2k_dev/tools/toolchain/install/setup

mpirun -np 64 ~/software/cp2k_dev/exe/local/cp2k.psmp -i les.inp -o les.out
jobinfo
