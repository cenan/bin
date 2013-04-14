# common functions for shell scripts
# this file should always be named as
# $HOME/bin/common.sh

function tmux_attach_if_exists {
  tmux has-session -t $1
  if [ $? -eq 0 ]; then
    echo "Session $1 already exists, attaching..."
    sleep 1
    tmux attach -t $1
    exit 0;
  fi
}

txtred=$(tput setaf 1)
txtgreen=$(tput setaf 2)
txtyellow=$(tput setaf 3)
txtblue=$(tput setaf 4)
txtreset=$(tput sgr0)

function msg {
  if [[ -n "$SCRIPT_LOG" ]]; then
    /bin/echo `date +%T` $* | tee -a $SCRIPT_LOG
  else
    /bin/echo $*
  fi
}

function err {
  msg $txtred$*$txtreset
}

function inf {
  msg $txtgreen$*$txtreset
}

function warn {
  msg $txtyellow$*$txtreset
}

