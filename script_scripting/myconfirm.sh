#Schreiben Sie ein Shell-Script mit dem Namen myconfirm.
#Das Script erhält als Parameter den Text einer Bestätigungsaufforderung.
#Der Benutzer soll zur Eingabe eines einzelnen Zeichens aufgefordert werden:

#Gibt der Benutzer j oder J ein, beendet sich das Script mit dem Rückgabewert 0.

#Gibt der Benutzer n oder N ein, beendet sich das Script mit dem Rückgabewert 2.

#Bei jeder anderen Eingabe wird die Bestätigungsaufforderung erneut angezeigt.

#Hinweis:
#Das Script darf erst beendet werden, wenn eine gültige Eingabe erfolgt ist.

#!/bin/bash

if [ $# -eq 0 ]; then
    echo "please enter the confirmication."
    echo "./myconfirm.sh löschen?"
    exit 2
fi

confirm="$*"

while true; do
    read -p "$confirm (Ja|Nein): " antwort

    antwort=$(echo "$antwort" | tr '[:upper:]' '[:lower:]')

    case $antwort in
        j)
            exit 0
            ;;

        n)
            exit 2
            ;;

        *)
            ;;

    esac
done
