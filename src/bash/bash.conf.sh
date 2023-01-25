#!/bin/bash

TARGETS=$(find ${SOURCE_DIR}/bash/ -name dot.* && find ${SOURCE_DIR}/shell/ -name dot.*)

function bash-install () {
	for TARGET in ${TARGETS}
	do
		local target=$(basename ${TARGET} | sed -e 's/dot//g')
		if [ -e ${target} ] || [ -d ${target} ]; then
			command . ${SOURCE_DIR}/install/backup.sh ${target} 
		fi
        command echo "${TARGET} ${HOME}/${target}"
		command ln -sf ${TARGET} ${HOME}/${target}
	done
	. ${HOME}/.bashrc
}

function bash-clean () {
	for TARGET in ${TARGETS}
	do
		local target=$(basename ${TARGET} | sed -e 's/dot//g')
		if [ -L ${HOME}/${target} ]; then
			command rm -f ${HOME}/${target}
		fi
	done
}

if "${INSTALL}"; then
	bash-install
elif "${CLEAN}"; then
	bash-clean
fi
