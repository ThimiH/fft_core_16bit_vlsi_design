#!/bin/bash

# Prime Time Analysis Script
# FFT Core 16-bit VLSI Design

echo "Starting Prime Time Analysis..."
echo "=============================="

# Change to PT directory
cd /home/thimih/Documents/VLSI_Project/steps/fft_core_16bit_vlsi_design/pt

# Check if pt_shell is available
if ! command -v pt_shell &> /dev/null; then
    echo "Error: pt_shell not found in PATH"
    echo "Please ensure Synopsys Prime Time is installed and licensed"
    exit 1
fi

# Run Prime Time
echo "Running Prime Time analysis..."
pt_shell -f pt_script.tcl | tee pt_analysis.log

if [ $? -eq 0 ]; then
    echo ""
    echo "Prime Time analysis completed successfully!"
    echo "Check the reports/ directory for generated reports"
    echo ""
    echo "Generated reports:"
    ls -la reports/
else
    echo "Error: Prime Time analysis failed"
    echo "Check pt_analysis.log for details"
    exit 1
fi
