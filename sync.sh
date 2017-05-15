#!/usr/bin/env bash -e

# Simple script to sync my config files of interest from local machine to Git
# Expects to be called from the root of the rc repo

declare -a dotfiles=(
    "$HOME/.bash_profile"
    "$HOME/.bashrc"
    "$HOME/.spacemacs"
    "$HOME/.vimrc"
)

for file in "${dotfiles[@]}"
do
    cp $file .
done

# Custom git sync function that is expected to be in sourced .bashrc
source .bashrc
gas
