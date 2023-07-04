../nextflow/launch.sh kuberun nf-core/scrnaseq --input 'samplesheet.csv' --outdir 'first' --genome GRCh38 -head-image 'cerit.io/nextflow/nextflow:22.11.1'

../nextflow/launch.sh kuberun nf-core/scrnaseq \
    --input 'samplesheet.csv' \
    --fasta Homo_sapiens.GRCh38.dna_sm.primary_assembly.fa.gz \
    --gtf Homo_sapiens.GRCh38.108.gtf.gz \
    --outdir 'first' \
    -head-image 'cerit.io/nextflow/nextflow:22.11.1'
