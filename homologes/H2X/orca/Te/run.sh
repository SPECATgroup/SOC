#!/bin/bash -l  
#SBATCH --time=0:10:00
#SBATCH --nodes=1
#SBATCH --job-name=H2Te_orca
#SBATCH --ntasks-per-core=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --output=ba.out
#SBATCH --error=ba.err
#SBATCH --partition=base
#SBATCH --mem=32G
#####SBATCH --mem=250G
######SBATCH --hint=nomultithread

tmpdir=`pwd`
mkdir "$tmpdir.$SLURM_JOB_ID"
export TMPDIR="$tmpdir.$SLURM_JOB_ID"

######SBATCH --export=NONE
module load gcc12-env/12.3.0
module load openmpi/4.1.5 

#
/gxfs_home/cau/suphc355/software/orca/orca_5_0_4/orca orca.inp > orca.out
jobinfo
