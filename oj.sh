#!/bin/bash

function err() {
    >&2 echo "$1";
    exit 1;
}

if [[ $# -eq 0 ]]; then
    err 'Usage: oj <file.c|cpp|java|py>'
fi

if [[ $1 != *.* ]]; then
    err "Error: no extension found"
fi

fn=${1%.*}
fn=${fn##*/}
ext=${1##*.}

if [[ -z $ext ]]; then
    err "Error: no extension found"
fi

if [[ -z $fn ]]; then
    err "Error: empty file name"
fi

case $ext in
    c)    gcc -o "/tmp/$fn" "$1" && "/tmp/$fn" ;;
    cpp)  g++ -o "/tmp/$fn" "$1" && "/tmp/$fn" ;;
    java) javac -d /tmp/ "$1" && java -cp /tmp/ "$fn" ;;
    py)   python "$1" ;;
    *)    err "Error: unsopprted extension: $ext" ;;
esac
