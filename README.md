# Nextflow Conversion of repeatMaskerTask.pm

***<p align=center>GpiAnchorPrediction</p>***  
```mermaid
flowchart TD
    p0((Channel.fromPath))
    p1[GpiAnchorPrediction:runpredGpi]
    p2(( ))
    p0 -->|seqs| p1
    p1 --> p2
```

### Get Started
  * Install Nextflow
    
    `curl https://get.nextflow.io | bash`
  
  * Run the script
    
    `nextflow run VEuPathDB/GpiAnchorPrediction -with-trace -c  <config_file> -r main`

### Description of nextflow configuration parameters:

| param         | value type        | description  |
| ------------- | ------------- | ------------ |
| inputFilePath | string| Path to the input fasta file. |
| outputDir | string | Where you would the the output file to be stored. |
| outputFormat | string <json,gff3> | Desired output format. |
