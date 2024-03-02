#!/bin/bash

##### Setup

# Edit sources
# sudo vim /etc/apt/sources.list  # TODO: do this programatically

# Update
sudo apt update && sudo apt upgrade

##### Install

#### Source

# sudo apt install build-essential

# Emacs (build)
# shellcheck disable=SC2046
# sudo apt install libgccjit-$(gcc -dumpversion)-dev
# sudo apt install libtree-sitter-dev
# sudo apt build-dep emacs

#### Applications

## Emacs

# App
sudo snap install emacs --classic

# General
sudo apt install xclip

# Spelling
sudo apt install aspell aspell-en aspell-sv
sudo apt install hunspell hunspell-sv
sudo apt install wamerican
sudo apt install wslu

# vterm
sudo apt install cmake
sudo apt install libvterm-dev

## LaTeX

# sudo apt install texlive-latex-recommended
# sudo apt install texlive-latex-extra
# sudo apt install texlive-fonts-extra
# sudo apt install texlive-lang-european
# sudo apt install texlive-luatex
# tlmgr stuff

## Other

# sudo apt install ansible
sudo apt install gdu
sudo apt install mmv
sudo apt install ncdu
sudo apt install rename
# sudo apt install sshpass
sudo apt install tree

sudo apt install ocrmypdf
sudo apt install tesseract-ocr-swe

#### Development

# Node
# sudo apt install npm

# Python
# sudo apt install python3
sudo apt install python3-pip

pip install pip-autoremove      # alternatives: pip3-autoremove,
                                # python3-pip-autoremove,
                                # only-pip3-autoremove
pip install pip-search
pip install pipdeptree          # alternaives: deptree, johnnydep, pipgrip, pip-tree
pip install --no-deps pipreqs
pip install yarg docopt         # dependecies for pipreqs

### Linters

## JSON

sudo apt install python3-demjson

## LaTex

# sudo apt install chktex

# sudo apt install cargo
# cargo install --locked --git https://github.com/latex-lsp/texlab.git

## Lua

# sudo apt install lua5.4
# sudo apt install luarocks
# luarocks config lua_version 5.4

## Python

# See setup-pyhton repo

#### System

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
