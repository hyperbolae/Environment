#!/bin/bash

doc="document"
video="video"
audio="audio"
img="image"
pdf="pdf"

function err() {
    >&2 echo "$1";
    exit 1;
}

function type() {
    case "$1" in
        jpg | jpeg | png)  echo $img ;;
        doc | docx | ppt | pptx | xls | xlsx | odf) echo $doc ;;
        pdf) echo $pdf ;;
        mp3 | wav) echo $audio ;;
        mp4 | avi | mov | webm | flv) echo $video ;;
        *) err "Error: unknown file type: $1" ;;
    esac
}

function conv() {
    typeIn="$3"
    typeOut="$4"

    if [[ $typeIn == $doc ]] && [[ $typeOut == $pdf ]]; then
        unoconv -o "$2" "$1"
    elif [[ $typeIn == $img ]]; then
        if [[ $typeOut == $pdf ]] || [[ $typeOut == $img ]]; then
            convert "$1" "$2"
        fi
    elif [[ $typeOut == $audio ]]; then
        if [[ $typeIn == $audio ]] || [[ $typeIn == $video ]]; then
            ffmpeg -i "$1" "$2"
        fi
    elif [[ $typeIn == $video ]] && [[ $typeOut == $video ]]; then
        ffmpeg -i "$1" -c:v libx265 -preset slow -x265-params crf=22 -c:a libmp3lame -b:a 128k -loglevel quiet -stats \
            "$2"
    else
        err "Error: cannot covert $extIn to $extOut"
    fi
}

if [[ $# -ne 2 ]]; then
    err 'usage: <source> <dest>'
fi

extIn=${1##*.}
extOut=${2##*.}
if [[ "$extIn" == "$1" ]]; then
    # No extension found, e.g. file name is `abc`
    err 'Error: input file no extension found'
fi
if [[ "$extOut" == "$2" ]]; then
    err 'Error: output file no extension found'
fi

typeIn=$(type $extIn)
typeOut=$(type $extOut)
src="$1"
dst="$2"

if [[ "$1" == ".$extIn" ]]; then
    # Empty file name
    err 'Error: input file name empty'
fi
if [[ "$2" == ".$extOut" ]]; then
    dst="${1%.*}.$extOut"
    echo "Output file name not specified; name to: $dst"
fi

conv "$src" "$dst" "$typeIn" "$typeOut"
