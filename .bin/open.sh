#!/usr/bin/bash

function open() {
    if [ $# != 1 ]; then
        pwsh.exe .
    else
        if [ -e $1 ]; then
            pwsh.exe /c start $(wslpath -w $1) 2> /dev/null
        else
            echo "open: $1 No such file or directory"
        fi
    fi
}
