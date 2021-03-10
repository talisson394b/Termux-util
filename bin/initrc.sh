#! /usr/bin/env bash

#vim: set ft=sh

TERMUX_DIR="/data/data/com.termux/files"
TEMP_FILE="${TERMUX_DIR}/usr/tmp/initrc.log"


function newPath {
    if [ -d $TERMUX_DIR/home/bin ]; then
        export PATH="${PATH}:${TERMUX_DIR}/home/bin"
    fi
}


function runThis {
    newPath
    ~/bin/screenrc.sh
    ~/bin/void.sh
}


function isFrist {
    if [ -e "$TEMP_FILE" ]; then
        return true 
    fi
    return false
}


function main {
    if $(isFrist); then
	runThis && echo "$(date)" > $TEMP_FILE
    else
        rm $TEMP_FILE
    fi
}


main

