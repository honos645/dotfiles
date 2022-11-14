#! /usr/bin/bash

function mkcd() {
    echo "\$1:  $1"
	mkdir -p $1
	cd $1
}

