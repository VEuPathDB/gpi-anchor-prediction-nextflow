#!/usr/bin/env bash

set -euo pipefail
predgpi.py \
    -f $subsetFasta \
    -o output \
    -m $params.outputFormat
