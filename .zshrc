# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
export CLICOLOR=1;
export LSCOLORS=gxfxcxdxbxegedabagacad;
export LS_COLORS="di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43:"
export EDITOR="vim"

# 色を使用
autoload -Uz colors
colors

autoload -Uz compinit
compinit
zstyle ':completion:*:default' list-colors ${(s.:.)LSCOLORS}
# End of lines configured by zsh-newuser-install

# Ctl-sの無効化
if [[ -t 0 ]]; then
  stty stop undef
  stty start undef
fi

# ZSHのプロンプト設定
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit

PURE_PROMPT_SYMBOL='➢'
zstyle ':prompt:pure:prompt:*' color cyan

prompt pure

export PATH=$PATH:/home/yuuki/.local/bin

# GoのPATH設定
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# PECOの設定
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src
############
# エイリアス
############
# 画面のクリアのエイリアス
alias cl=clear
# PECOを使ったGithubへのジャンプ
alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
# 便利関係
alias ll='ls -la --color'
# tmuxinatorのエイリアス
alias tm='tmuxinator'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/yuuki/google-cloud-sdk/path.zsh.inc' ]; then . '/home/yuuki/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/yuuki/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/yuuki/google-cloud-sdk/completion.zsh.inc'; fi

export GOOGLE_CLOUD_KEYFILE_JSON=account.json
export GOOGLE_APPLICATION_CREDENTIALS=$GOOGLE_CLOUD_KEYFILE_JSON

if [[ ! -n $TMUX ]]; then
	tm shell-default -n shell
fi
