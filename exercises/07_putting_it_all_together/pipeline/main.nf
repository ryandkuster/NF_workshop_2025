nextflow.enable.dsl=2

include { FASTQC     } from "./modules/fastqc.nf"
include { MULTIQC    } from "./modules/multiqc.nf"
include { STAR_INDEX } from "./modules/star.nf"
include { STAR_MAP   } from "./modules/star.nf"

workflow {

    if (params.fastq_seqs) {
        if (!params.skip_qc) {
            ch_fastqs = Channel.fromFilePairs("${params.fastq_seqs}/*read{1,2}.fastq.gz", checkIfExists: true, flat:true)
            FASTQC(ch_fastqs)
            MULTIQC(FASTQC.out.ch_fastqc.collect())
        }
        STAR_INDEX(params.genome, params.annot)
        STAR_MAP(ch_fastqs, STAR_INDEX.out.star_idx)
    }
    /*
    goals:
        1. add the newly built STAR image to the "star.nf" processes
        2. run the pipeline supplying the full path to "genome" and
           "annot" params
        3. in "nextflow.config", add "maxForks = 1", then run the
           pipeline again

    bonus:
        1. define labels for all tools
            a. create labels for cpus per process
            b. create label information with container information
        2. add a trimming step
        3. add a read counting step (e.g., htseq)
        4. add a pseudocounting tool
    */
}
