process MULTIQC {

  publishDir(path: "${publish_dir}/qc/multiqc", mode: "copy")

  input:
      path('*')

  output:
      path("*html")

  script:
      """
      multiqc .
      """
}
