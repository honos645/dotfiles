#!/bin/bash

TARGETS=$(find ${MODULE_DIR}/vim/ -name dot.*)

function vim-install () {
	for TARGET in ${TARGETS}
	  do
		local target=$(basename ${TARGET} | sed -e 's/dot//g')
		if [ -e ${HOME}/${target} ] || [ -d ${HOME}/${target} ]; then
			command . ${SOURCE_DIR}/install/backup.sh ${target}
		fi
		command ln -sf ${TARGET} ${HOME}/${target}
	done
}

function vim-clean () {
	for TARGET in ${TARGETS}
	do
		local target=$(basename ${TARGET} | sed -e 's/dot//g')
		if [ -L ${HOME}/${target} ]; then
			command rm -f ${HOME}/${target}
		fi
	done
}

if "${INSTALL}"; then
	vim-install	
elif "${CLEAN}"; then
	vim-clean
fi
