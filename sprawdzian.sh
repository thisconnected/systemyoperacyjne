#!/bin/bash

filename="test-file-"
dirname="test-dir-"
fileamount=5
diramount=3
i=1
function options()
{
    PS3="wybierz akcje:"
    options=("utworz-katalogi" "usun-katalogi" "utworz-pliki" "usun-pliki" "pokaz-katalogi" "pokaz-pliki")
    select opt in "${options[@]}"
    do
	case $opt in
	    "utworz-katalogi")
		while [ $i -le $diramount ]
		do
		    mkdir "$dirname$i"
		    i=$[$i+1]
		done
		i=1
		;;
	    "usun-katalogi")
		while [ $i -le $diramount ]
		do
		    rm -r "$dirname$i"
		    i=$[$i+1]
		done
		i=1
		;;
	    "utworz-pliki")
		while [ $i -le $fileamount ]
		do
		    touch  "$filename$i"
		    i=$[$i+1]
		done
		i=1
		;;
	    "usun-pliki")
		while [ $i -le $fileamount ]
		do
		    rm  "$filename$i"
		    i=$[$i+1]
		done
		i=1
		;;
	    "pokaz-katalogi")
	        while [ $i -le $diramount ]
		do
		    echo "$dirname$i"
		    ls -la "$dirname$i"
		    i=$[$i+1]
		done
		i=1
		;;
	    "pokaz-pliki")
	        while [ $i -le $fileamount ]
		do
		    ls -la  "$filename$i"
		    i=$[$i+1]
		done
		i=1
		;;
	    *)
		echo "nie ma takiej operacji"
		;;
	esac
    done

}
echo "start"
options
