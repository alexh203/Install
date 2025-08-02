#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "Please run as root!"
    exit 1
fi

PROGRAMS=(
    vim
    git
    firefox
    htop
    tmux
    alacritty
    cat
)

echo "Updating repos..."
pacman -Sy --noconfirm

echo "Installing programs..."
for pkg in "${PROGRAMS[@]}";
do
    if pacman -Qi "$pkg" &> /dev/null ; then
        echo "$pkg already installed..."
    else
        echo "Installing $prog..."
        pacman -S --noconfirm "$pkg"
    fi
done

echo "Done..."
