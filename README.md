# dotfiles

## Usage

### Initial setup

gitおよびbashが使用できる環境で実行する。

```shell script
cd && git clone https://github.com/t-mario-y/dotfiles && cd dotfiles
bin/symlink.sh

# linux/WSL2: zshをインストールして、ログインシェルに設定する。
sudo apt-get install zsh
chsh -s $(which zsh)

# パッケージインストール
bin/install_homebrew.sh && bin/install_packages.sh && bin/symlink.sh

# GitHub CLIにより認証する。
gh auth login
```

### Continuous update

```shell script
cd ~/dotfiles && bin/install_packages.sh && bin/symlink.sh && cd -
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
