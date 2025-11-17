#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Bitte den Pfad und Anzahl der zu löschenden Dateien als Parameter angeben."
  echo "Beispie: ./delete_n_files.sh /~Desktop/Uni/test 2"
  exit 2
fi

Pfad="$1"
Anzahl="$2"

if [ -d "$Pfad" ]; then
  echo "Unter dem Pfad: "$1" werden nun ["$2"] Dateien gelöscht."

  ls -1 "$Pfad" | head -n "$Anzahl" | while read file; do
    rm "$Pfad/$file"

    
  echo " "$file" wurde gelöscht."

  done

  echo "Programm wird beendet."

else
  echo " "$Pfad" exisitiert nicht. Vorgang abgebrochen."
  exit 2
  
fi
