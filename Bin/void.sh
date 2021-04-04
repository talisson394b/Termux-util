#! /usr/bin/env bash 

VOID="/sdcard/Void.d"

if ! [[ -d $VOID ]]; then
    mkdir "$VOID"
    exit 1
fi

if [[ $(wc -l <<< $(ls -A $VOID)) -gt 0 ]]; then
    rm -r -f $VOID/*
    exit 0
fi

