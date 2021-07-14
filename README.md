# dotfiles and more

macOSの環境構築  
開発系ツールだけをdotfilesとして、それ以外は非公開のメモで残して良い。

## dotfiles

<https://scrapbox.io/tmarioyoshi-83818027/my_dotfiles>

### zsh

`~/.zshrc`

### starship

`~/.config/starship.toml`

### Hyper

`~/.hyper.js`

## brew install

開発に必要なものだけを列挙する

```sh
brew ls
```

多い…。主にqmk周り

- awscli
- jenv
- jq
- krew
- git
- git-flow
- google-cloud-sdk
- kubernetes-cli
- minikube
- mysql-client
- nodenv
- python
- sbt
- scala
- starship
- tfenv
- tig
- tree
- watch
- yarn

```sh
brew 
ls
```

- authy
- dash
- docker
- google-cloud-sdk
- postman
- sourcetree

なくしたい
- hyper
- adoptopenjdk
- adoptopenjdk8
- qmk-toolbox


各言語(Java/Python/Node)はバージョン切り替えツールから入れるようにしたい。
- adoptopenjdk
- adoptopenjdk8

helm/bazel/bazelisk はcurlで入れている。
根拠は、公式docsにbrewで入れるガイドがないこと。(kubectlはある)

フォントは`tap`が必要

```sh
brew tap homebrew/cask-fonts
brew cask install font-ricty-diminished
```

## manually

App Storeから入れる

- BettorSnapTool
- BetterTouchTool
- Clipy
- Kinoppy
- Kindle
- The Unarchiver
- Pixelmator Pro
- slack

### IntelliJ IDEA
[JetBrains Toolbox](https://www.jetbrains.com/ja-jp/toolbox-app/)
setting syncはGitHubリポジトリで行う。

### VSCode

caskでもよさげ
setting sync

### Node.js

nodebrewでバージョン管理

```sh
npm list -g -depth=0
~/.nodebrew/node/v12.13.1/lib
├── @google/clasp@2.3.0
├── @humanmade/cf-to-tf@0.1.3
├── aws-cdk@1.19.0
├── commitizen@4.0.3
├── cz-conventional-changelog@3.0.2
├── firebase-tools@7.11.0
├── now@16.7.0
└── npm@6.13.7
```

### Java

AdoptOpenJdk  
jenvでバージョン管理  

```sh
brew cask install adoptopenjdk
brew install jenv
```

### Scala

Javaを導入後、sbtでバージョン管理

```sh
brew cask install adoptopenjdk
brew install scala
brew install sbt
```

## keyboard settings

ErgoDashを使用  
QMKでkeymapを反映させます。  
<https://github.com/t-mario-y/qmk_firmware/blob/master/keyboards/ergodash/rev1/keymaps/t-mario-y/keymap.c>

```sh
# install
git clone https://github.com/t-mario-y/qmk_firmware
cd qmk_firmware
util/qmk_install.sh

make ergodash/rev1:t-mario-y:avrdude
```

TODO：`qmk_firmware/util/macos_install.sh`で入ってくるものが多い。  

## TODO

Chrome settings(拡張機能)
