#!/bin/bash
adress=""
subject=""

function www()
{
    sudo systemctl start apache2.service
    echo "startuje www"
}
function off()
{
    sudo systemctl stop apache2.service
    echo "stopuje www"
}

function dns()
{
    nmcli dev show | grep DNS
}
function mail()
{
    echo "podaj adress"
    read adress
    touch /tmp/mail
    echo "podaj tytul"
    read subject
    echo "From: $username@thisconnect.com" > /tmp/mail
    echo "To: $adress" >> /tmp/mail
    echo "Subject: $subject" >> /tmp/mail
    rm /tmp/mail2
    nano /tmp/mail2
    cat /tmp/mail2 >> /tmp/mail
    cat /tmp/mail | sendmail -t $adress
    echo "Email wyslany"
}


echo "****"
PS3='Wybierz opcje i nacisnij ENTER: '
options=("apache" "off" "named" "sendmail")
select opt in "${options[@]}"
do
    case $opt in
	"apache")
	    www
	    ;;
	"off")
	    off
	    ;;
	"named")
	    dns
	    ;;
	"sendmail")
	    mail
	    ;;
	*) echo "nieprawidlowa";;
    esac
done
echo "*****"



