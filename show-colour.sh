#! /bin/bash

for i in {0..255} ; do
    printf "\x1b[38;5;${i}mcolour%03d  " $i

    if !((($i + 1) % 8)); then
        printf "\n"
    fi
done

