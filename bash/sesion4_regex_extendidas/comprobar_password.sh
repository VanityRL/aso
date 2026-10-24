#!/bin/bash

if [[ $# -eq 0 ]]; then echo "Uso: $0 CONTRASEÑA"; exit 1; fi
password=$1
re_longitud='^.{12,}'; re_digito='[[:digit:]]'
re_mayuscula='[[:upper:]]'; re_simbolo='[^[:alnum:]]'
segura=1

if [[ $password =~ $re_longitud ]]; then longitud="sí"; else longitud="no"; segura=0; fi
if [[ $password =~ $re_digito ]]; then digito="sí"; else digito="no"; segura=0; fi
if [[ $password =~ $re_mayuscula ]]; then mayuscula="sí"; else mayuscula="no"; segura=0; fi
if [[ $password =~ $re_simbolo ]]; then simbolo="sí"; else simbolo="no"; segura=0; fi

if [[ -f /usr/share/dict/spanish ]]; then
    if grep -Fxiq -- "$password" /usr/share/dict/spanish; then
        no_diccionario="no"; segura=0
    else
        no_diccionario="sí"
    fi
else
    no_diccionario="no"; segura=0
fi

echo "Tiene al menos 12 caracteres: $longitud"
echo "Contiene algún dígito: $digito"
echo "Contiene alguna mayúscula: $mayuscula"
echo "Contiene algún símbolo: $simbolo"
echo "No es una palabra del diccionario: $no_diccionario"

if [[ ! -f /usr/share/dict/spanish ]]; then echo "Aviso: no se encontró /usr/share/dict/spanish"; fi

if (( segura == 1 )); then
    echo "La contraseña es segura"
else
    echo "La contraseña no es segura"
fi

# Caminas2026! cumple las condiciones, pero combina una palabra y un año fáciles
# de adivinar; por eso no la consideraría realmente segura.
