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

bindkey -r "^N" # down-line-or-history
bindkey -r "^P" # up-line-or-history
bindkey -r "^O" # accept-line-and-down-history

# ZLE
# (want to share very long command) → echo "(want to share very long command)" | code -
function print_buffer_to_vscode() {
  if [ "$BUFFER" = "" ]; then
    return 0
  fi
  # TODO: back slash escape and write tests
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

# fzfをインストールする際に追加される。
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# asdfをインストールする際に追加される。
# TODO: macOS(homebrew)ではパスが異なる
. $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)

# navi(install manually)
export PATH="${PATH}:$HOME/.cargo/bin"
eval "$(navi widget zsh)"

# starship
eval "$(starship init zsh)"

# tmux(install manually)
export PATH="${PATH}:/.local/bin"
# tmuxのデフォルトをzshに固定する
export ZSH_PATH_FOR_TMUX="$(which zsh)"

# 環境差分の.zshrcをロードする。
if [ "$(uname)" = 'Darwin' ]; then
  source ~/dotfiles/.zsh/darwin.zsh
fi

if [ "$(uname)" = 'Linux' ] && [[ "$(uname -r)" = *microsoft* ]]; then
  source ~/dotfiles/.zsh/wsl2.zsh
fi

if [ -f ~/dotfiles/.zsh/local.zsh ]; then
  source ~/dotfiles/.zsh/local.zsh
fi

autoload -Uz compinit && compinit

