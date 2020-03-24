# dotfiles and more

macOSの環境構築

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
- krew
- git
- git-flow
- kubernetes-cli
- minikube
- mysql-client
- nodebrew
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
brew cask ls
```

TODO: caskで良いものをcaskで入れ直す
Kalabiner と Discord ?

- adoptopenjdk
- adoptopenjdk8
- dash
- docker
- font-ricty-diminished
- google-cloud-sdk
- hyper
- postman
- qmk-toolbox
- sequel-pro
- sourcetree

sequel-proは職場PCでやたらと落ちたので消した。
MySQLクライアントほしい。

graphiqlは学習用に入れたが、使い勝手にはときめいてない。  
intellij-idea-ceはcaskでも入るが、公式の方法ではないです。

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

### IntelliJ IDEA CE

toolbeltで入れる caskでも良い
setting sync

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

### Karabiner-Elements

WIP setting.jsonの引き回し

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
