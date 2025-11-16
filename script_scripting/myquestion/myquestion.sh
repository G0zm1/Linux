#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Bitte Frage als Parameter angeben."
  echo "Beispiel: ./myquestion 'Welche Frage denn?'"
  exit 2
fi

frage="$*"

while true; do
  read -p "$frage (Ja|Nein): " antwort

  antwort=$(echo "$antwort" | tr '[:upper:]' '[:lower:];)

  case "$antwort" in
    ja|j)
        exit 0
        ;;

    nein|n)
        exit 2
        ;;

    *)
      echo "Bitte mit 'Ja' oder 'Nein' antworten."
      ;;

  esac
done
