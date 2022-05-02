# dotfiles

<https://scrapbox.io/tmarioyoshi-83818027/my_dotfiles>

## Usage

gitおよびbashが使用できる環境で実行する。

```shell script
# 最初にシンボリックリンクを貼っておく。
cd ~/
git clone https://github.com/t-mario-y/dotfiles
cd dotfiles
bash bin/symlink.sh

# zshをインストールして、ログインシェルに設定する。
sudo apt-get install zsh
chsh -s $(which zsh)

# zshを起動してhomebrewでツール群をインストールする
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

brew upgrade
brew bundle install --file=~/dotfiles/Brewfile
brew cleanup

# gh cliによりGitHub認証
gh auth login
```

## 同期するツール群

### zsh

- ~/.zshrc
- ~/.zsh_history

分離のアイデア

alias
function
toolが自動的に書き込んでくる情報

### Starship

`~/.config/starship.toml`  
Nerd fontを使わないことによる一部文字の置き換え

### Alacritty

Alacritty本体は環境ごとに入れ方が異なるので手動でインストールするが、設定ファイル`alacritty.yaml`を管理する。

### Homebrew

`Brewfile`を使ってbrew bundleする。

### git

`.gitconfig`

### (TODO) lazygit

`~/.config/lazygit/config.yml` に設定ファイルがある。今のところ凝った設定はしていないがgit-deltaを使いたいと思ったときに同期する。

### 手動でインストールが必要

接続元であるmacOS/Windowsの環境差分は吸収していない。

#### IntelliJ IDEA
[JetBrains Toolbox](https://www.jetbrains.com/ja-jp/toolbox-app/)
setting syncはGitHubリポジトリで行う。

#### VSCode

公式の機能で設定を同期する。

#### フォント

JetBrains Mono
macOSはcaskが使える。
