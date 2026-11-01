#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Uso: $0 FICHERO"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: no existe el fichero $1"
    exit 1
fi

sed -E '/^[[:space:]]*#/d; /^[[:space:]]*$/d' "$1"
