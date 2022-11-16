#!/bin/bash
#SBATCH -N 1
#SBATCH -p paratera
#SBATCH -n 24
#SBATCH --job-name=Ds_2.76

module load gcc/7.3.0 intel/19.0.3-zyq

echo begin time : `date`
echo current working directory: $PWD
#******run the program*************
ifort -c -O MBSL3.f90
ifort -c -O MBSL4.f90
ifort -c -O charmed_meson_production.f90
ifort charmed_meson_production.f90 -o exe.out

./exe.out > run.$SLURM_JOB_ID.log
echo end time : `date`
