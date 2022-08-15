#!/usr/bin/env nextflow
nextflow.enable.dsl=2


//---------------------------------------------------------------
// Param Checking 
//---------------------------------------------------------------


if(params.inputFilePath) {
  seqs = Channel.fromPath( params.inputFilePath )
}
else {
  throw new Exception("Missing params.seqFile")
}

if(params.outputFormat != "gff3" && params.outputFormat != "json") {
  throw new Exception("Invalid input for params.outputFormat. Expected values are 'gff3' and 'json'.")
}


//--------------------------------------------------------------------------
// Includes
//--------------------------------------------------------------------------

include { GpiAnchorPrediction } from './modules/GpiAnchorPrediction.nf'

//--------------------------------------------------------------------------
// Main Workflow
//--------------------------------------------------------------------------


workflow {
  seqs = Channel.fromPath( params.inputFilePath )
  GpiAnchorPrediction(seqs)
}