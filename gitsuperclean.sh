#!/bin/bash
repos=0
add=0
commitno=0
push=0
function commit()
{
    linefixed="$line"
    echo "commit name:"
    read name
    echo "git commit -m $name"
    git commit -m $linefixed
    echo "commited from $line to origin/master"
}
function options()
{
    PS3="Choose action:"
    options=("skip" "add" "commit" "push" "diff" "shell")
    select opt in "${options[@]}"
    do
	printwd
	case $opt in
	    "skip")
		break
		;;
	    "add")
		git add .
		sleep 1
		printwd
		let "add++"
		;;
	    "commit")
		git status
		commit
		sleep 2
		printwd
		let "commitno++"
		continue
		;;
	    "push")
		git status
		git push
		printwd
		echo "PUSHED"
		let "push++"
		read
		break
		;;
	    "diff")
		git diff origin/master
		printwd
		continue
		;;
	    "shell")
		bash
		printwd
		;;
	    *)
		echo "not implemented"
		;;
	esac
    done

}
function printwd()
{
    clear
    echo "-------------------"
    echo "$line"
    echo "-------------------"
    git diff origin/master --name-status
    echo ""
    git status
    echo "------------------"
    #git status > /tmp/gitbuffer
    #parsestatus
}
function parsestatus()
{
    echo ""
    grep "new file" /tmp/gitbuffer > /tmp/gitstatus
    grep "new file" /tmp/gitbuffer >> /tmp/gitstatus
    grep "new file" /tmp/gitbuffer >> /tmp/gitstatus
}

D=~/pwsz

cd $D
for line in `find . -maxdepth 1 -type d`;
do
    cd $D
    if ! [[ -d "$line/.git" ]]; then
	continue
    fi
    let "repos++"
    cd $line
    printwd
    options
done
echo "$repos"
echo "$add adds"
echo "$commitno commits"
echo "$push pushes"
echo "DONE"
