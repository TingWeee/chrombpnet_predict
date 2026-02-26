#!/bin/bash
#SBATCH --job-name=cBPnet_peaks
#SBATCH --partition=gpu4w
#SBATCH --gres=gpu:1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=64G
#SBATCH --time=3:00:00
#SBATCH --output=%x_%j.log


fragfile=Liscovitch-Brauer2021-K562_cells-Screen1.tsv.gz
~/.local/bin/macs2 callpeak -t $fragfile -g hs -f BED --nomodel --extsize 200 --shift -100 -n macs2 --outdir testpeaks
