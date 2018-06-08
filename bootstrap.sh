#!/usr/bin/env bash

cd "${0:a:h}";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		--exclude "LICENSE" \
		--exclude "README.md" \
		--exclude "Quiver-settings.json" \
		--exclude "com.googlecode.iterm2.plist" \
		--exclude ".oh-my-zsh" \
		-avh --no-perms . ~;
	source ~/.zshrc;
}

if [ "$1" = "--force" -o "$1" = "-f" ]; then
	doIt;
else
	read -q "REPLY?This may overwrite existing files in your home directory. Are you sure? (y/n) ";
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;

cd -

