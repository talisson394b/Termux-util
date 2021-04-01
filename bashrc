#! /usr/bin/env bash

# ~/.bashrc: executed by bash for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History control
HISTCONTROL=ignoredumps
HISTSIZE=100
HISTFILESIZE=200

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export EDITOR="/data/data/com.termux/files/usr/bin/vim"
export PATH="${PATH}:${HOME}/Bin"

# set a fancy prompt
case "$TERM" in 
    xterm-color|*-256color) color_prompt=yes;;
esac

# Prompt:
# 'user' in 'dir'
#  >
if [ "$color_prompt" = yes ]; then
    color0='\[\033[00;m\]'    # Reset
    color1='\[\033[00;31m\]'  # Red
    color2='\[\033[00;32m\]'  # Green
    color3='\[\033[00;34m\]'  # Blue
    
    export PS1="${color2}\u ${color0}in ${color3}\w\n ${color1}>${color0} "
    unset color0 color1 color2 color3
else
    export PS1="\u in \w\n $ "
fi

unset color_prompt

source ~/.shells/functions
source ~/.shells/alias

