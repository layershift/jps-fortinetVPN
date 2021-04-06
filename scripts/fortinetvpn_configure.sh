#!/bin/bash

action="$1"
baseUrl="$2"
host="$3"
port="$4"
username="$5"
password="$6"
hosts="$7"

config="/etc/openfortivpn/server.conf"
hostsFile="/etc/hosts"

function hostsFileCleanup {
    if grep -q "#fortinetvpn mark" $hostsFile; then
        blockStart=$(grep -n "#fortinetvpn mark" $hostsFile | awk -F ":" '{print $1}' | head -n 1)
        blockEnd=$(grep -n "#fortinetvpn mark" $hostsFile | awk -F ":" '{print $1}' | tail -n 1)
        sed "$blockStart,$blockEnd d" -i $hostsFile
    fi

    sed -i '/^$/d' $hostsFile
    echo "" >> $hostsFile
}

if [ "$action" == "uninstall" ]; then
    hostsFileCleanup;
    exit 0;
fi

if [ ! -f $config ]; then
    curl -fsSL --create-dirs "${baseUrl}/scripts/server.conf" -o $config;
    chmod 600 $config
fi

# find server cert
#servercert=$(echo "$password" | openconnect --non-inter --authenticate --authgroup="$group" -u "$user" --passwd-on-stdin "$server" 2>&1 | grep "\-\-servercert" | sed "s#.*--servercert ##g")

sed -i -e "s/^host =.*$/host = $host/" $config
sed -i -e "s/^port =.*$/port = $port/" $config
sed -i -e "s/^username.*$/username = $username/" $config
sed -i -e "s/^password.*$/password = $password/" $config


#/etc/hosts

hostsFileCleanup

echo "#fortinetvpn mark" >> $hostsFile
printf "$hosts\n" >> $hostsFile
echo "#fortinetvpn mark" >> $hostsFile 