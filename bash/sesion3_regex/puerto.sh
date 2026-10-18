#!/bin/bash

if [[ $# -eq 0 ]]; then
    echo "Uso: $0 NUMERO_DE_PUERTO"
    exit 1
fi

puerto=$1
re='^[0-9]+$'

if [[ ! $puerto =~ $re ]]; then
    echo "$puerto no es un número"
    exit 1
fi

# Quitamos ceros iniciales para que Bash no interprete el número como octal.
puerto_numero=$puerto
while [[ ${#puerto_numero} -gt 1 && ${puerto_numero:0:1} == 0 ]]; do
    puerto_numero=${puerto_numero:1}
done

if [[ ${#puerto_numero} -gt 5 ]]; then
    echo "$puerto está fuera de rango (1-65535)"
elif (( puerto_numero >= 1 && puerto_numero <= 65535 )); then
    echo "$puerto es un puerto válido"
else
    echo "$puerto está fuera de rango (1-65535)"
fi
