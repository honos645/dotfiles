#!/bin/bash

if [-e backup.sh ]; then
	. backup.sh
fi

DOT_SOURCES=${HOME}/.dotfiles/*/*/dot.*

function dot-install () {
	backup $1
	command ln -sf $2 $1 
}
