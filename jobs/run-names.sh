#!/bin/sh
#SBATCH -N 1      # nodes requested
#SBATCH -n 1      # tasks requested
#SBATCH -c 4
#SBATCH --mem=10G  # memory in Mb
#SBATCH -o logs/outfile-names  # send stdout to outfile
#SBATCH -e logs/errfile-names  # send stderr to errfile
#SBATCH -t 1:00:00  # time requested in hour:minute:second

#module load python/gcc-4.8.5/3.6.0
#module load tensorflow/1.2.1
python train.py --data_file=data/names-first.txt --output_dir=georgian_names --num_epochs=10000
python sample.py --init_dir=georgian_names --start_text="" --length=10000 > results/names-10000.txt
