#!/bin/bash -l  
#SBATCH --time=04:00:00
#SBATCH --nodes=1
#SBATCH --job-name=quiox
#SBATCH --ntasks-per-core=1
#SBATCH --ntasks-per-node=16
#SBATCH --cpus-per-task=2
#SBATCH --output=batch.out
#SBATCH --error=batch.err
#SBATCH --partition=cluster
#SBATCH --mem=32G

tmpdir=`pwd`
mkdir "$tmpdir.$SLURM_JOB_ID"
export TMPDIR="$tmpdir.$SLURM_JOB_ID"

######SBATCH --export=NONE
module load turbomole/7.5

dscf > scf.out
escf > trip.out
jobinfo
