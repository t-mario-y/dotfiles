# WSL2環境の.zshrc
# clip.exe をpbcopyとして扱う
alias pbcopy='clip.exe'

function open() {
  if [ $# != 1 ]; then
    echo 'invalid argument. specify file or directory path.'
    return 1
  else
    if [ -e $1 ]; then
      cmd.exe /c start $(wslpath -w $1) 2> /dev/null
    else
      echo "open: $1 : No such file or directory"
    fi
  fi
}

# WSL2上のVSCode terminalで出る ERROR: UtilConnectToInteropServer:307 対策
# https://github.com/microsoft/WSL/issues/5065#issuecomment-682198412
fix_wsl2_interop() {
  for i in $(pstree -np -s $$ | grep -o -E '[0-9]+'); do
    if [[ -e "/run/WSL/${i}_interop" ]]; then
      export WSL_INTEROP=/run/WSL/${i}_interop
    fi
  done
}

fix_wsl2_interop
