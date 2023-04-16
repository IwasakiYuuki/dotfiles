# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
#
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Env settings
export EDITOR=nvim

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# zsh-vi-mode pre settings
ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
ZVM_INIT_MODE=sourcing

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    k
    docker
    docker-compose
    zsh-vi-mode
    fzf
)
source $ZSH/oh-my-zsh.sh

# General Settings
alias zshconf='nvim ~/.zshrc' 
alias nvimconf='nvim ~/.config/nvim/init.vim' 
alias qmkkeymap='nvim /mnt/c/Users/2445y/qmk_firmware/keyboards/lily58/keymaps/IwasakiYuuki/keymap.c' 
export PATH="$HOME/.poetry/bin:$PATH"

# For Mac
export PATH=$PATH:/Applications/MAMP/Library/bin
export PATH=$HOME/.composer/vendor/bin:$PATH

# thefuck
# https://github.com/nvbn/thefuck
eval $(thefuck --alias fuck)

# fzf plugins
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fzf
export FZF_BASE=$HOME/.fzf/bin/fzf
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'
export FZF_COMPLETION_TRIGGER='**'
autoload -Uz compinit && compinit

fzf-ghq() {
    local dir
    dir="$(ghq list | $(__fzfcmd) +m)"
    zle push-line
    BUFFER="cd -- $(ghq root)/$dir"
    zle accept-line
}
zle     -N              fzf-ghq
bindkey -M  emacs '^O'  fzf-ghq
bindkey -M  vicmd '^O'  fzf-ghq
bindkey -M  viins '^O'  fzf-ghq

# Docker
export DOCKER_CONTENT_TRUST=1
export LDFLAGS="-L/opt/homebrew/opt/openblas/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openblas/include"
export LDFLAGS="-L/opt/homebrew/opt/lapack/lib"
export CPPFLAGS="-I/opt/homebrew/opt/lapack/include"
export PKG_CONFIG_PATH="/usr/local/opt/lapack/lib/pkgconfig"
export CFLAGS=-Wno-error=implicit-function-declaration
export LAPACK=/usr/local/opt/lapack/lib/liblapack.dylib
export BLAS=/usr/local/opt/openblas/lib/libopenblasp-r0.3.21.dylib

# gcp
if [ -f '/private/tmp/google-cloud-sdk/path.zsh.inc' ]; then . '/private/tmp/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/private/tmp/google-cloud-sdk/completion.zsh.inc' ]; then . '/private/tmp/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="$HOME/google-cloud-sdk/bin:$PATH"

# kubectl
source <(kubectl completion zsh)
export PATH="$HOME/bin:$PATH"

# Go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
