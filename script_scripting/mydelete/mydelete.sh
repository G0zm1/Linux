#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Bitte Dateinamen als Parameter übergeben."
  echo "Beispiel: ./mydelete.sh myquestion.sh"
  exit 2
fi

for file in "$@"; do
  if [ -f "$file" ]; then

    if ./myquestion.sh "delete $file? "; then
      rm $file
      echo "file was deleted."
    else 
      echo "$file was not deleted.@

    fi

  else
    echo "[$file] exisitiert nicht!"
    exit 2

  fi
  
done
