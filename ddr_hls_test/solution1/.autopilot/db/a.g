#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/tingyuan/Temporary/vivado-outputs/ddr_hls_test/solution1/.autopilot/db/a.g.bc ${1+"$@"}
