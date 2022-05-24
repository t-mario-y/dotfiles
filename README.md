# dotfiles

## Usage

gitおよびbashが使用できる環境で実行する。

```shell script
# 最初にシンボリックリンクを張る。
cd ~/
git clone https://github.com/t-mario-y/dotfiles
cd dotfiles
bin/symlink.sh

# linux/WSL2: zshをインストールして、ログインシェルに設定する。
sudo apt-get install zsh
chsh -s $(which zsh)

# homebrewをセットアップする。
bin/install_homebrew.sh
bin/install_packages.sh

# gh cliによりGitHub認証を行う。
gh auth login
```

## dotfiles管理対象外のもの

構築手順がプラットフォームごとに異なるものは、手動でインストールを行う。

### JetBrains IDEs

- [JetBrains Toolbox](https://www.jetbrains.com/ja-jp/toolbox-app/)
- [Share settings through a settings repository](https://www.jetbrains.com/help/idea/sharing-your-ide-settings.html#settings-repository)

### VSCode

<https://code.visualstudio.com/>

### フォント

[JetBrains Mono](https://github.com/JetBrains/JetBrainsMono)
