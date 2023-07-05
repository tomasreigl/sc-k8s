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
