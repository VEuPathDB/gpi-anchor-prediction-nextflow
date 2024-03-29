#!/usr/bin/env nextflow
nextflow.enable.dsl=2


process runpredGpi {
  publishDir "$params.outputDir", mode: "copy"

  input:
    path subsetFasta

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