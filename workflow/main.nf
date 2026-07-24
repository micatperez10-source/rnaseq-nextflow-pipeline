#!/usr/bin/env nextflow

nextflow.enable.dsl=2

log.info """
==================================================
 R N A S E Q - P I P E L I N E (DSL2)
==================================================
 Reads        : ${params.reads}
 Output Dir   : ${params.outdir}
==================================================
"""

process FASTQC {
    tag "QC on ${read_id}"
    publishDir "${params.outdir}/fastqc", mode: 'copy'

    input:
    tuple val(read_id), path(reads)

    output:
    path "*.html", emit: html
    path "*.zip" , emit: zip

    script:
    """
    fastqc -q ${reads}
    """
}

process MULTIQC {
    publishDir "${params.outdir}/multiqc", mode: 'copy'

    input:
    path qc_files

    output:
    path "multiqc_report.html"

    script:
    """
    multiqc .
    """
}

workflow {
    log.info "Pipeline ready to process samples..."
}