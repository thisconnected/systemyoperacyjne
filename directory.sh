#!/bin/bash

filename="moj.txt"
function input()
{
    echo "podaj nazwe"
    read filename
}
function options()
{
    PS3="Choose action:"
    options=("utworz katalog" "usun katalog" "utworz plik" "pokaz plik" "pokaz katalog")
    select opt in "${options[@]}"
    do
	case $opt in
	    "utworz katalog")
		input
		mkdir $filename
		continue
		;;
	    "usun katalog")
		input
		rm -r $filename
		continue
		;;
	    "utworz plik")
		input
		touch $filename
		nano $filename
		continue
		;;
	    "pokaz plik")
		input
		cat $filename
		continue
		;;
	    "pokaz katalog")
		input
		ls --color=auto $filename
		continue
		;;
	    *)
		echo "not implemented"
		;;
	esac
    done

}
echo "start"
options
