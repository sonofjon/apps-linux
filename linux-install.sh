#!/bin/bash

# Detect the OS and set the package manager command
if [ -f /etc/debian_version ]; then
  echo "Detected Debian-based system (Ubuntu)"
  PKG_MANAGER="apt"
  sudo apt update && sudo apt upgrade
elif [ -f /etc/fedora-release ]; then
  echo "Detected Fedora-based system"
  PKG_MANAGER="dnf"
  sudo dnf upgrade
else
  echo "Unsupported OS"
  exit 1
fi

### Applications

## Emacs

# General
sudo $PKG_MANAGER install xclip

# Spelling
sudo $PKG_MANAGER install aspell aspell-en aspell-sv
sudo $PKG_MANAGER install hunspell hunspell-sv
sudo $PKG_MANAGER install wamerican # no fedora package
sudo $PKG_MANAGER install wslu # no fedora package

# vterm
sudo $PKG_MANAGER install cmake
sudo $PKG_MANAGER install libvterm-dev # no fedora package

# dasel (for emacs-pet)
# curl -sSLf "$(curl -sSLf https://api.github.com/repos/tomwright/dasel/releases/latest | grep browser_download_url | grep linux_amd64 | grep -v .gz | cut -d\" -f 4)" -L -o dasel && chmod +x dasel
# mv ./dasel $HOME/local/bin/dasel

## LaTeX

# sudo $PKG_MANAGER install texlive-latex-recommended
# sudo $PKG_MANAGER install texlive-latex-extra
# sudo $PKG_MANAGER install texlive-fonts-extra
# sudo $PKG_MANAGER install texlive-lang-european
# sudo $PKG_MANAGER install texlive-luatex
# tlmgr stuff

## Terminal utilities

# sudo $PKG_MANAGER install ansible
sudo $PKG_MANAGER install bat
sudo $PKG_MANAGER install btop
sudo $PKG_MANAGER install fzf
sudo $PKG_MANAGER install gdu # no fedora package
sudo $PKG_MANAGER install markdown # no fedora package
sudo $PKG_MANAGER install mmv
sudo $PKG_MANAGER install ncdu
sudo $PKG_MANAGER install rename # no fedora package
sudo $PKG_MANAGER install ripgrep
# sudo $PKG_MANAGER install sshpass
sudo $PKG_MANAGER install tree
sudo $PKG_MANAGER install wakeonlan # no fedora package

# ocrmypdf
sudo $PKG_MANAGER install ocrmypdf
sudo $PKG_MANAGER install tesseract-ocr-swe # no fedora package

## GUI tools

# sudo $PKG_MANAGER install meld

### Development

## Node
# sudo $PKG_MANAGER install npm

## Python
# sudo $PKG_MANAGER install python3
sudo $PKG_MANAGER install python3-pip
sudo $PKG_MANAGER install python3-venv # no fedora package

## Linters

# Bash

sudo $PKG_MANAGER install shellcheck

# JSON

sudo $PKG_MANAGER install python3-demjson

# LaTex

# sudo $PKG_MANAGER install chktex

# sudo $PKG_MANAGER install cargo
# cargo install --locked --git https://github.com/latex-lsp/texlab.git

# Lua

# sudo $PKG_MANAGER install lua5.4
# sudo $PKG_MANAGER install luarocks
# luarocks config lua_version 5.4

# Python
#   See setup-python repo

# XML

sudo $PKG_MANAGER install libxml2-utils   # xmllint # no fedora package

### System

## General

sudo $PKG_MANAGER install plocate
# sudo $PKG_MANAGER install anacron
# sudo $PKG_MANAGER install sqlite3

## Networking

sudo $PKG_MANAGER install nmap
# sudo $PKG_MANAGER install net-tools   # arp, ifconfig, netstat, rarp, nameif and route
sudo $PKG_MANAGER install traceroute
# sudo $PKG_MANAGER install inetutils-traceroute

### Distro specific

## Ubuntu

if [ -f /etc/debian_version ]; then
    sudo apt install apt-file
    sudo apt-file update

    # sudo apt install build-essential

    # Emacs (build)
    # shellcheck disable=SC2046
    # sudo apt install libgccjit-$(gcc -dumpversion)-dev
    # sudo apt install libtree-sitter-dev
    # sudo apt build-dep emacs

    # App
    sudo snap install emacs --classic
fi

