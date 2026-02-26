#!/bin/bash

#SBATCH --job-name=trainCPN
#SBATCH --partition=h200x8
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=8
#SBATCH --mem=64G
#SBATCH --time=24:00:00
#SBATCH --output=mdlm_%j.GPU.log

eval "$(conda shell.bash hook)"
conda activate torch_cuda12
module load cuda/12.1.1
fragfile=../tsinghua_scatac/K562/Liscovitch-Brauer2021/Pierce2021-K562_cells-R1.t
hg38fa=../../../ref/Homo_sapiens.GRCh38.dna.primary_assembly.fa
hg38chromsizes=../../../ref/GRCh38_EBV.chrom.sizes.tsv
path2peaksbed=
path2nonpeaksbed=
fold0json=
output_dir=

chrombpnet bias pipeline \
  -ifrag /path/to/input.tsv \ # only one of ibam, ifrag or itag is accepted
  -d "ATAC" \
  -g $hg38fa \
  -c $hg38chromsizes \
  -p $path2peaksbed \
  -n $path2nonpeaksbed \
  -fl $fold_0json \
  -b 0.5 \
  -o $output_dir
