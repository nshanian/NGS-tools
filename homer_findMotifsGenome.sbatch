#!/bin/sh
#SBATCH --job-name=HOMER
#SBATCH --time=2-00:00:00
#################
#number of nodes you are requesting, the more you ask for the longer you wait
#SBATCH -c 2
#SBATCH --account=user_name
#SBATCH --mem=60G


#### HOMER (Hypergeometric Optimization of Motif EnRichment) is a suite of tools for Motif Discovery and next-gen sequencing analysis.  
#### It is a collection of command line programs for UNIX-style operating systems written in Perl and C++. 
#### HOMER was primarily written as a de novo motif discovery algorithm and is well suited for finding 8-20 bp motifs in large scale genomics data.  
#### HOMER contains many useful tools for analyzing ChIP-Seq, GRO-Seq, RNA-Seq, DNase-Seq, Hi-C and numerous other types of functional genomics sequencing data sets.


# Finding Enriched Motifs in Genomic Regions (findMotifsGenome.pl)
# HOMER was initially developed to automate the process of finding enriched motifs in ChIP-Seq peaks.  
# More generally, HOMER analyzes genomic positions, not limited to only ChIP-Seq peaks, for enriched motifs.  
# The main idea is that all the user really needs is a file containing genomic coordinates (i.e. a HOMER peak file or  BED file), and HOMER will generally take care of the rest.  
# To analyze a peak file for motifs, run the following command:

# findMotifsGenome.pl <peak/BED file> <genome> <output directory> -size # [options]

# i.e. findMotifsGenome.pl ERpeaks.txt hg18 ER_MotifOutput/ -size 200 -mask

# Acceptable Input files

# findMotifsGenome.pl accepts HOMER peak files or BED files:

# HOMER peak files should have at minimum 5 columns (separated by TABs, additional columns will be ignored):
# Column1: Unique Peak ID
# Column2: chromosome
# Column3: starting position
# Column4: ending position
# Column5: Strand (+/- or 0/1, where 0="+", 1="-")

# BED files should have at minimum 6 columns (separated by TABs, additional columns will be ignored)
# Column1: chromosome
# Column2: starting position
# Column3: ending position
# Column4: Unique Peak ID
# Column5: not used
# Column6: Strand (+/- or 0/1, where 0="+", 1="-")


# Set the working directory for this jobs at the current directory the script has been submitted from

# using H3K18ac ChIP peaks as background


########## BEGIN ACTUAL COMMANDS


#Required modules
module load homer/4.9


#Begin commands
findMotifsGenome.pl H4K12bu_but1.anno.bed hg38 /<path_to_working_directory>/H4K12bu/homer/motif3/but1 -bg H4K12ac_cnt1.anno.bed -size given -mask -preparsedDir /<path_to_working_directory>/H4K12bu/homer/motif3/but1

findMotifsGenome.pl H4K12bu_but2.anno.bed hg38 /<path_to_working_directory>/H4K12bu/homer/motif3/but2 -bg H4K12ac_cnt2.anno.bed -size given -mask -preparsedDir /<path_to_working_directory>/H4K12bu/homer/motif3/but2


# using but input peaks as background

module load homer/4.9


findMotifsGenome.pl H3K18bu_but1.anno.bed hg38 /<path_to_working_directory>/H3K18bu/homer/motif2/but1 -bg but.input.anno.bed -size given -mask -preparsedDir /<path_to_working_directory>/H3K18bu/homer/motif2/but1

findMotifsGenome.pl H3K18bu_but2.anno.bed hg38 /<path_to_working_directory>/H3K18bu/homer/motif2/but2 -bg but.input.anno.bed -size given -mask -preparsedDir /<path_to_working_directory>/H3K18bu/homer/motif2/but2

findMotifsGenome.pl H4K12bu_but1.anno.bed hg38 /<path_to_working_directory>/H4K12bu/homer/motif2/but1 -bg but.input.anno.bed -size given -mask -preparsedDir /<path_to_working_directory>/H4K12bu/homer/motif2/but1

findMotifsGenome.pl H4K12bu_but2.anno.bed hg38 /<path_to_working_directory>/H4K12bu/homer/motif2/but2 -bg but.input.anno.bed -size given -mask -preparsedDir /<path_to_working_directory>/H4K12bu/homer/motif2/but2



# using positive vs negative DiffBind fold change (H3K18bu vs H3K18ac, H4K12bu vs H4K12ac)

module load homer/4.9

findMotifsGenome.pl H3K18pr.anno.pFC.bed hg38 /<path_to_working_directory>/H3K18pr/homer/motif5 -bg H3K18pr.anno.nFC.bed -size given -mask -preparsedDir /<path_to_working_directory>/H3K18pr/homer/motif5

findMotifsGenome.pl H4K12pr.anno.pFC.bed hg38 /<path_to_working_directory>/H4K12pr/homer/motif5 -bg H4K12pr.anno.nFC.bed -size given -mask -preparsedDir /<path_to_working_directory>/H4K12pr/homer/motif5



