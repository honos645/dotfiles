#!/bin/bash

TOP_DIR=$(cd $(dirname ${0}); pwd)
MODULE_DIR=${TOP_DIR}/modules
SOURCE_DIR=${TOP_DIR}/src

TOP_BACKUP_DIR=${HOME}/.dotfiles.backup
TODAY=$(date '+%Y-%m-%d')
BACKUP_DIR=${TOP_BACKUP_DIR}/${TODAY}

INSTALL=false
CLEAN=false

# link dotfiles directory
if [ ! -L ${HOME}/.dotfiles ]; then
	command ln -sf ${TOP_DIR}/ ${HOME}/.dotfiles
fi

# create backup directory
if [ ! -d ${HOME}/.dotfiles.backup ]; then
	command mkdir -p ${HOME}/.dotfiles.backup
fi

# install target
if [ ${1} == "install" ]; then
	INSTALL=true
	CLEAN=false
elif [ ${1} == "clean" ]; then
	INSTALL=false
	CLEAN=true
fi

if [ ${2} == "all" ]; then
	INPUT=""$(find ${TOP_DIR} -name *.conf.sh)
	for SOURCE in ${INPUT}
	do
		if [ ! -z ${SOURCE} ]; then
			echo -e "Yes Targets ${SOURCE}"
			command . ${SOURCE}
		else
			echo -e "No Targets ${SOURCE}"
		fi 
	done
	command rm -f ${HOME}/.dotfiles
else
	for SOURCE in ${@:2}
	do
		INPUT=""$(find ${TOP_DIR} -name ${SOURCE}.conf.sh)
		if [ ! -z ${INPUT} ]; then
			echo -e "Yes Targets ${SOURCE}"
			command . ${INPUT}
		else
			echo -e "No Targets ${SOURCE}"
		fi
	done
fi

