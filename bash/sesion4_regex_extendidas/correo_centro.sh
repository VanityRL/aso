#!/bin/bash

if [[ $# -eq 0 ]]; then
    echo "Uso: $0 DIRECCION_CORREO"
    exit 1
fi

correo=$1
re='^[a-z0-9._-]+@(edu\.gva\.es|alu\.edu\.gva\.es)$'

if [[ $correo =~ $re ]]; then
    case $correo in
        *@alu.edu.gva.es)
            echo "$correo es una cuenta de alumnado"
            ;;
        *)
            echo "$correo es una cuenta de profesorado"
            ;;
    esac
else
    echo "$correo no es una cuenta educativa"
fi
