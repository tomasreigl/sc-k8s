#../nextflow/launch.sh kuberun nf-core/scrnaseq --input 'samplesheet.csv' --outdir 'first' --genome GRCh38 -head-image 'cerit.io/nextflow/nextflow:22.11.1'
#
#../nextflow/launch.sh kuberun nf-core/scrnaseq \
#    --input 'samplesheet.csv' \
#    --fasta genome/Homo_sapiens.GRCh38.dna_sm.primary_assembly.fa.gz \
#    --gtf genome/Homo_sapiens.GRCh38.109.gtf.gz \
#    --outdir 'first' \
#    -head-image 'cerit.io/nextflow/nextflow:22.11.1'

../nextflow/launch.sh kuberun nf-core/scrnaseq \
    --input 'samplesheet.csv' \
    --fasta genome/Homo_sapiens.GRCh38.dna_sm.primary_assembly.fa \
    --gtf genome/Homo_sapiens.GRCh38.109.gtf \
    --outdir 'first' \
    -head-image 'cerit.io/nextflow/nextflow:22.11.1' \
    -head-memory 4096Mi \
    -head-cpus 1 \
    -head-prescript /mnt/nextflow-cfg.sh

../nextflow/launch.sh kuberun nf-core/scrnaseq \
    --input 'samplesheet.csv' \
    --fasta genome/Homo_sapiens.GRCh38.dna_sm.primary_assembly.fa \
    --gtf genome/Homo_sapiens.GRCh38.dna_sm.primary_assembly_genes.gtf \
    --outdir 'first' \
    -head-image 'cerit.io/nextflow/nextflow:22.11.1' \
    -head-memory 4096Mi \
    -head-cpus 1 \
    -head-prescript /mnt/nextflow-cfg.sh


../nextflow/launch.sh kuberun nf-core/scrnaseq \
    --input 'samplesheet.csv' \
    --fasta genome/GRCh38.fa \
    --gtf genome/GRCh38.gtf \
    --outdir 'first' \
    -head-image 'cerit.io/nextflow/nextflow:22.11.1' \
    -head-memory 4096Mi \
    -head-cpus 1 \
    -head-prescript /mnt/nextflow-cfg.sh

../nextflow/launch.sh kuberun nf-core/scrnaseq \
    --input 'samplesheet.csv' \
    --fasta genome/GRCh38.fa \
    --gtf genome/GRCh38_genes.gtf \
    --outdir 'first' \
    -head-image 'cerit.io/nextflow/nextflow:22.11.1' \
    -head-memory 4096Mi \
    -head-cpus 1 \
    -head-prescript /mnt/nextflow-cfg.sh



../nextflow/launch.sh kuberun nf-core/scrnaseq \
    --input 'samplesheet.csv' \
    --fasta genome/Homo_sapiens.GRCh38.dna_sm.primary_assembly.fa \
    --gtf genome/GRCh38.109.gtf \
    --outdir 'first' \
    -head-image 'cerit.io/nextflow/nextflow:22.11.1' \
    -head-memory 4096Mi \
    -head-cpus 1 \
    -head-prescript /mnt/nextflow-cfg.sh \
    -profile test \
    --max_memory 50.GB \
    --max_cpus 8




# sc-test3 - modified test
../nextflow/launch.sh kuberun nf-core/scrnaseq \
    --input 'samplesheet.csv' \
    --outdir 'first' \
    -head-image 'cerit.io/nextflow/nextflow:22.11.1' \
    -head-memory 4096Mi \
    -head-cpus 1 \
    -head-prescript /mnt/nextflow-cfg.sh

# sc-nextflow-only
../nextflow/launch.sh kuberun nf-core/scrnaseq -profile conda --input ss.csv --outdir outdir

# je to tento problem?
https://github.com/nextflow-io/nextflow/issues/1606
https://sciwiki.fredhutch.org/compdemos/nextflow/


# toto v EMBLu jede:
nextflow run nf-core/scrnaseq --input samplesheet.csv --outdir output -profile test,singularity -c tomas.config --max_memory 128.GB --max_cpus 32 -resume



##################################################################################################################
###########################
##### Finally working #####
###########################

################
# Test Command #
################
/home/user/nextflow/launch.sh  kuberun nf-core/scrnaseq \
  -v 'pvc-beegfs:/mnt2' \
  -head-image 'cerit.io/nextflow/nextflow:22.11.1' \
  -head-memory 4096Mi \
  -head-cpus 1 \
  -head-prescript /mnt/nextflow-cfg.sh \
  -c custom.config \
  -remoteProfile test,docker \
  --outdir /mnt2/XXX/out \
  -resume

###########
# Command #
###########
/home/user/nextflow/launch.sh  kuberun nf-core/scrnaseq \
  -v 'pvc-beegfs:/mnt2' \
  -head-image 'cerit.io/nextflow/nextflow:22.11.1' \
  -head-memory 4096Mi \
  -head-cpus 1 \
  -head-prescript /mnt/nextflow-cfg.sh \
  -c custom.config \
  -remoteProfile docker \
  --outdir /mnt2/XXX/out
  
#######################
### nextflow.config ###
#######################
k8s {
   namespace = 'medgen-ns'
   runAsUser = 1000
   computeResourceType = 'Job'
   pullPolicy = 'IfNotPresent'
   launchDir = '/mnt2/XXX'
   workDir = '/mnt2/XXX/tmp'
   projectDir = '/mnt2/XXX/proj'
   storageClaimName = 'pvc-beegfs'
   storageMountPath = '/mnt2'
}

executor {
   queueSize = 200
}

process {
   executor = 'k8s'
   pod = [[securityContext:[fsGroupChangePolicy:'OnRootMismatch', runAsUser:1000, runAsGroup:1, fsGroup:1]], [automountServiceAccountToken:false], [env:'JAVA_OPTS', value:'-XX:ParallelGCThreads=4'], [env:'HOME', value:'/tmp']]
}

#######################
### samplesheet.csv ###
#######################
sample,fastq_1,fastq_2
CONTROL_REP1,AEG588A1_S1_L002_R1_001.fastq.gz,AEG588A1_S1_L002_R2_001.fastq.gz
CONTROL_REP1,AEG588A1_S1_L003_R1_001.fastq.gz,AEG588A1_S1_L003_R2_001.fastq.gz
CONTROL_REP1,AEG588A1_S1_L004_R1_001.fastq.gz,AEG588A1_S1_L004_R2_001.fastq.gz

#####################
### custom.config ###
#####################
dag {
   enabled = true
   file = './results/pipeline_info/pipeline_dag.svg'
}

report {
   enabled = true
   file = './results/pipeline_info/execution_report.html'
}

timeline {
   enabled = true
   file = './results/pipeline_info/execution_timeline.html'
}

trace {
   enabled = true
   file = './results/pipeline_info/execution_trace.txt'
}

##################################################################################################################
# clean-up run folder
rm -rf proj/ results/ tmp/ \?/ .nextflow*

#####



/home/user/nextflow/launch.sh  kuberun nf-core/smartseq2 \
  -r dev \
  -v 'pvc-beegfs:/mnt2' \
  -head-image 'cerit.io/nextflow/nextflow:22.11.1' \
  -head-memory 4096Mi \
  -head-cpus 1 \
  -head-prescript /mnt/nextflow-cfg.sh \
  -c custom.config \
  -remoteProfile docker \
  --reads '/mnt2/sc-SMRT-nf/data_in/*.fastq.gz' \
  --fasta /mnt2/sc-SMRT-nf/genome/G.fa \
  --gtf /mnt2/sc-SMRT-nf/genome/G.gtf





