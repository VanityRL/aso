#!/bin/bash

if [[ $# -eq 0 ]]; then
    echo "Uso: $0 DIRECCION_IP"
    exit 1
fi

ip=$1
re_loopback='^127\.'
re_privada='^(10\.|192\.168\.|172\.(1[6-9]|2[0-9]|3[01])\.)'

if [[ $ip =~ $re_loopback ]]; then
    echo "$ip es una dirección loopback"
elif [[ $ip =~ $re_privada ]]; then
    echo "$ip es una dirección privada"
else
    echo "$ip es una dirección pública"
fi

# El bloque 172 se expresa con alternativas: 1[6-9] (16-19), 2[0-9] (20-29)
# y 3[01] (30-31), agrupadas dentro de una única expresión regular.
