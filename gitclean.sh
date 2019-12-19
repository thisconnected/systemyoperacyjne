#!/bin/bash
function commit()
{
    git add .
    linefixed="$line"
    echo "commit name:"
    read name
    echo "git commit -m $name"
    git commit -m $linefixed
    echo "commited to $line"
}

function ifcommit()
{
    printwd
    PS3="Are you sure you want to commit changes above?"
    options=("commit" "push" "skip")
    select opt in "${options[@]}"
    do
	case $opt in
	    "commit")
		commit
		read
		break
		;;
	    "push")
		commit
		git push
		printwd
		echo "PUSHED"
		read
		break
		;;
	    "skip")
		break
		;;
	    *)
		echo "not implemented"
		;;
	esac
    done

}


function check()
{
    printwd
    PS3="chose option and type RETURN:"
    options=("examine" "commit" "skip")
    select opt in "${options[@]}" 
    do
	case $opt in
	    "examine") #doesnt print menu if you come back from this
		git diff
		printwd
		;;
	    "commit")
		ifcommit
		break
		;;
	    "skip")
		break
		;;
	    *)
		echo "not implemented"
		;;
	esac
    done
    clear
}
function printwd()
{
    clear
    git add .
    echo "-------------------"
    echo "$line"
    echo "-------------------"
    git status

    echo "------------------"
}

D=~/pwsz

cd $D
for line in `find . -maxdepth 1 -type d`;
do
    cd $D
    if ! [[ -d "$line/.git" ]]; then
	continue
    fi
    cd $line
    printwd
    check
    
    

done

