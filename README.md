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

多い。。主にavr-cc

- awscli
- jenv
- krew
- git
- git-flow
- kubernetes-cli
- minikube
- nodebrew
- python
- sbt
- scala
- starship
- tfenv
- tig
- yarn

```sh
brew cask ls
```

TODO: caskで良いものをcaskで入れ直す
Kalabiner と Discord ?

- adoptopenjdk
- adoptopenjdk8
- google-cloud-sdk
- hyper
- postman
- qmk-toolbox
- sequel-pro
- sourcetree

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

brew caskでadoptOpenJdk
jenvでバージョン管理

### Scala

WIP
