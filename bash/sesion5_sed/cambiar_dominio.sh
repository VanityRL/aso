#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Uso: $0 FICHERO"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: no existe el fichero $1"
    exit 1
fi

sed -E 's/@(gmail|hotmail)\.com$/@alu.edu.gva.es/' "$1"
