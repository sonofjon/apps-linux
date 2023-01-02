#!/bin/bash

### Add sources
# sudo vim /etc/apt/sources.list  # TODO: do this programatically

### update

sudo apt update && sudo apt upgrade


### Applications

## Emacs

# General
sudo apt install aspell aspell-en aspell-sv
sudo apt install hunspell hunspell-sv
sudo apt install wamerican
sudo apt install wslu

# vterm
sudo apt install cmake
sudo apt install libvterm-dev

# # Linters
# sudo apt install jsonlint
# sudo apt install chktex

# sudo apt install cargo

# sudo apt install lua5.4
# sudo apt install luarocks
# luarocks config lua_version 5.4

## LaTeX

sudo apt install texlive-latex-recommended
sudo apt install texlive-latex-extra
sudo apt install texlive-fonts-extra
sudo apt install texlive-lang-european
sudo apt install texlive-luatex
# tlmgr stuff

## Other

sudo apt install ncdu
# sudo apt install ansible
# sudo apt install sshpass
sudo apt install tree

### Dev

# Node
# sudo apt install npm

# Python
# sudo apt install python3
sudo apt install python3-pip


### Source

sudo apt install build-essential

# Emacs (build)
sudo apt install libgccjit-`gcc -dumpversion`-dev
sudo apt install libtree-sitter-dev
sudo apt build-dep emacs

### System

## General

sudo apt install apt-file
sudo apt-file update

sudo apt install plocate
# sudo apt install anacron
# sudo apt install sqlite3

## Networking

sudo apt install nmap
# sudo apt install net-tools   # arp, ifconfig, netstat, rarp, nameif and route
sudo apt install traceroute
# sudo apt install inetutils-traceroute
