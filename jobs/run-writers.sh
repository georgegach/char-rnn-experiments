#!/bin/sh
#SBATCH -N 1      # nodes requested
#SBATCH -n 1      # tasks requested
#SBATCH -c 4      # cores requested
#SBATCH --mem=10G  # memory in Mb
#SBATCH -o logs/outfile-writers  # send stdout to outfile
#SBATCH -e logs/errfile-writers  # send stderr to errfile
#SBATCH -t 3:00:00  # time requested in hour:minute:second

#module load python/gcc-4.8.5/3.6.0
#module load tensorflow/1.2.1
python train.py --data_file=data/names-writers.txt --output_dir=georgian_writers --num_epochs=10000
python sample.py --init_dir=georgian_writers --start_text="" --length=50000 > writers-10000.txt
