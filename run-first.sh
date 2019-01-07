 #!/bin/bash
#SBATCH --job-name=demo
#SBATCH --mail-type=ALL
#SBATCH --mail-user=djlemas@ufl.edu
#SBATCH --ntasks=2
#SBATCH --mem=40gb
#SBATCH --account=djlemas
#SBATCH --qos=djlemas-b
#SBATCH --time=1:00:00
#SBATCH --output=demo_%j.log
pwd; hostname; date

# load modules
module load bbmap
module load singularity
module load nextflow
module load fastqc         
module load bbmap          
module load samtools       
module load metaphlan2     
module load qiime          
module load python/2.7.14 
module load java/9.0.1

#Run nextflow script
nextflow run YAMP.nf --reads1 ./data/ERR011089_1.fastq.gz --reads2 ./data/ERR011089_2.fastq.gz --prefix Meta_HIT_ERR011089 --outdir ./data --mode complete -with-singularity docker://alesssia/yampdocker
date