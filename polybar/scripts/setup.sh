#!/usr/bin/env bash

# Install script for polybar themes

# Dirs
DIR=`pwd`
FDIR="$HOME/.local/share/fonts"

# Install Fonts
install_fonts() {
	echo -e "\n[*] Installing fonts..."
	if [[ -d "$FDIR" ]]; then
		cp -rf $DIR/fonts/* "$FDIR"
	else
		mkdir -p "$FDIR"
		cp -rf $DIR/fonts/* "$FDIR"
	fi
}
