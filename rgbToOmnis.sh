#!/bin/bash

declare -x omnisColor

toBinary(){
    n="$1"
    bit=$2
    while [ "$n" -gt 0 ]; do bit="$(( n&1 ))$bit"; : $(( n >>= 1 )); done
    missingBits=$(( 8-${#bit} ))
    if [ "$missingBits" -gt 0 ]; then for i in $(seq 1 $missingBits); do bit=0$bit; done fi
    omnisColor=$omnisColor$bit
}

toBinary "$1"
toBinary "$2"
toBinary "$3"

printf "%s\n" "$((2#$omnisColor))"
