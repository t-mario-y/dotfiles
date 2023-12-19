```sh
brew install multipass

```

SSH接続のため、multipass launch時にcloud-initにより予め公開した鍵を設定する。

```sh
multipass launch \
  --cpus=6 --disk=20G --memory=16G --name=multipass-vm \
  --cloud-init ~/dotfiles/multipass/cloud-init.yaml

multipass ls
multipass info multipass-vm

multipass stop unused-vm
multipass delete unused-vm
multipass purge
```

以下の両方の方式でVMのshellを起動できることを確認し、VSCodeのRemote-SSH: Connect to Hostからリモート接続を行う。

```sh
multipass shell multipass-vm
ssh <ユーザ名、デフォルトはubuntu>@<IPv4アドレス、multipass infoで確認> -i ~/.ssh/<作成した公開鍵> -o StrictHostKeyChecking=no
```

`~/.ssh/config`の設定例は下記の通り。

```sh
Host multipass-vm
  HostName 192.168.64.4
  User ubuntu
  IdentityFile ~/.ssh/multipass-vm
  StrictHostKeyChecking no
```
