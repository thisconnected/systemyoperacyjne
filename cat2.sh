#!/bin/bash

if [ $# -eq 0 ]
then
    echo "podaj nazwe pliku"
    read filename
else
    filename=$1
fi

ls $filename -la
echo ""

exec 3< $filename  #open fd 3.

while read -u 3 -r LINE
    do echo $LINE
done < $filename
exec 3>&- #close fd 3.



