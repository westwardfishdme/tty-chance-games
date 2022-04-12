#!/bin/bash

# GOAL: MOVE TTY-CHANCE-GAMES TO /usr/share and make it executable.
function install(){
	echo "// making tty-chance-games executable in" $PWD
	chmod +x $PWD/tty-chance-games
	echo "// copying file to /usr/bin"
	sudo cp --remove-destination $PWD/tty-chance-games /usr/bin
}

if [[ -f /usr/bin/tty-chance-games  ]]; then
	echo -e "// there is already a file named 'tty-chance-games' detected in /usr/bin \n Do you wish to overwrite this file? [y/N]"
	read input1
	if [[ $input1 == Y ]] || [[ $input1 == y ]]; then
		echo "// installing..."
		install
	elif [[ $input1 == N ]] || [[ $input1 == n ]]; then
		echo "// exiting install..."
	else 
		echo "// Unknown input, exiting install..."
	fi
else
	install
fi
