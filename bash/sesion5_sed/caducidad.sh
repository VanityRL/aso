#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Uso: $0 NUMERO_DE_DIAS"
    exit 1
fi

dias="$1"
if [[ ! "$dias" =~ ^[0-9]{1,3}$ ]]; then
    echo "Error: $dias no es un número de días válido"
    exit 1
fi

fichero="$HOME/lab-sed/login.defs"
if [ ! -f "$fichero" ]; then
    echo "Error: no existe $fichero. Copia primero /etc/login.defs a ~/lab-sed."
    exit 1
fi

antes=$(sed -n -E 's/^[[:space:]]*PASS_MAX_DAYS[[:space:]]+([0-9]+).*/\1/p' "$fichero" | head -n 1)
if [ -z "$antes" ]; then
    echo "Error: no se encontró PASS_MAX_DAYS en $fichero"
    exit 1
fi

sed -E -i.bak "s/^([[:space:]]*PASS_MAX_DAYS[[:space:]]+)[0-9]+/\1$dias/" "$fichero"
despues=$(sed -n -E 's/^[[:space:]]*PASS_MAX_DAYS[[:space:]]+([0-9]+).*/\1/p' "$fichero" | head -n 1)
echo "Antes:   PASS_MAX_DAYS $antes"
echo "Después: PASS_MAX_DAYS $despues"
