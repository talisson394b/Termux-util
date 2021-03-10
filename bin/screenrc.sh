#! /usr/bin/env bash

c0='\033[00m'
c1='\033[00;31m'  # Vermelho
c2='\033[00;32m'  # Verde
c3='\033[00;33m'  # Amarelo
c4='\033[00;34m'  # Azul
c5='\033[00;35m'  # Magenta


echo -e "
        bool dead ${c1}=${c0} ${c3}false${c0};

	${c4}void${c0} goDeeper() {
  	    ${c1}if${c0} (dead ${c1}==${c0} ${c3}true${c0})
	        ${c1}return${c0};

		goDeeper();
	    }
	
	${c4}int${c0} main(${c4}void${c0}) {
	    doDeeper();
	}
"
