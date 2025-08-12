nextflow ./pipeline/main.nf \
    --publish_dir results \
    --fastq_seqs ../../raw_data/fastq_seqs/ \
    --genome /nfs/home/rkuster/NF_workshop/raw_data/refs/chr22_with_ERCC92.fa \
    --annot /nfs/home/rkuster/NF_workshop/raw_data/refs/chr22_with_ERCC92.gtf \
    -resume
