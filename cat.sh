#!/bin/bash

echo "podaj nazwe pliku"
read filename

ls $filename -la
echo ""
while read LINE
    do echo $LINE
done < $filename




