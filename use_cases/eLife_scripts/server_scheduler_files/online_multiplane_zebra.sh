#!/bin/bash
# Run 21 tasks, with ids 0..20. Have seven on a node 
# The stdout (-o) and stderr (-e) files will be written to the submission directory with
# names that follow the given templates (in this case, the names will include the
# SLURM job identifier).
#SBATCH -p bnl -N23 --ntasks-per-node=2 --exclusive -o sbExample.%j.out -e sbExample.%j.err

# srun starts a process per task, 21 in this case. In the first example, we didn't explicitly set
# a number of tasks, so srun assumed there would be one per node.
srun bash -c 'KERAS_BACKEND=tensorflow CUDA_VISIBLE_DEVICES=-1 MKL_NUM_THREADS=14 OPENBLAS_NUM_THREADS=14 /mnt/home/agiovann/anaconda3/envs/caiman/bin/python /mnt/home/agiovann/SOFTWARE/CaImAn/use_cases/eLife_scripts/preprocessing_files/preprocess_zebrafish_paper.py $SLURM_PROCID'
