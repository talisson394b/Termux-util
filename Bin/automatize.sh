#! /usr/bin/env bash


function Compactar() {
    tar -cf "/storage/Ferias2021.tar" ./* && \
    gzip "/storage/Ferias2021.tar" 

    return "$?"
}


function Organizar() {
    info=("/storage/Void.d/fotos" '.jpeg' \
     "/storage/Void.d/videos" '.mp4')

    for cont in $(seq $((${#info[@]}-1))); do
        dir="${info[$cont]}"
        if [[ -d $(dirname $dir) ]]; then
	    [[ ! -d $dir ]] && mkdir $dir
	fi

	find ./ -name "$item" -exec mv -v {} ${info[$(($cont+1))]}
    done
}


function Principal() {
    $(cd "/storage/DCMI/") && { 
        echo "Movendo Arquivos..."
        Organizar }
    
    $(cd "/storage/Void.d/") && {
        echo "Compactando..."
        Compactar }
    
    if [[ $? -eq 0 ]]; then
        echo ""
        read -p 'Press "F" in respect' -t3
    fi
}


Principal

