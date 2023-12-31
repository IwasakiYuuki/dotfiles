export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_DATE_HOME=${XDG_DATE_HOME:-$HOME/.local/share}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}

export HISTFILE=${XDG_STATE_HOME}/zsh/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000

# Go
export GOBIN=${HOME}/.local/bin
export GOPATH=${XDG_DATE_HOME}/go

export ZDOTDIR=${XDG_CONFIG_HOME}/zsh
