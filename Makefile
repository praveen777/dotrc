all:
	./get.sh
brew:
	rm -f Brewfile
	brew bundle dump
