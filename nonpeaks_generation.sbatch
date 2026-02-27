#!/bin/bash
#SBATCH --job-name=cBPnonpeaks
#SBATCH --partition=gpu4w
#SBATCH --gres=gpu:1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=64G
#SBATCH --time=5:00:00
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err


eval "$(conda shell.bash hook)" 

conda activate /home/users/astar/gis/limtw/scratch/ls/envs/chrombpnet 
module load cuda/12.1.1 
module load samtools
module load bedtools2

peakfile=../tsinghua_scatac/K562/Liscovitch-Brauer2021/testpeaks/filtered_peaks.narrowPeak
GENOME=../test_data/hg38.fa
OUTPUT_PREFIX=k562_test_nonpeaks
CHROM_SIZES=../test_data/hg38.chrom.sizes
CHR_FOLD_PATH=../test_data/fold_0.json
BLACKLIST_REGIONS=/home/users/astar/gis/limtw/scratch/proj_TF/motif/GRCh38_unified_blacklist/ENCFF356LFX.bed

chrombpnet prep nonpeaks -g $GENOME -o $OUTPUT_PREFIX -p $peakfile -c $CHROM_SIZES -fl $CHR_FOLD_PATH -br $BLACKLIST_REGIONS
