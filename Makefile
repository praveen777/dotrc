all:
	./get.sh
install_brew:
	which brew >&/dev/null || /usr/bin/ruby -e "`curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install`"
dump_brew: install_brew
	brew bundle dump --force
sync_brew: install_brew
	brew bundle install
