nextflow ./pipeline/main.nf \
    --publish_dir results \
    --fastq_seqs ../../../raw_data/fastq_seqs/ \
    --genome /lustre/isaac24/proj/UTK0411/rkuster/NF_workshop_2025/raw_data/refs/chr22_with_ERCC92.fa \
    --annot /lustre/isaac24/proj/UTK0411/rkuster/NF_workshop_2025/raw_data/refs/chr22_with_ERCC92.gtf \
    -resume
