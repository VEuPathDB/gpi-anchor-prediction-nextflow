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
    template "runpredGpi.bash"
}


workflow GpiAnchorPrediction {
  take:
    seqs
  main:
    runpredGpi(seqs)
}