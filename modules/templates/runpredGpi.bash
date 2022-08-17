#!/usr/bin/env bash

set -euo pipefail
predgpi.py \
    -f subset.fa \
    -o output \
    -m $params.outputFormat
