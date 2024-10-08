#!/bin/bash
#SBATCH --job-name=thiophen
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=16
#SBATCH --cpus-per-task=2
#SBATCH --mem=250GB
#SBATCH --time=01:00:00
#SBATCH --output=batch.out
#SBATCH --error=batch.err
#SBATCH --partition=base

module load intel2021-env/2021.6.0
module load intel/2021.6.0 intel-mpi/2021.6.0 libint/2.6.0 

source ~/software/cp2k/tools/toolchain/install/setup

mpirun -np 128 ~/software/cp2k/exe/local/cp2k.psmp -i les.inp -o les.out
jobinfo
