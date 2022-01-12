#!/bin/bash
#SBATCH --job-name cas9_npt
#SBATCH -N1 --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --time=10:00:00
#SBATCH --gres=gpu:1
#SBATCH --error=stack.err
#SBATCH --output=stack.txt

module load gromacs/2020.4
export OMP_NUM_THREADS=16

gmx mdrun -s npt_fix2.tpr -v -ntmpi 1 -deffnm cas9_npt2 
