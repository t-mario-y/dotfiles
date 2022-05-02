# Created by newuser for 5.8
# ~/.zshrc
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
alias ghq-cd='ghq get --look $(ghq list | fzf)'

# starship
eval "$(starship init zsh)"

# fzf brewでインストールした時に追加された
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# asdfの補完scriptだが、うまく動いていない?
. /home/linuxbrew/.linuxbrew/opt/asdf/libexec/asdf.sh

# WSL2環境に用意されたclip.exe をpbcopyとして扱う
alias pbcopy='clip.exe'

# WSL2で動くUbuntuのhomebrewで入れたGitのパスを参照する。
export PATH=/home/linuxbrew/.linuxbrew/Cellar/git/2.36.0/bin:$PATH
