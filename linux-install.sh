#!/bin/bash

### Setup

if [ -f /etc/debian_version ]; then
  echo "Detected Debian-based system"
  pkg_manager="apt"
  sudo apt update && sudo apt upgrade
elif [ -f /etc/fedora-release ] || [ -L /etc/fedora-release ] ; then
  echo "Detected Fedora-based system"
  pkg_manager="dnf"
  sudo dnf upgrade
  sudo dnf copr enable faramirza/gdu
else
  echo "Unsupported OS"
  exit 1
fi

### Packages

declare -A PKG_MAP
PKG_MAP=(
    # Emacs
    [emacs]="rpm:emacs"                         # ubuntu: see distro specific
    # [xclip]="xclip"                           # X11
    [wl-clipboard]="wl-clipboard"               # Wayland
    [wslu]="deb:wslu"                           # WSL only
    # Emacs - spelling:
    [aspell]="aspell"
    [aspell-en]="aspell-en"
    [aspell-sv]="aspell-sv"
    [hunspell]="hunspell"
    [hunspell-sv]="hunspell-sv"
    [dictionary]="deb:wamerican rpm:words"
    # Emacs - vterm:
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
    [gdu]="gdu"                                 # fedora: copr faramirza/gdu
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
    [python3-venv]="deb:python3-venv"           # fedora: already installed
    # Linters:
    [shellcheck]="shellcheck"                   # Bash
    [python3-demjson]="python3-demjson"         # JSON
    # [chktex]="chktex"                         # LaTex
    # [lua5.4]="deb:lua5.4"                     # Lua
    [luarocks]="luarocks"   # ubuntu: luarocks config lua_version 5.4
    [libxml2]="deb:libxml2-utils rpm:libxml2"   # XML
    # System:
    [plocate]="plocate"
    # [anacron]="anacron"
    # [sqlite3]="sqlite3"
    # Networking:
    # [nmap]="nmap"
    # [net-tools]="net-tools"                   # arp, ifconfig, netstat, rarp,
                                                # nameif and route
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

### Unpackaged 

# dasel (for emacs-pet)
# curl -sSLf "$(curl -sSLf https://api.github.com/repos/tomwright/dasel/releases/latest | grep browser_download_url | grep linux_amd64 | grep -v .gz | cut -d\" -f 4)" -L -o dasel && chmod +x dasel
# mv ./dasel $HOME/local/bin/dasel

# texlab (LaTex linter)
# sudo $pkg_manager install cargo
# cargo install --locked --git https://github.com/latex-lsp/texlab.git

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

    # Snaps
    sudo snap install emacs --classic
fi
