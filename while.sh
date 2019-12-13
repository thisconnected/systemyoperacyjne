#!/bin/bash

licznik=0

while [ $licznik -lt 10 ]; do
    echo "licznik:$licznik"
    let licznik=licznik+1
done
