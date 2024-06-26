#!/bin/bash -l
#
# Set the name of the job
#SBATCH --job-name=phantom
#
# Set the maximum memory allowed
#SBATCH --mem=20G
#
# Set the maximum run time
#SBATCH -t 48:00:00
#
#SBATCH --mail-type=ALL
#SBATCH --mail-user=user_email
#
# The number of threads we will require
#SBATCH -n 1
#
# Set output and error log files
#SBATCH -o /<path_to_working_directory>/data/ChIP-seq/phantom/log/out.txt
#SBATCH -e /<path_to_working_directory>/data/ChIP-seq/phantom/log/error.txt
#
# set the account for billing (use PI's sunet ID)
#SBATCH --account=mpsnyder
#
#
#SBATCH --export=ALL



###### type to command line ######
########## for sample in Ctl1 Ctl1 Ctl3 Ctl4 Prop1 Prop2 But1 But2
########## do 
########## sbatch -J phan_${sample} --export=sampleID=${sample},bamdir=/<path_to_working_directory>/data/ChIP-seq/step1/FinalAlign,outdir=/<path_to_working_directory>/data/ChIP-seq/phantom/ phantom.sh
########## done



########## BEGIN ACTUAL COMMANDS

#Required modules
module load java/latest
module load samtools/1.2
module load python/2.7
module load r/2.15.1



#Begin commands
Rscript /<path_to_working_directory>/scripts/phantompeakqualtools/run_spp_nodups.R -c=${bamdir}/${sampleID}_sorted_dedup_filterUnmap_filterChrM_aln.bam -savp -out=${outdir}/${sampleID}_crossCorr.txt -odir=${outdir}
