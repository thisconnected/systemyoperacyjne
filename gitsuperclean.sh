#!/bin/bash
repos=0
add=0
commitno=0
push=0
lastaction=""
function commit()
{
    git status
    linefixed="$line"
    echo "commit name:"
    read name
    echo "git commit -m $name"
    git commit -m "$name"
    echo "commited from $line to origin/master"
    sleep 2
    temp1=$(git status | grep ahead)
    temp2="
COMMITED $name  $line"
    lastaction=$temp2$temp1
    printwd
    let "commitno++"
    
}
function push()
{
    git status
    git push
    printwd
    let "push++"
    lastaction="PUSHED $line"
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
		lastaction="ADDED $line"
		printwd
		let "add++"
		;;
	    "commit")
		commit
		;;
	    "push")
		push
		break
		;;
	    "diff")
		git diff origin/master
		printwd
		continue
		;;
	    "shell")
		bash
		lastaction="EXITED SHELL"
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
    echo "$lastaction"
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
clear
echo "--------------------------"
echo "$repos repositories in $D:"
echo ""
echo "$commitno commits"
echo "$push pushes"
echo "DONE"
