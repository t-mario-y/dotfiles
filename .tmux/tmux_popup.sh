#!/bin/sh

width=${2:-60%}
height=${2:-60%}
if [ "$(tmux display-message -p -F "#{session_name}")" = "popup" ];then
  tmux detach-client
else
  tmux popup -d '#{pane_current_path}' -xC -yC -w"$width" -h"$height" -E "tmux attach-session -t popup || tmux new-session -s popup"
fi
