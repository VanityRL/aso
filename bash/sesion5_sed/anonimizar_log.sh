#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Uso: $0 FICHERO_LOG"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: no existe el fichero $1"
    exit 1
fi

salida="$1.anonimo"
sed -E 's/([0-9]{1,3}\.){3}[0-9]{1,3}/X.X.X.X/g' "$1" > "$salida"
echo "Fichero anonimizado: $salida"
