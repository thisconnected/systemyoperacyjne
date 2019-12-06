#!/bin/bash
T1="abc"
T2="abc"

if [ "$T1" = "$T2" ];
then
    echo "Prawda!"
elif [ "$T1" != "$T2" ];
then
    echo "Falsz!"
else
    echo "lol"
fi

