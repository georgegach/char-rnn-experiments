#!/bin/sh
#SBATCH -N 1      # nodes requested
#SBATCH -n 1      # tasks requested
#SBATCH -c 2      # cores requested
#SBATCH --gres=gpu:2 	# gpus
#SBATCH --mem=10G  # memory in Mb
#SBATCH -o logs/outfile  # send stdout to outfile
#SBATCH -e logs/errfile  # send stderr to errfile
#SBATCH -t 1:00:00  # time requested in hour:minute:second

#module load python/gcc-4.8.5/3.6.0
#module load tensorflow/1.2.1
python train.py --data_file=data/names-poets.txt --output_dir=georgian_poets --num_epochs=3000
python sample.py --init_dir=georgian_poets --start_text="" --length=10000 > poets-3000.txt
