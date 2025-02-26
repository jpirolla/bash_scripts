#!/bin/bash

# Verifica se foi passado um argumento (nome do processo)
if [ -z "$1" ]; then
    echo "Por favor, forneça o nome de um processo como argumento."
    exit 1
fi

# A variável PROCESS_NAME armazena o nome do processo que será verificado
PROCESS_NAME=$1

# Verifica se o processo está em execução
if pgrep "$PROCESS_NAME" &> /dev/null
then
    echo "$PROCESS_NAME está operando $( date +"%Y-%m-%d %H:%M:%S")"
else
    echo "$PROCESS_NAME fora de operação $( date +"%Y-%m-%d %H:%M:%S")"
fi
