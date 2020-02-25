#!/usr/bin/env bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install Bash 4.
# https://argcomplete.readthedocs.org/en/latest/#global-completion
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget`
brew install wget

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install other useful binaries.
brew install ack
brew install git
brew install ssh-copy-id
brew install tree

#To stop Compile C errors
brew install gcc

brew install caskroom/cask/brew-cask

#Install applocation via cask
# Apps
#java 8 is installed below
brew tap adoptopenjdk/openjdk
#java 6 may be needed for SQLDeveloper installed seperately
apps=(
	adoptopenjdk8
	atom
	appcleaner
	alfred
	aerial
	chicken
	caffeine
	disk-inventory-x
	dropbox
	firefox
	google-chrome
	gitup
	handbrake
	iterm2
	opera
	skype
	sonos
	spectacle
	slack
	sts
	sublime-text
	textmate
	vlc
	vagrant
	vagrant-manager
	virtualbox
	whatsapp
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

brew tap homebrew/cask-fonts                    # you only have to do this once!

# fonts
fonts=(
  font-clear-sans
  font-roboto
  font-inconsolata
)

# install fonts
echo "installing fonts..."
brew cask install ${fonts[@]}

# Remove outdated versions from the cellar.
brew cleanup
