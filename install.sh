#!/bin/bash

# ----------------------------------
# Environments
# ----------------------------------

# XDG
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}

mkdir -p ${XDG_CONFIG_HOME}
mkdir -p ${XDG_DATA_HOME}
mkdir -p ${XDG_CACHE_HOME}
mkdir -p ${XDG_STATE_HOME}

# ----------------------------------
# Requirements
# ----------------------------------
install_requirements() {
  case "$1" in
    "Ubuntu"*)
      sudo apt update
      if ! command -v curl &> /dev/null && ! command -v wget &> /dev/null ; then
        echo "[INFO] install curl"
        sudo apt install -y curl
      fi
      if ! command -v git &> /dev/null; then
        echo "[INFO] install git"
        sudo apt install -y git
      fi
      ;;
    *)
      echo "Unsupported OS: ${OS}"
      ;;
  esac
}

# ----------------------------------
# Zsh
# ----------------------------------
install_zsh() {
  case "$1" in
    "Ubuntu"*)
      # zsh
      ## install
      if ! command -v zsh &> /dev/null; then
        echo "[INFO] install and change default shell to zsh"
        sudo apt install -y zsh
        chsh -s $(which zsh)
      fi
      ## setting (put dotfiles and create symbolic link)
      if [ ! -d ${XDG_CONFIG_HOME}/zsh ]; then
        ln -s ${XDG_CONFIG_HOME}/dotfiles/zsh ${XDG_CONFIG_HOME}/zsh
      fi
      if [ -f ${HOME}/.zshenv ]; then
        mv ${HOME}/.zshenv ${HOME}/.zshenv.old
      fi
      ln -s ${XDG_CONFIG_HOME}/zsh/.zshenv ${HOME}/.zshenv
      source ${HOME}/.zshenv
      ## zinit
      bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
      ;;
    *)
      echo "Unsupported OS: ${OS}"
      ;;
  esac
}

# ----------------------------------
# Nvim
# ----------------------------------
install_nvim() {
  case "$1" in
    "Ubuntu"*)
      # nvim
      ## manual install (latest)
      if ! command -v nvim &> /dev/null; then
        curl -o ${HOME}/nvim.appimage -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
        sudo chmod u+x ${HOME}/nvim.appimage
        (cd ${HOME} && ./nvim.appimage --appimage-extract)
        rm ${HOME}/nvim.appimage
        sudo mv ${HOME}/squashfs-root ${XDG_DATA_HOME}/squashfs-root
        mkdir -p ${HOME}/.local/bin
        if [ ! -f ${HOME}/.local/bin/nvim ]; then
          ln -s ${XDG_DATA_HOME}/squashfs-root/AppRun ${HOME}/.local/bin/nvim
        fi
      fi
      ## setting
      if [ ! -d ${XDG_CONFIG_HOME}/nvim ]; then
        ln -s ${XDG_CONFIG_HOME}/dotfiles/nvim ${XDG_CONFIG_HOME}/nvim
      fi
      ;;
    *)
      echo "Unsupported OS: ${OS}"
      ;;
  esac
}

# Install by OS
if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  if [ -f /etc/os-release ]; then
      . /etc/os-release
      OS=$NAME
  fi
  install_requirements ${OS}
  ## clone dotfiles repository
  if [ ! -d ${XDG_CONFIG_HOME}/dotfiles ]; then
    git clone https://github.com/IwasakiYuuki/dotfiles.git ${XDG_CONFIG_HOME}/dotfiles
  fi
  install_zsh ${OS}
  install_nvim ${OS}
fi

