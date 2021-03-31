#! /usr/bin/env bash

# ~/.bashrc: executed by bash for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History control
HISTSIZE=100
HISTFILESIZE=200

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set a fancy prompt
case "$TERM" in 
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    color0="\[\[00;m\]"    # Reset
    color1="\[\[00;31m\]"  # Red
    color2="\[\[00;32m\]"  # Green
    color3="\[\[00;34m\]"  # Blue
    
    # user in dir \n >
    export PS1="${color2}\u  ${color0}in \w${color3}\n ${color1}>${color0} "
    
    unset color0 color1 color2 color3
else
    export PS1="\w $ "
fi

unset color_prompt

source .shells/functions
source .shells/alias

