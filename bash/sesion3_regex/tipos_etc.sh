#!/bin/bash

re_conf='\.conf$'
re_copia='(\.bak|~)$'
conf=0
copias=0

echo "Ficheros de configuración:"
for fichero in /etc/*; do
    [[ -f $fichero ]] || continue
    nombre=${fichero##*/}

    if [[ $nombre =~ $re_conf ]]; then
        echo "  $fichero"
        ((conf++))
    fi

    if [[ $nombre =~ $re_copia ]]; then
        ((copias++))
    fi
done

echo "----"
echo "Configuración: $conf"
echo "Copias de seguridad: $copias"
