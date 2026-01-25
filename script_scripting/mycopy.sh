#Schreiben Sie ein Shell-Script mit dem Namen mycopy.
#Mit diesem Script soll eine Datei kopiert werden. Die Quelldatei und die Zieldatei werden als Parameter beim Aufruf übergeben.

#Vor dem Kopieren soll überprüft werden, ob die Zieldatei bereits existiert.
#Falls dies der Fall ist, soll der Benutzer gefragt werden, ob die vorhandene Datei überschrieben werden soll.
#Rufen Sie dazu das zuvor erstellte Frage-/Bestätigungs-Script auf und verwenden Sie dessen Rückgabewert als Entscheidung für Kopieren / Nicht-Kopieren.

#Hinweise:

#Existiert die Quelldatei nicht, soll eine Fehlermeldung ausgegeben und das Script beendet werden.

#Wird das Überschreiben abgelehnt, darf keine Kopie erfolgen.

#Bei erfolgreichem Kopieren soll das Script mit Rückgabewert 0 enden, andernfalls mit einem von Ihnen sinnvoll gewählten Rückgabewert.

#!/bin/bash

if [ $# -eq 0 ]; then
    echo "please enter file and target as parameter."
    echo "f.e.: ./mycopy.sh 1.txt 2.txt."
    exit 2
fi

Quelle="$1"
Ziel="$2"

if [ -f $Ziel ]; then
    if ./myconfirm.sh "overwrite $Ziel? "; then
        cp "$Quelle" "$Ziel"
        exit 0
    else
        echo "not copied."
        exit 2
    fi

else
    echo "Error 404."
    exit 2
fi
       
