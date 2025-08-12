process STAR_INDEX {

    container = "docker://ryandk/star_workshop"

    input:
        path(genome)
        path(gff)

    output:
        path("Star_index"), emit: star_idx

    script:
        """
        mkdir Star_index
        mv $genome ./Star_index
        mv $gff ./Star_index

        STAR \
          --runMode genomeGenerate \
          --genomeDir ./Star_index \
          --genomeFastaFiles ./Star_index/${genome} \
          --runThreadN ${task.cpus} \
          --sjdbGTFfile ./Star_index/${gff} \
          --sjdbGTFtagExonParentTranscript Parent \
          --sjdbOverhang 149
        """
}

process STAR_MAP {
    label "star"

    container = "docker://ryandk/star_workshop"

    publishDir(path: "${publish_dir}/star", mode: "symlink")

    input:
        tuple val(id), path(r1), path(r2)
        path(star_index)

    output:
        tuple val(id), path("*.bam"), emit: ch_bam

    script:
        """
          STAR \
            --genomeDir ${star_index} \
            --readFilesIn ${r1} ${r2} \
            --runThreadN ${task.cpus} \
            --readFilesCommand zcat \
            --outFileNamePrefix ${id} \
            --outSAMtype BAM Unsorted
        """
}
