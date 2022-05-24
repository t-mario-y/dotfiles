# Alacritty

環境ごとに入れ方が異なるので手動でインストールするが、設定ファイル(`alacritty.yml`および`alacritty.common.yml`)を管理する。  
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
