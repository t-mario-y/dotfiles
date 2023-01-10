# macOS共通の.zshrc
# iTerm
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if [ "$(uname -p)" = 'arm' ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
