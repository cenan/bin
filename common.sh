# common functions for shell scripts
# this file should always be named as
# $HOME/bin/common.sh

declare -a on_exit_items

function on_exit()
{
  for i in "${on_exit_items[@]}"
  do
    eval $i
  done
}

function add_on_exit()
{
  local n=${#on_exit_items[*]}
  on_exit_items[$n]="$*"
  if [[ $n -eq 0 ]]; then
    trap on_exit EXIT
  fi
}

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

