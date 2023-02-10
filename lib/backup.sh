#!/bin/bash

function backup () {
    if [ -e ${HOME}/${1} ]; then
        command mkdir -p ${BACKUP_DIR}/

        if [ $(ls -t ${TOP_BACKUP_DIR} | head -n 2 | wc -l) -eq 2 ]; then
            command cp -rud ${TOP_BACKUP_DIR}/$(ls -t ${TOP_BACKUP_DIR} | head -n 2 | sort | head -n 1)/ ${BACKUP_DIR}
        fi
        command cp -ruf ${HOME}/${1} ${BACKUP_DIR}/$(echo ${HOME}/${1} | sed -e 's/\//!/g')
    fi
}

backup $1
