#!/usr/bin/env bash

echo "----------------------"
echo "Install c++ things ..."
echo "----------------------"
pacman -S --needed base-devel mingw-w64-x86_64-toolchain
pacman -S --needed cmake

echo "----------------------"
echo "Install vim things ..."
echo "----------------------"
pacman -S --needed vim
pacman -S --needed ctags

echo "-----------------"
echo "Install tools ..."
echo "-----------------"
pacman -S --needed git
pacman -S --needed man-pages-posix
pacman -S --needed mingw-w64-x86_64-fzf
pacman -S --needed rsync
pacman -S --needed tree
