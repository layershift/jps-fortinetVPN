#!/bin/bash

if [ ! -e /dev/ppp ]; then
    while :; do
        mknod /dev/ppp c 108 0
        if [ -e /dev/ppp ]; then
            break;
        fi
        sleep 1
    done;
else
    echo "Module exists"
    ls -l /dev/ppp
fi

