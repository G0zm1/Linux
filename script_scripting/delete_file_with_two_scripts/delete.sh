#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Bitte Dateinamen als Parameter übergeben."
  echo "Beispiel: ./delete.sh Test1.sh"
  exit 2
fi

for file in "$@"; do
  if [ -f "$file" ]; then
    if ./reallydelete.sh; then
      rm "$file"
      echo "[$file] wurde erfolgreich gelöscht."

    else
      echo "[$file] wurde nicht gelöscht."
    fi
    
  else 
    echo "[$file] existiert nicht."
    exit 2

  fi

done

