process GET_HEADERS {
    publishDir(path: "${publish_dir}/headers", mode: "symlink")

    input:
        path fasta_file

    output:
        path "*headers.txt", emit: ch_headers

    script:
        """
        grep "^>" ${fasta_file} > ${fasta_file.baseName}_headers.txt
        """
}

process CONCAT_HEADERS {
    publishDir(path: "${publish_dir}/concat", mode: "copy")

    input:
        path header_files

    output:
        path "combined_headers.txt", emit: ch_combined

    script:
        """
        for header in *txt; do
          cat \$header >> combined_headers.txt
        done
        """
}
