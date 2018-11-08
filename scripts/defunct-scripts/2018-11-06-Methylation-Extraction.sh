#!/bin/bash
## Job Name
#SBATCH --job-name=dedup-yaamini
## Allocation Definition
#SBATCH --account=srlab
#SBATCH --partition=srlab
## Resources
## Nodes
#SBATCH --nodes=1
## Walltime (days-hours:minutes:seconds format)
#SBATCH --time=30-00:00:00
## Memory per node
#SBATCH --mem=120G
##turn on e-mail notification
#SBATCH --mail-type=ALL
#SBATCH --mail-user=yaaminiv@uw.edu
## Specify the working directory for this job
#SBATCH --workdir=/gscratch/scrubbed/yaamini/analyses/Virginica-MBD/2018-10-31-Virginica-Bismark-Revised-Parameters-Samtools

#Add Directories and Programs to Path

bismark_dir="/gscratch/srlab/programs/Bismark-0.19.0"
bowtie2_dir="/gscratch/srlab/programs/bowtie2-2.3.4.1-linux-x86_64/"
trimmed_files="/gscratch/scrubbed/yaamini/data/Virginica-MBD/2018-10-17-Trimmed-Files"
genome="/gscratch/scrubbed/yaamini/data/Virginica-MBD/2018-04-27-Bismark-Inputs/"
samtools_dir="/gscratch/srlab/programs/samtools-1.9/"

#Genome preparation
#YRV prepared the bisulfite genome on hummingbird: https://github.com/RobertsLab/project-virginica-oa/blob/master/notebooks/2018-04-27-Gonad-Methylation-Bismark.ipynb

#Alignment, Deduplication, Sorting, and Indexing
#Finished 2018-11-06 using a different script

#Methylation Extraction

${bismark_dir}/bismark_methylation_extractor \
--samtools_path ${samtools_dir} \
-p \
--bedGraph \
--counts \
--scaffolds \
--multicore 28 \
*deduplicated.bam

#HTML Processing Report

${bismark_dir}/bismark2report

#Summary Report

${bismark_dir}/bismark2summary
