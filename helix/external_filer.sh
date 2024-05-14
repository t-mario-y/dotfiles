#!/bin/bash

fifo=$TMPDIR/tmux_fifo
tmux display-popup -xC -yC -w90% -h90% -E "nnn -p $fifo"
cat "$fifo" # | xargs -0
rm "$fifo"
