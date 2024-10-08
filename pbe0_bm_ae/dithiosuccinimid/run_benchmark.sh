#!/bin/bash
#SBATCH --job-name=Disucc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=32GB
#SBATCH --time=24:00:00
#SBATCH --output=batch.out
#SBATCH --error=batch.err
#SBATCH --partition=base

module load intel2021-env/2021.6.0
module load intel/2021.6.0 intel-mpi/2021.6.0 libint/2.6.0 

source ~/software/cp2k/tools/toolchain/install/setup

~/software/cp2k/exe/local/cp2k.ssmp -i cp2k.inp -o cp2k.out
jobinfo
