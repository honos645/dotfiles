#!/bin/bash

type git > /dev/null 2>&1 && git clone https://github.com/honos645/dotfiles

#type git > /dev/null 2>&1 && curl -OL https://github.com/honos645/dotfiles/archive/refs/heads/main.zip

command cd ./dotfiles

CONFIG=$(find . -type f -name "*.conf.sh")

for config in ${CONFIG}; do
    command source ${config}
    command $(basename ${config} .conf.sh)-install
done

