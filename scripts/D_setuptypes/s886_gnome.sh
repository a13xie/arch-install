#!/bin/bash

# Usage: ./s886_gnome.sh $_USERNAME

set -e

# Install GNOME
pacman -S --noconfirm gnome gnome-tweaks

# Install fonts
pacman -S --noconfirm --needed ttf-ubuntu-mono-nerd ttf-ubuntu-font-family ttf-ubuntu-nerd

# Enable GDM
systemctl enable gdm.service

# Install some additional programs
sudo -u $1 pikaur -S --noconfirm --needed mpv gnome-shell-extension-appindicator \
    gnome-shell-extension-caffeine gpaste gnome-shell-extension-freon-git \
    wget words

# Uninstall unneeded GNOME packages
pacman -Rns --noconfirm gnome-software totem gnome-music orca yelp gnome-user-docs
