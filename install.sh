#!/usr/bin/bash

#sudo apt install && sudo pat upgrade -y
#sudo apt install build-essential
#type brew > /dev/null 2>&1 ||/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

function mkdir_backup() {
	if [ ! -d "$HOME/.dotfile.backup" ]; then
		command echo "$HOME/.dotfile.backup not found. Auto Make it"
		command mkdir "$HOME/.dotfile.backup"
	fi
}

function link_to_homedir() {
	local SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

	if [[ "$HOME" != "$SCRIPT_DIR" ]]; then
		for f in $SCRIPT_DIR/.??*; do

		case "`basename $f`" in
			.git|.git.local) continue ;;
			*) ;;
		esac

			if [[ -L "$HOME/`basename $f`" ]]; then
				command rm -f "$HOME/`basename $f`"
			fi
			if [[ -e "$HOME/`basename $f`" ]]; then
				command mv "$HOME/`basename $f`" "$HOME/.dotfile.backup"
			fi
			command ln -snf $f $HOME
		done
	else
		command echo "same install src dest"
	fi
}

mkdir_backup
link_to_homedir
echo "end"
source ~/.bash_profile
