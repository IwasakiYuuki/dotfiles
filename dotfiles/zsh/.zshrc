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

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

## history
zinit light zdharma/history-search-multi-word
zstyle :plugin:history-search-multi-word reset-prompt-protect 1
zstyle ":history-search-multi-word" highlight-color "fg=red,bold"

## pure
zinit light sindresorhus/pure
zstyle :prompt:pure:enviroment:user show yes

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
