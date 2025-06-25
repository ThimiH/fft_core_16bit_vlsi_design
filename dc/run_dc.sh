#!/bin/bash
LOGDIR=logs
mkdir -p $LOGDIR

dc_shell -f scripts/compile.tcl | tee $LOGDIR/dc.log

if [ $? -ne 0 ]; then
    echo "Synthesis failed. Check the log file $LOGDIR/dc.log for details."
    exit 1
else
    echo "Synthesis completed successfully."
fi