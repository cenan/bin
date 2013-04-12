txtred=$(tput setaf 1)
txtgreen=$(tput setaf 2)
txtyellow=$(tput setaf 3)
txtblue=$(tput setaf 4)
txtreset=$(tput sgr0)

function msg {
  if [[ -n "$SCRIPT_LOG" ]]; then
    /bin/echo `date +%T` $* | tee -a backup.log
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

