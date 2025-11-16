#!/bin/bash

read -p "Möchten Sie die Datei wirklich löschen? (Ja|Nein): " antwort

antwort=$(echo "$antwort" | tr '[:upper:]' '[:lower:]')

case "$antwort" in
  ja|j)
      exit 0
      ;;

  nein|n)
      exit 1
      ;;

  *)
    echo "Bitte mit 'Ja' oder 'Nein' antworten."
    ;;

esac
