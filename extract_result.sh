#!/bin/bash

VAX_11_780=1757

TARGET=$1
COMPILER=$2
ITERATIONS=$3
MHZ=$4
START_TIME=$(grep "\$1 = " result | sed 's/\$1 = [^0-9]*//g')
STOP_TIME=$(grep "\$2 = " result | sed 's/\$2 = [^0-9]*//g')
TIME_MICROSEC=$(( ($STOP_TIME-$START_TIME)/$MHZ ))
TIME_MSEC=$(( ($STOP_TIME-$START_TIME)/(1000*$MHZ) ))
TIME_SEC=$(( ($STOP_TIME-$START_TIME)/(1000000*$MHZ) ))
NANO_PER_RUN=$(( (1000*$TIME_MICROSEC)/$ITERATIONS ))
DHRY_PER_SEC=$(( ($ITERATIONS)/$TIME_SEC ))
DMIPS=$(( ($DHRY_PER_SEC)/$VAX_11_780 ))

echo ""
echo "TARGET: $TARGET"
echo "COMPILER: $COMPILER"
echo "ITERATIONS: $ITERATIONS"
echo "CPU_FREQ (MHz): $MHZ"
echo ""
echo "START_TIME (cycles): $START_TIME"
echo "STOP_TIME  (cycles): $STOP_TIME"
echo "MICROSECS: $TIME_MICROSEC"
echo ""
echo "Nanoseconds for one run through Dhrystone: $NANO_PER_RUN"
echo "Dhrystones per Second: $DHRY_PER_SEC"
echo "DMIPS: $DMIPS"
echo ""
echo "SIZE:"
size dhry
echo ""
