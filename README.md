# dotfiles

<https://scrapbox.io/tmarioyoshi-83818027/my_dotfiles>

## Usage

gitおよびbashが使用できる環境で実行する。

```shell script
# 最初にシンボリックリンクを張る。
cd ~/
git clone https://github.com/t-mario-y/dotfiles
cd dotfiles
bash bin/symlink.sh

# linux/WSL2: zshをインストールして、ログインシェルに設定する。
sudo apt-get install zsh
chsh -s $(which zsh)

# homebrewをセットアップする。
bash bin/install_homebrew.sh
bash bin/install_packages.sh

# gh cliによりGitHub認証を行う。
gh auth login
```

## 同期するツール群

### Alacritty

Alacritty本体は環境ごとに入れ方が異なるので手動でインストールするが、設定ファイル(`alacritty.yml`および`alacritty.common.yml`)を管理する。  
また、環境によりalacritty.local.ymlを設定する。

```shell script
# macOS/Linuxでは、シンボリックファイルで管理する。
ln -snfv ~/dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

# Windowsでは下記の手順を取る。
# - Windows側の設定フォルダに設定ファイルを丸ごと置く。
# - alacritty.ymlのimportパスを修正する。
export USER_NAME_WINDOWS=(windows user name)
cp ~/dotfiles/alacritty/alacritty.*.yml /mnt/c/Users/$USER_NAME_WINDOWS/AppData/Roaming/alacritty/
# TODO: 手動diffがしんどいので同期スクリプトを書く。
diff ~/dotfiles/alacritty/alacritty.common.yml /mnt/c/Users/$USER_NAME_WINDOWS/AppData/Roaming/alacritty/alacritty.common.yml
```

### dotfiles管理対象外のもの

GUIツールのセットアップは、macOS/Windowsの手順の差分が大きいため管理していない。

#### JetBrains IDEs

[JetBrains Toolbox](https://www.jetbrains.com/ja-jp/toolbox-app/)
setting syncはGitHubリポジトリで行う。

#### VSCode

公式の機能で設定を同期する。

#### フォント

JetBrains Mono
