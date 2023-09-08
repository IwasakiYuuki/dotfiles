#!/bin/bash

# ----------------------------------
# Environments
# ----------------------------------

# XDG
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_BIN_HOME=${XDG_BIN_HOME:-$HOME/.local/bin}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}

export PATH=$PATH:$XDG_BIN_HOME

mkdir -p "${XDG_CONFIG_HOME}"; chown "${SUDO_USER}" "${XDG_CONFIG_HOME}"
mkdir -p "${XDG_DATA_HOME}"; chown "${SUDO_USER}" "${XDG_DATA_HOME}"
mkdir -p "${XDG_BIN_HOME}"; chown "${SUDO_USER}" "${XDG_BIN_HOME}"
mkdir -p "${XDG_CACHE_HOME}"; chown "${SUDO_USER}" "${XDG_CACHE_HOME}"
mkdir -p "${XDG_STATE_HOME}"; chown "${SUDO_USER}" "${XDG_STATE_HOME}"

# ----------------------------------
# Utils
# ----------------------------------
spinner() {
  # Execute function
  local func=$1
  shift
  local func_args=("$@")
  local msg=${func_args[-1]}
  local tmpfile
  local err_tmpfile
  tmpfile=$(mktemp)
  err_tmpfile=$(mktemp)
  unset 'func_args[${#func_args[@]}-1]'
  (set -e; $func "${func_args[@]}" > "$tmpfile" 2>"$err_tmpfile") &
  local pid=$!
  local delay=0.1
  local spinstr="|/-\\"

  # Display spinner
  while kill -0 $pid 2>/dev/null; do
    local temp=${spinstr#?}
    local tail_logs
    tail_logs=$(tail -n 5 "$tmpfile" | sed 's/^/    /')
    printf "\r[%c] %s\n" "$spinstr" "$msg"
    printf "\e[90m%s\e[0m" "$tail_logs"
    sleep $delay
    local spinstr=$temp${spinstr%"$temp"}
    num_lines=$(echo "$tail_logs" | wc -l)
    for (( i=0; i<num_lines; i++ )); do
        printf "\r\e[K\e[1A"
    done
  done

  # Print results
  wait $pid
  local exit_status=$?
  local error_msg
  error_msg=$(sed 's/^/    /' "$err_tmpfile")
  rm -f "$tmpfile"
  rm -f "$err_tmpfile"
  printf "\r\e[K"
  if [[ $exit_status -eq '0' ]]; then
    printf "\e[36m\u2714 %s\e[0m\n" "$msg"
  else
    printf "\e[31m\u2718 %s failed\e[0m\n" "$msg"
    printf "  Error Message:\n"
    printf "%s\n" "$error_msg"
    exit 1
  fi
}

# ----------------------------------
# Requirements
# ----------------------------------
install_requirements() {
  case "$1" in
    "Ubuntu"*)
      sleep 1
      apt update && apt install -y curl wget git
      if ! command -v go &> /dev/null; then
        wget -q https://go.dev/dl/go1.20.2.linux-amd64.tar.gz -P "${HOME}"
        tar -xvf "${HOME}/go1.20.2.linux-amd64.tar.gz" -C "${HOME}"
        chown "${SUDO_USER}" "${HOME}/go"
        mv "${HOME}/go" "${XDG_DATA_HOME}/go"
        ln -s "${XDG_DATA_HOME}/go/bin/go" "${XDG_BIN_HOME}/go"
      fi
      if ! command -v ghq &> /dev/null; then
        export GOPATH="${XDG_DATA_HOME}/go"
        export GOBIN="${GOPATH}/bin"
        export GHQ_ROOT="${XDG_DATA_HOME}/ghq"
        mkdir "${XDG_DATA_HOME}/ghq" && chown "${SUDO_USER}" "${XDG_DATA_HOME}/ghq"
        go install github.com/x-motemen/ghq@install
        ln -s "${GOBIN}/ghq" "${XDG_BIN_HOME}/ghq"
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
        apt install -y zsh
        chsh -s "$(which zsh)"
      fi
      ## setting (put dotfiles and create symbolic link)
      if [ ! -d "${XDG_CONFIG_HOME}/zsh" ]; then
        ln -s "${XDG_CONFIG_HOME}/dotfiles/zsh" "${XDG_CONFIG_HOME}/zsh"
      fi
      if [ -f "${HOME}/.zshenv" ]; then
        mv "${HOME}/.zshenv" "${HOME}/.zshenv.old"
      fi
      ln -s "${XDG_CONFIG_HOME}/zsh/.zshenv" "${HOME}/.zshenv"
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
        curl -o "${HOME}/nvim.appimage" -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
        chmod u+x "${HOME}/nvim.appimage"
        (cd "${HOME}" && ./nvim.appimage --appimage-extract)
        rm "${HOME}/nvim.appimage"
        mv "${HOME}/squashfs-root" "${XDG_DATA_HOME}/squashfs-root"
        if [ ! -f "${XDG_BIN_HOME}/nvim" ]; then
          ln -s "${XDG_DATA_HOME}/squashfs-root/AppRun" "${XDG_BIN_HOME}/nvim"
        fi
      fi
      ## setting
      if [ ! -d "${XDG_CONFIG_HOME}/nvim" ]; then
        ln -s "${XDG_CONFIG_HOME}/dotfiles/nvim" "${XDG_CONFIG_HOME}/nvim"
      fi
      ;;
    *)
      echo "Unsupported OS: ${OS}"
      ;;
  esac
}

clone_repository() {
  if ghq list | grep -q IwasakiYuuki/dotfiles; then
    ghq get https://github.com/IwasakiYuuki/dotfiles.git
  else
    (cd "$(ghq list -p | grep IwasakiYuuki/dotfiles)" && git pull)
  fi
}

# Install by OS
os_name=$(uname -s)
if [ "${os_name:0:5}" == "Linux" ]; then
  if [ -f /etc/os-release ]; then
      . /etc/os-release
      OS=$NAME
  fi
  spinner install_requirements "${OS}" "install requirements (1/3)"
  spinner clone_repository "clone repository (2/4)"
  spinner install_zsh "${OS}" "install zsh (3/4)"
  spinner install_nvim "${OS}" "install nvim (4/4)"
fi
