nextflow ./pipeline/main.nf \
    --publish_dir results \
    --fastq_seqs ../../../raw_data/fastq_seqs/ \
    -resume
