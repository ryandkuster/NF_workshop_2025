nextflow.enable.dsl=2

include { FASTQC  } from "./modules/fastqc.nf"
include { MULTIQC } from "./modules/multiqc.nf"

workflow {

    if (params.fastq_seqs) {
        ch_fastqs = Channel.fromFilePairs("${params.fastq_seqs}/*read{1,2}.fastq.gz", checkIfExists: true, flat:true)
        // ch_fastqs.view()
        FASTQC(ch_fastqs)
    }

    /*
    goals:
        1. make MULTIQC take as input the output of the FASTQC process
           (this will require the .collect() operator)
        2. run the pipeline as-is (it will fail)
        3. in the "run_01.sh" file, add a new line with "-resume" to
           keep the successful results from FASTQC
        4. find an appropriate multiqc container from quay.io and add
           it to the modules/multiqc.nf file (see fastqc.nf for help)
    */

}
