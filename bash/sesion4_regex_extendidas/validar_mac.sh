#!/bin/bash

if [[ $# -eq 0 ]]; then
    echo "Uso: $0 DIRECCION_MAC"
    exit 1
fi

mac=$1
re='^([[:xdigit:]]{2}:){5}[[:xdigit:]]{2}$|^([[:xdigit:]]{2}-){5}[[:xdigit:]]{2}$'

if [[ $mac =~ $re ]]; then
    echo "$mac es una MAC válida"
else
    echo "$mac no es una MAC válida"
fi
