#!/bin/bash

LIMPIAR="\033[2J"
AZUL="\033[94m"
RESET="\033[0m"
ROJO="\033[31m"
AMARILLO="\033[33m"
VERDE="\033[92m"
PARPADEANTE="\033[5m"
CURSIVA="\033[3m"
NEGRITA="\033[1m"
PROMPT="${NEGRITA}${VERDE}${USER}@$(hostname -I | awk '{print $1}'):~$ ${RESET}"
clear

function limpiar(){
    echo -e "\n\n${ROJO}[!]${RESET}${AMARILLO} Saliendo...${RESET}"
    sleep 0.1
    exit 0
}
trap limpiar SIGINT

echo -ne "${ROJO}[*]${RESET}${AMARILLO} Esto es una pequeña shell interactiva: ${RESET}"
read respuesta

while true; do
    echo -ne "$PROMPT"
    read respuesta

#    echo -e "${AZUL}[*] Tu mensaje anterior fue: ${RESET}${VERDE}$respuesta${RESET}\n"

        if [[ $respuesta == "exit" ]]; then
            echo -e "${ROJO}\n[!]${RESET}${AMARILLO} Saliendo...${RESET}"
            sleep 1
            exit 0
        elif [[ $respuesta == "cd" || $respuesta == "cd "* ]]; then
            eval $respuesta 2>/dev/null
            echo -e "${CURSIVA}$(pwd)${RESET}"
            continue
        fi
    echo -ne "${PARPADEANTE}"
    eval "${PARPADENATE}$respuesta" 2>/dev/null
    echo -ne "${RESET}"
done

