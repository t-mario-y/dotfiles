# dotfiles

## Usage

### Initial setup

gitおよびbashが使用できる環境で実行する。

```shell script
cd && git clone https://github.com/t-mario-y/dotfiles && cd dotfiles
scripts/symlink.sh

# linux/WSL2: zshをインストールして、ログインシェルに設定する。
sudo apt-get install zsh
chsh -s $(which zsh)

# パッケージインストール
scripts/install_homebrew.sh && scripts/install_packages.sh && scripts/symlink.sh
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

### Docker

都度、公式のinstall手順(<https://docs.docker.com/engine/install/>)を参照する。

non-root userで実行する際には、下記を実行する。

```shell script
sudo usermod -aG docker "$(whoami)"
```
