#!/bin/bash

if [ -z $1 ]; then
    echo "Error: Configuration file not specified!";
    exit 0;
fi

confFile="$1"

if [ ! -f ${confFile} ]; then
    echo "Error: Configuration file doesn't exist";
    exit 0;
fi

trustedcert=$(timeout 5 openfortivpn -c ${confFile} | grep " trusted-cert " | awk '{print $NF}' | uniq | head -n1)

if [ ${#trustedcert} -gt 0 ]; then
    sed -i -e "s/^trusted-cert.*$/trusted-cert = $trustedcert/" ${confFile}
fi
