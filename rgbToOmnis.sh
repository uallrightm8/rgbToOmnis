#!/bin/bash

declare -x omnisColor

toBinary(){
    n="$1"
    bit=$2
    while [ "$n" -gt 0 ]; do
        bit="$(( n&1 ))$bit";
        : $(( n >>= 1 ))
    done
    omnisColor=$omnisColor$bit
}

toBinary "$1"
toBinary "$2"
toBinary "$3"

printf "%s\n" "$((2#$omnisColor))"