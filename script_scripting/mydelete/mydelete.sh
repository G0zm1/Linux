#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Bitte Dateinamen als Parameter übergeben."
  echo "Beispiel: ./mydelete.sh myquestion.sh"
  exit 2
fi

for file in "$@"; do
  if [ -f "$file" ]; then

    read -p "soll [$file] gelöscht werden? (Ja|Nein): " antwort

    antwort=$(echo "$antwort" | tr '[:upper:]' '[:lower:]')

    case "$antwort" in
      ja|j)
          rm $file
          echo "[$file] wurde erfolgreich gelöscht."
          ;;

      nein|n)
          echo "[$file] wurde nicht gelöscht."
          ;;

      *)
        echo "Bitte mit 'Ja' oder 'Nein' antworten."
        ;;

    esac

  else
    echo "[$file] exisitiert nicht!"
    exit 2

  fi
  
done
