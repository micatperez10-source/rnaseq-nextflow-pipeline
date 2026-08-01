nextflow.enable.dsl=2

include { FASTQC } from '../modules/local/fastqc'
include { MULTIQC } from '../modules/local/multiqc'

workflow {

    // 1. Resolver el archivo físico absoluto
    ch_input = Channel.fromPath(params.input, checkIfExists: true)
                      .map { file -> tuple([id: file.simpleName], file) }

    // 2. Ejecutar FastQC
    FASTQC(ch_input)

    // 3. Pasar los resultados de FastQC a MultiQC
    MULTIQC(FASTQC.out.zip.collect { it[1] })
}