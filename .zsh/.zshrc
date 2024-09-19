# dotfilesで管理する ~/.zshrc(homebrewに依存しない)

setopt ignore_eof
setopt no_flow_control

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=100000
HISTORY_IGNORE="(pwd|exit)"
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space

alias ls='ls -GF'

export LC_ALL=en_US.UTF-8

# asdf
. $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)

# https://cli.github.com/manual/gh_completion
# does not work in zsh on Ubuntu via ssh
fpath=(~/gh_cli_completions $fpath)

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# OS specific config
if [ "$(uname)" = 'Darwin' ]; then
  source ~/dotfiles/.zsh/darwin.zsh
fi

if [ "$(uname)" = 'Linux' ] && [[ "$(uname -r)" = *microsoft* ]]; then
  source ~/dotfiles/.zsh/wsl2.zsh
fi

alias batman="~/ghq/github.com/eth-p/bat-extras/src/batman.sh"

if [ -f ~/dotfiles/.zsh/local.zsh ]; then
  source ~/dotfiles/.zsh/local.zsh
fi

alias lzg='lazygit'
alias lzd='lazydocker'

bindkey -r "^N" # down-line-or-history
bindkey -r "^P" # up-line-or-history
bindkey -r "^O" # accept-line-and-down-history

# ZLE
# (want to share very long command) → echo "(want to share very long command)" | code -
function print_buffer_to_vscode() {
  if [ "$BUFFER" = "" ]; then
    return 0
  fi
  # TODO: back slash escape
  BUFFER=$(echo $BUFFER | node -e '
    const input = fs.readFileSync("/dev/stdin", "utf-8")
      .replace(/"/g, `\\"`)
      .replace(/!/g, "\\!")
      .replace(/`/g, "\\`");
    console.log(input);'
  )
  BUFFER=" echo \"$BUFFER\" | code -"
  zle accept-line
}

zle -N print_buffer_to_vscode
bindkey "^O" print_buffer_to_vscode

# (command) → command | code -
function open_result_to_vscode() {
  if [ "$BUFFER" = "" ]; then
    return 0
  fi
  BUFFER=" $BUFFER | code -"
  zle accept-line
}

zle -N open_result_to_vscode
bindkey "^N" open_result_to_vscode

# OSC 52 based copy
function tclip(){
  if [ $# -eq 0 ]; then
    printf "\e]52;c;%s\a" "$(base64 -w 0)"
  else
    printf "\e]52;c;%s\a" "$(printf "%s" "$*" | base64 -w 0)"
  fi
}

# custom commands path
export PATH="${PATH}:$HOME/.local/bin"

# navi (installed by cargo)
if type navi > /dev/null 2>&1; then
  eval "$(navi widget zsh)"
fi

# starship
if type starship > /dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# see also ~/.tmux/.tmux.conf
# export ZSH_PATH_FOR_TMUX="$(which zsh)"

# helix editor
export EDITOR=hx

# deno
export PATH="$PATH:$HOME/.deno/bin"

autoload -Uz compinit && compinit
