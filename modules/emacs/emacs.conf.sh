#!/bin/bash

TARGETS=$(find ${MODULE_DIR}/emacs/ -name dot.*)
TARGETS+=(".emacs")

function emacs-install () {
	for TARGET in ${TARGETS}
	do
		local target=$(basename ${TARGET} | sed -e 's/dot//g')
		if [ -e ${HOME}/${target} ] || [ -d ${HOME}/${target} ]; then
			command . ${SOURCE_DIR}/install/backup.sh ${target}
		fi
		#command ln -sf ${TARGET} ${HOME}/${target}
		command cp -r ${TARGET} ${HOME}/${target}
	done
	emacs --batch -f batch-byte-compile ${HOME}/.emacs.d/init.el
}

function emacs-clean () {
	for TARGET in ${TARGETS}
	do
		local target=$(basename ${TARGET} | sed -e 's/dot//g')
		if [ -L ${HOME}/${target} ]; then
			command rm -f ${HOME}/${target}
		fi
	done
}

if "${INSTALL}"; then
	emacs-install
elif "${CLEAN}"; then
	emacs-clean
fi
