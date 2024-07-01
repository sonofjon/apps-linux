#!/bin/bash

# Detect the OS and set the package manager command
if [ -f /etc/debian_version ]; then
  echo "Detected Debian-based system (Ubuntu)"
  pkg_manager="apt"
  sudo apt update && sudo apt upgrade
elif [ -f /etc/fedora-release ] || [ -L /etc/fedora-release ] ; then
  echo "Detected Fedora-based system"
  pkg_manager="dnf"
  sudo dnf upgrade
else
  echo "Unsupported OS"
  exit 1
fi

declare -A PKG_MAP
PKG_MAP=(
    # Emacs - general:
    [xclip]="xclip"
    # Emacs - spelling:
    [aspell]="aspell"
    [aspell-en]="aspell-en"
    [aspell-sv]="aspell-sv"
    [hunspell]="hunspell"
    [hunspell-sv]="hunspell-sv"
    [wamerican]="deb:wamerican rpm:words"
    # Emacs - vterm:
    [wslu]="deb:wslu"  # no fedora package
    [cmake]="cmake"
    [libvterm]="deb:libvterm-dev rpm:libvterm-devel"
    # LaTeX:
    # [texlive-latex-recommended]="deb:texlive-latex-recommended"
    # [texlive-latex-extra]="deb:texlive-latex-extra"
    # [texlive-fonts-extra]="deb:texlive-fonts-extra"
    # [texlive-lang-european]="deb:texlive-lang-european"
    # [texlive-luatex]="deb:texlive-luatex"
    # Utilities:
    # [ansible]="ansible"
    [bat]="bat"
    [btop]="btop"
    [fzf]="fzf"
    [gdu]="gdu"
    [markdown]="deb:markdown rpm:perl-Text-Markdown"
    [mmv]="mmv"
    [ncdu]="ncdu"
    [rename]="deb:rename rpm:prename"
    [ripgrep]="ripgrep"
    # [sshpass]="sshpass"
    [wakeonlan]="deb:wakeonlan rpm:wol"
    # ocrmypdf:
    [ocrmypdf]="ocrmypdf"
    [tesseract]="deb:tesseract-ocr-swe rpm:tesseract-langpack-swe"
    # GUI tools:
    # [meld]="meld"
    # Development - Node:
    # [npm]="deb:npm rpm:nodejs.npm"
    # Development - Python:
    [python3-pip]="python3-pip"
    [python3-venv]="deb:python3-venv"
    # Linters:
    [shellcheck]="shellcheck"    # Bash
    [python3-demjson]="python3-demjson"   # JSON
    # [chktex]="chktex"   # LaTex  ????
    # sudo $pkg_manager install cargo
    # cargo install --locked --git https://github.com/latex-lsp/texlab.git
    [lua5.4]="apt:lua5.4"      # Lua
    [luarocks]="luarocks"      # luarocks config lua_version 5.4
    [python3-demjson]="python3-demjson"
    [shellcheck]="shellcheck"
    [libxml2]="deb:libxml2-utils rpm:libxml2"
    # System:
    [plocate]="plocate"
    # [anacron]="anacron"
    # [sqlite3]="sqlite3"
    # Networking:
    # [nmap]="nmap"
    # [net-tools]="net-tools"  # arp, ifconfig, netstat, rarp, nameif and route
    [traceroute]="traceroute"
    # [traceroute]="inetutils-traceroute"
)

install_packages() {
  for package in "${!PKG_MAP[@]}"; do
    deb_pkg=""; rpm_pkg=""
    for value in ${PKG_MAP[$package]}; do
      if [[ $value == deb:* ]]; then
        deb_pkg=${value#deb:}
      elif [[ $value == rpm:* ]]; then
        rpm_pkg=${value#rpm:}
      else
        deb_pkg=$value
        rpm_pkg=$value
      fi
    done

    if [ "$pkg_manager" = "apt" ] && [ -n "$deb_pkg" ]; then
      sudo apt install $deb_pkg
    elif [ "$pkg_manager" = "dnf" ] && [ -n "$rpm_pkg" ]; then
      sudo dnf install $rpm_pkg
    fi
  done
}

install_packages

# dasel (for emacs-pet)
# curl -sSLf "$(curl -sSLf https://api.github.com/repos/tomwright/dasel/releases/latest | grep browser_download_url | grep linux_amd64 | grep -v .gz | cut -d\" -f 4)" -L -o dasel && chmod +x dasel
# mv ./dasel $HOME/local/bin/dasel

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
