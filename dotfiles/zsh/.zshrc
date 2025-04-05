# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# General PATH
path+=(
    "${HOME}/.local/bin"
)

# General history
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_dups

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

## history search
zinit light zdharma/history-search-multi-word
zstyle :plugin:history-search-multi-word reset-prompt-protect 1
zstyle ":history-search-multi-word" highlight-color "fg=red,bold"

# Powerline
zinit ice depth=1; zinit light romkatv/powerlevel10k
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

## vi-mode
function my_init() {
    [ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh
    fzf-cd-ghq() {
      local cmd="ghq list -p"
      setopt localoptions pipefail no_aliases 2> /dev/null
      local dir="$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore ${FZF_DEFAULT_OPTS-} ${FZF_ALT_C_OPTS-}" $(__fzfcmd) +m)"
      if [[ -z "$dir" ]]; then
        zle redisplay
        return 0
      fi
      zle push-line # Clear buffer. Auto-restored on next prompt.
      BUFFER="builtin cd -- ${(q)dir}"
      zle accept-line
      local ret=$?
      unset dir # ensure this doesn't end up appearing in prompt expansion
      zle reset-prompt
      return $ret
    }
    zle -N fzf-cd-ghq
    bindkey "^O" fzf-cd-ghq
    bindkey "^P" fzf-cd-widget
}
zvm_after_init_commands+=(my_init)
zinit light jeffreytse/zsh-vi-mode
export ZVM_VI_INSERT_ESCAPE_BINDKEY=jj

## fzf
export FZF_CTRL_T_COMMAND='ag --hidden --ignore .git -g ""'

## nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

## pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

## LLM API key
[ -s "$HOME/.llm/api_key.sh" ] && source "$HOME/.llm/api_key.sh"
