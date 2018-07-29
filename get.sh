#!/bin/bash
set -eu
set -o pipefail

cleanup() {
  log "Exiting"
}

trap cleanup SIGINT EXIT SIGHUP

update_time() {
  NOW=$(date +"%m-%d-%Y %H:%M:%S")
}

die() {
  update_time
  if [ -t 0 ] ; then
    echo  "${NOW}":$'\e[31mDIED\e[0m'": $*"  >&2
  else
    echo  "${NOW}:DIED: $*"  >&2
  fi
  exit 1
}

log() {
  update_time
  echo "${NOW}:INFO: $*"
}

usage() {
  echo
}

install_vimrc() {
	if [ -d ~/dotrc ]; then
      mv ~/dotrc ~/dotrc.old
	  log "backed up ~/dotrc to ~/dotrc.old"
    fi
	git clone https://github.com/lrfurtado/dotrc.git ~/dotrc 
	if [ -f ~/.vimrc ]; then
      mv ~/.vimrc ~/.vimrc.old
	  log "backed up ~/.vimrc to ~/.vimrc.old"
    fi
	if [ -d ~/.vim ]; then
	  mv ~/.vim ~/.vim.old
	  log "backed up ~/.vim to ~/.vim.old"
    fi

	ln -s ~/dotrc/vimrc ~/.vimrc
	mkdir ~/.vim
	ln -s ~/dotrc/MyUltiSnips ~/.vim/MyUltiSnips
	log "installed vim files "

	curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/0.8.0/plug.vim

	vim -c ":PlugInstall | q | q"
}

main() {
  while getopts ":h" opt; do
    case ${opt} in
      h )
        usage
       ;;
      \? )
        echo "Invalid Option: -$OPTARG" 1>&2
        exit 1
        ;;
    esac
  done
  shift $((OPTIND -1))
  install_vimrc
}

main "$@"


