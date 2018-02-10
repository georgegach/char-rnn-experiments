#!/bin/sh
#SBATCH -N 1      # nodes requested
#SBATCH -n 1      # tasks requested
#SBATCH -c 16
#SBATCH --mem=10G  # memory in Mb
#SBATCH -o ../logs/outfile-afor  # send stdout to outfile
#SBATCH -e ../logs/errfile-afor  # send stderr to errfile
#SBATCH -t 8:00:00  # time requested in hour:minute:second

#module load python/gcc-4.8.5/3.6.0
#module load tensorflow/1.2.1
python train.py --data_file=../data/aforizmebi.txt --output_dir=../models/aforizmebi --num_epochs=500
python sample.py --init_dir=../models/aforizmebi --start_text="" --length=50000 > ../results/afor-500.txt
