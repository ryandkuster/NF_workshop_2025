process FASTQC {
    publishDir(path: "${publish_dir}/qc/fastqc", mode: "symlink")
    
    container = "quay.io/biocontainers/fastqc:0.12.1--hdfd78af_0"

    input:
        tuple val(id), path(r1), path(r2)

    output:
        path("fastqc_${id}_logs"), emit: ch_fastqc

    script:
        """
        mkdir fastqc_${id}_logs
        fastqc -o fastqc_${id}_logs -q ${r1} ${r2}
        """

}
