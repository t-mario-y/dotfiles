# homebrewをzshで使用可能にする設定。homebrewインストール時に案内される内容について環境差分を吸収したもの。
# この処理の時点ではbrew --prefixは使用できないため環境判定を行う。
if [ "$(uname)" = 'Darwin' ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
