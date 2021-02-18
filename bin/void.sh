#! /usr/bin/env bash 

VOID="$HOME/Trash"

if ! [[ -d $VOID ]]; then
    mkdir "$VOID"
    exit 1
fi

if [[ $(ls -A $VOID | wc -l) -gt 0 ]]; then
    rm -r -f $VOID/*
    exit 0
fi

