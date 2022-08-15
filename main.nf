#!/usr/bin/env nextflow
nextflow.enable.dsl=2


process runpredGpi {
  container= 'gpianchor:latest'

  publishDir "$params.outputDir", mode: "copy"

  input:
    path 'subset.fa'

  output:
    path 'output'

  script:
    """
    predgpi.py -f subset.fa -o output -m $params.outputFormat
    """
}


workflow {
  seqs = Channel.fromPath( params.inputFilePath )
  runpredGpi(seqs)
}