#!/bin/sh
#SBATCH -N 1      # nodes requested
#SBATCH -n 1      # tasks requested
#SBATCH -c 4
#SBATCH --mem=10G  # memory in Mb
#SBATCH -o logs/outfile-vefx  # send stdout to outfile
#SBATCH -e logs/errfile-vefx  # send stderr to errfile
#SBATCH -t 8:00:00  # time requested in hour:minute:second

#module load python/gcc-4.8.5/3.6.0
#module load tensorflow/1.2.1
python train.py --data_file=data/vefxistyaosani.txt --output_dir=vefxistyaosani --num_epochs=1500
python sample.py --init_dir=vefxistyaosani --start_text="" --length=50000 > results/vefx-1500.txt
