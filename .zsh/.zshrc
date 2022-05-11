# dotfilesで管理する ~/.zshrc
autoload -Uz compinit
compinit

setopt IGNOREEOF
setopt no_flow_control
setopt share_history
setopt histignorealldups
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

alias ls='ls -GF'
alias d='docker'
alias dc='docker-compose'
alias tf='terraform'
alias ghq-cd='ghq get --look $(ghq list | fzf-tmux -p 60%,40%)'
alias git-switch-local='git branch | fzf-tmux -p | xargs git switch'

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

# homebrewでインストールしたGitを使用するため、PATHに追加する。
# TODO: バージョンを決め打ちしている。
export PATH=$(brew --prefix)/Cellar/git/2.36.0/bin:$PATH

# brew install で入ったgrep(ggrep)をgrepとして使う。
# brew info grep の結果をPATHに追加する。
# 参考: https://www.rasukarusan.com/entry/2019/04/06/001947
export PATH=$(brew --prefix grep)/libexec/gnubin:$PATH

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
