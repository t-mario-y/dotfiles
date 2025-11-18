# macOS共通の.zshrc
# iTerm
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if [ "$(uname -p)" = 'arm' ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

alias base64='gbase64'
alias awk='gawk'
alias sed='gsed'
PATH="$(brew --prefix grep)/libexec/gnubin:$PATH" # ggrep for grep

# homebrewでinstallしたパッケージのcompletionを設定する。
# 参考: https://docs.brew.sh/Shell-Completion
if type brew > /dev/null 2>&1; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi
