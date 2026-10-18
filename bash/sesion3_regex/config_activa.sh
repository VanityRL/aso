#!/bin/bash

fichero=${1:-/etc/login.defs}

if [[ ! -f $fichero ]]; then
    echo "Error: no existe el fichero $fichero"
    exit 1
fi

re_comentario='^[[:space:]]*#'
re_vacia='^[[:space:]]*$'
total=0
utiles=0

while IFS= read -r linea || [[ -n $linea ]]; do
    ((total++))

    if [[ $linea =~ $re_comentario || $linea =~ $re_vacia ]]; then
        continue
    fi

    echo "$linea"
    ((utiles++))
done < "$fichero"

echo "----"
echo "Líneas totales: $total"
echo "Líneas útiles: $utiles"

# PASS_MAX_DAYS indica durante cuántos días puede utilizarse una contraseña.
# El valor 99999 equivale prácticamente a que no caduque; no es lo más seguro.
