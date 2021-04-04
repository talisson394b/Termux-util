#! /usr/bin/env bash


function Menu () {
    local count=0
    for i in ${THEMES[@]}; do
	printf "[ %s ]\t%s\\n" "$count" "$(FormatName $i)"
        ((++count))
    done
}

function FormatName () {
    cut -f1 -d. <<< $(basename $1)
}

function Validation () {
    local int=$1 frist=$2 old=$3
    if [[ $int -ge $frist && $int -lt $old ]]; then
        echo true
    else
        echo false
    fi
}

function Apply() {
   local selected_palette=${THEMES[$1]}
   cp -f $selected_palette ../colors.property
   
   termux-reload-settings
}


color0='\033[00;m'    # reset
color1='\033[00;31m'  # red
color2='\033[00;32m'  # green

cd "${HOME}/.termux/themes" || exit 1
declare -a THEMES=($(find ./ -name "[[:alpha:]]*[.]property"))
if [ ${#THEMES[@]} = 0 ]; then
    echo "There are no palettes in the directory"
    exit 1 
fi

INPUT=0
if [ -z "$1" ]; then
    Menu
    echo -n "Select an option: "
    read INPUT
else 
    INPUT=$1
fi

if $(Validation $INPUT 0 ${#THEMES[@]}); then
    Apply $INPUT && \
    printf "\n* ${color2}%s${color0} %s\n" \
           "$(FormatName ${THEMES[$INPUT]})" "theme sucessfully applied."
else
    printf "\n${color1}%s${color0}" "invalid option!\n"
fi
unset color0 color1 color2
unset THEMES INPUT

