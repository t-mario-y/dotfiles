# dotfiles

## Usage

### Initial setup

gitおよびbashが必要。別途、zshをログインシェルに設定する。

```shell script
cd && git clone https://github.com/t-mario-y/dotfiles && cd dotfiles
scripts/symlink.sh

scripts/install_initial_(OS specific).sh
scripts/install_packages_common.sh
scripts/install_packages_(OS specific).sh
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
[JetBrainsMono Nerd Font](https://github.com/Homebrew/homebrew-cask-fonts/blob/master/Casks/font-jetbrains-mono-nerd-font.rb)

### Docker

都度、公式のinstall手順(<https://docs.docker.com/engine/install/>)を参照する。

non-root userで実行する際には、下記を実行する。

```shell script
sudo usermod -aG docker "$(whoami)"
```
