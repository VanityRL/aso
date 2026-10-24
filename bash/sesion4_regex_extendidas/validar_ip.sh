#!/bin/bash

if [[ $# -eq 0 ]]; then
    echo "Uso: $0 DIRECCION_IP"
    exit 1
fi

ip=$1
re='^[0-9]{1,3}(\.[0-9]{1,3}){3}$'

if [[ $ip =~ $re ]]; then
    echo "$ip tiene formato de IP"
else
    echo "$ip no tiene formato de IP"
fi

# 999.999.999.999 tiene el formato, pero no es una IP válida porque cada
# número de una dirección IPv4 debe estar entre 0 y 255.
