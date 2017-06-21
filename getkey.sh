#!/bin/bash
#######################################################
#Its annoying trying to get a key from Freeipa, 
#so here is a little script to automate that process.
#Edit the file to meet your domain name.
########################################################

read -p "What is the hostname : " name
read -p "What is your password for NSS : " passwd
echo $passwd > /tmp/passwd
mkdir $name
cd $name
certutil -N -d . -f /tmp/passwd
certutil -R -d . -a -g 4096 -s "CN=$name.example.com,O=EXAMPLE.COM" -8 "$name.example.com" -f /tmp/passwd
read -rsp $'Press any key to continue...\n' -n1 key
echo > $name.example.com.crt
${VISUAL:-${EDITOR:-vi}} $name.example.com.crt
certutil -A -n "$name" -t ",," -i $name.example.com.crt -d . -f /tmp/passwd
pk12util -o $name.example.com.p12 -d .  -n $name -K $passwd -W $passwd
openssl pkcs12 -in $name.example.com.p12 -out $name.example.com.pem -nodes -passin pass:$passwd
cat $name.example.com.pem
/usr/bin/rm -f /tmp/passwd
cd ..
