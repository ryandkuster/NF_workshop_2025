process MULTIQC {
    publishDir(path: "${publish_dir}/qc/multiqc", mode: "copy")
    
    container = "quay.io/biocontainers/multiqc:1.19--pyhdfd78af_0"
 
    input:
        path('*')

    output:
        path("*html")

    script:
        """
        multiqc .
        """
}
