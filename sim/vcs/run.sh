#!/bin/bash

OUTDIR=sim/vcs/output
mkdir -p $OUTDIR

# Compile
vcs -full64 -sverilog -debug_all -f sim/vcs/compile.f \
    -o $OUTDIR/fft_simv \
    +define+RTL_SIM \
    +vcs+lic+wait \
    -l $OUTDIR/compile.log

# Simulate with GUI
cd $OUTDIR
./fft_simv -ucli -l simulate.log -gui
