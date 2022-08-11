# dotfilesで管理する ~/.zshrc
# TODO: quit homebrew dependency on common .zshrc
autoload -Uz compinit
compinit

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
alias dc='docker-compose'
alias tf='terraform'

# starship
eval "$(starship init zsh)"

# fzfをインストールする際に追加される。
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# asdfをインストールする際に追加される。
. $(brew --prefix asdf)/libexec/asdf.sh

# homebrewでinstallしたパッケージのcompletionを設定する。
# 参考: https://docs.brew.sh/Shell-Completion
if type brew > /dev/null 2>&1; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

export LC_ALL=en_US.UTF-8

# homebrewでインストールしたGitを使用するため、PATHに追加する。
# TODO: バージョンを決め打ちしている。
export PATH=$(brew --prefix)/Cellar/git/2.36.0/bin:$PATH

source <(kubectl completion zsh)
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

eval "$(navi widget zsh)"

# 環境差分の.zshrcを読み込む
if [ "$(uname)" = 'Darwin' ]; then
  source ~/dotfiles/.zsh/darwin.zsh
fi

if [ "$(uname)" = 'Linux' ] && [[ "$(uname -r)" = *microsoft* ]]; then
  source ~/dotfiles/.zsh/wsl2.zsh
fi

# git管理しない.zshrcを読み込む
if [ -f ~/dotfiles/.zsh/local.zsh ]; then
  source ~/dotfiles/.zsh/local.zsh
fi

bindkey -r "^N" # down-line-or-history
bindkey -r "^P" # up-line-or-history

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
bindkey "^P" print_buffer_to_vscode

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
