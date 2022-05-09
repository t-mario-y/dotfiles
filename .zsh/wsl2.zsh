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
