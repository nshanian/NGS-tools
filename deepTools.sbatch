#!/bin/sh
#SBATCH --job-name=deepTools
#SBATCH --time=2-00:00:00
#################
#SBATCH -c 2
#SBATCH --account=user_name
#SBATCH --mem=60G

# Set output and error log files
#SBATCH -o /<path_to_working_directory>/H3K18pr/deepTools/out.txt
#SBATCH -e /<path_to_working_directory>/H3K18pr/deepTools/error.txt


#### deepTools is a suite of Python tools developed for the efficient analysis of high-throughput sequencing data, such as ChIP-seq, RNA-seq or MNase-seq.
## This tool suite is developed by the Bioinformatics Facility at the Max Planck Institute for Immunobiology and Epigenetics, Freiburg.
#### deepTools2: a next generation web server for deep-sequencing data analysis. Nucleic Acids Research (2016): gkw257.
## For a list of deepTools many functions see <https://deeptools.readthedocs.io/en/develop/content/list_of_tools.html>. 

## The following commands will perform <computeMatrix>, <plotProfile> and <plotHeatmap> functions for histone ChIP-data. 

## The required input files: (.bigwig/.bw) signal files and (.bed) peak files. 


module load deeptools/3.1.0


# Run the following commands in chuncks or uisng <sbatch> from the directory containing the .bigwig and .bed files. 

# This will execute <computeMatrix>, <plotHeatmap> and <plotProfile> commands on ChIP replicates 1 and 2


computeMatrix reference-point --referencePoint TSS \
-b 1000 -a 1000 \
-R /<path_to_working_directory>/H3K18pr/deepTools/H3K18pr_prop1.bed \
-S /<path_to_working_directory>/H3K18pr/deepTools/H3K18pr_prop1.bigwig \
--skipZeros \
-o /<path_to_working_directory>/H3K18pr/deepTools/results/matrix_prop1_TSS.gz \
-p 6 \
--outFileSortedRegions /<path_to_working_directory>/H3K18pr/deepTools/results/regions_prop1_TSS.bed 


plotHeatmap -m /<path_to_working_directory>/H3K18pr/deepTools/results/matrix_prop1_TSS.gz \
-out /<path_to_working_directory>/H3K18pr/deepTools/results/figures/prop1_TSS_heatmap.eps \
--colorMap RdBu \
--whatToShow 'heatmap and colorbar' \
--zMin -4 --zMax 4  


plotProfile -m /<path_to_working_directory>/H3K18pr/deepTools/results/matrix_prop1_TSS.gz \
-out /<path_to_working_directory>/H3K18pr/deepTools/results/figures/prop1_TSS_profile.eps \
--color blue \
--refPointLabel "TSS" \
-z "" 


computeMatrix reference-point --referencePoint TSS \
-b 1000 -a 1000 \
-R /<path_to_working_directory>/H3K18pr/deepTools/H3K18pr_prop2.bed \
-S /<path_to_working_directory>/H3K18pr/deepTools/H3K18pr_prop2.bigwig \
--skipZeros \
-o /<path_to_working_directory>/H3K18pr/deepTools/results/matrix_prop2_TSS.gz \
-p 6 \
--outFileSortedRegions /<path_to_working_directory>/H3K18pr/deepTools/results/regions_prop2_TSS.bed 


plotHeatmap -m /<path_to_working_directory>/H3K18pr/deepTools/results/matrix_prop2_TSS.gz \
-out /<path_to_working_directory>/H3K18pr/deepTools/results/figures/prop2_TSS_heatmap.eps \
--colorMap RdBu \
--whatToShow 'heatmap and colorbar' \
--zMin -4 --zMax 4  


plotProfile -m /<path_to_working_directory>/H3K18pr/deepTools/results/matrix_prop2_TSS.gz \
-out /<path_to_working_directory>/H3K18pr/deepTools/results/figures/prop2_TSS_profile.eps \
--color blue \
--refPointLabel "TSS" \
-z "" 

# This will execute <computeMatrix>, <plotHeatmap> and <plotProfile> commands on input replicates 1 and 2

computeMatrix reference-point --referencePoint TSS \
-b 1000 -a 1000 \
-R /<path_to_working_directory>/H3K18pr/deepTools/prop_input2.bed \
-S /<path_to_working_directory>/H3K18pr/deepTools/prop_input2.bigwig \
--skipZeros \
-o /<path_to_working_directory>/H3K18pr/deepTools/results/matrix_prop_input2_TSS.gz \
-p 6 \
--outFileSortedRegions /<path_to_working_directory>/H3K18pr/deepTools/results/regions_prop_input2_TSS.bed 


plotHeatmap -m /<path_to_working_directory>/H3K18pr/deepTools/results/matrix_prop_input2_TSS.gz \
-out /<path_to_working_directory>/H3K18pr/deepTools/results/figures/prop_input2_TSS_heatmap.eps \
--colorMap RdBu \
--whatToShow 'heatmap and colorbar' \
--zMin -4 --zMax 4  


plotProfile -m /<path_to_working_directory>/H3K18pr/deepTools/results/matrix_prop_input2_TSS.gz \
-out /<path_to_working_directory>/H3K18pr/deepTools/results/figures/prop_input2_TSS_profile.eps \
--color blue \
--refPointLabel "TSS" \
-z "" 


computeMatrix reference-point --referencePoint TSS \
-b 1000 -a 1000 \
-R /<path_to_working_directory>/H3K18pr/deepTools/prop_input2.bed \
-S /<path_to_working_directory>/H3K18pr/deepTools/prop_input2.bigwig \
--skipZeros \
-o /<path_to_working_directory>/H3K18pr/deepTools/results/matrix_prop_input2_TSS.gz \
-p 6 \
--outFileSortedRegions /<path_to_working_directory>/H3K18pr/deepTools/results/regions_prop_input2_TSS.bed 


plotHeatmap -m /<path_to_working_directory>/H3K18pr/deepTools/results/matrix_prop_input2_TSS.gz \
-out /<path_to_working_directory>/H3K18pr/deepTools/results/figures/prop_input2_TSS_heatmap.eps \
--colorMap RdBu \
--whatToShow 'heatmap and colorbar' \
--zMin -4 --zMax 4  


plotProfile -m /<path_to_working_directory>/H3K18pr/deepTools/results/matrix_prop_input2_TSS.gz \
-out /<path_to_working_directory>/H3K18pr/deepTools/results/figures/prop_input2_TSS_profile.eps \
--color blue \
--refPointLabel "TSS" \
-z "" 

