nextflow.enable.dsl=2

include { GET_HEADERS    } from "./modules/fasta_utils.nf"

workflow {

    if (params.fasta_seqs) {
        ch_fastas = Channel.fromPath("${params.fasta_seqs}/*fna", checkIfExists: true)
        ch_fastas.view()
        GET_HEADERS(ch_fastas)
        GET_HEADERS.out.ch_headers.view()
       // add CONCAT_HEADERS here    
    }

    /*
    goals:
        1. run the pipeline using the provided fasta_seqs directory as
           input as "fasta_seqs"
        2. import the process CONCAT_HEADERS from fasta_utils.nf in the
           modules directory
        3. use the .collect() operator to send all of the GET_HEADERS
           output files to CONCAT_HEADERS at once
        4. see if you can find and implement an additional operator from the
           nextflow documentation
    */
}
