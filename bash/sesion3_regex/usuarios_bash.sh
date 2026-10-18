#!/bin/bash

re='bash$'
cantidad=0

while IFS= read -r linea; do
    if [[ $linea =~ $re ]]; then
        usuario=${linea%%:*}
        echo "$usuario"
        ((cantidad++))
    fi
done < /etc/passwd

echo "----"
echo "Usuarios con bash: $cantidad"
