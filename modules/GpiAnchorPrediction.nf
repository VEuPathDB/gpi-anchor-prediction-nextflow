#!/usr/bin/env nextflow
nextflow.enable.dsl=2


process runpredGpi {
  container = "veupathdb/gpianchorprediction:1.0.0"

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