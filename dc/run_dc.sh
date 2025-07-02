#!/bin/bash

# Check if dc_shell is available
if ! command -v dc_shell &> /dev/null; then
    echo "Error: dc_shell is not available. Please ensure Design Compiler is installed and in PATH."
    exit 1
fi

# Create necessary directories
LOGDIR=logs
OUTDIR=outputs
REPORTDIR=reports
mkdir -p $LOGDIR $OUTDIR $REPORTDIR

echo "Starting Design Compiler synthesis..."
dc_shell -f scripts/compile.tcl | tee $LOGDIR/dc.log

if [ $? -ne 0 ]; then
    echo "Synthesis failed. Check the log file $LOGDIR/dc.log for details."
    exit 1
else
    echo "Synthesis completed successfully."
    echo "Check outputs in $OUTDIR/ and reports in $REPORTDIR/"
fi