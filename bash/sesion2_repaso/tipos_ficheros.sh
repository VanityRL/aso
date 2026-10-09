#!/bin/bash

contar_por_extension() {
    carpeta=$1
    ext=$2
    find "$carpeta" -maxdepth 1 -type f -name "*.$ext" | wc -l | tr -d ' '
}

carpeta="$HOME/prueba_bash/datos"

for ext in log txt csv; do
    cantidad=$(contar_por_extension "$carpeta" "$ext")
    echo "$ext -> $cantidad"
done
