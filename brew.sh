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
brew install vim
brew install jenv
brew install grep
brew install openssh
brew install screen
brew install php

# Install other useful binaries.
brew install ack
brew install git
brew install ssh-copy-id
brew install tree

#Ruby Development: RVM
# All macOS systems include a copy of Ruby, but it is outdated. To maintain current and clean Ruby environments, use the RVM system.
# RVM relies on Git, so you must have a working installation of Git before you can set up RVM.
# By default, RVM downloads copies of Ruby that have been compiled for your operating system. If there is no compiled version, RVM then falls back to downloading the source code and then compiling it on your computer. Enter this command to ensure that the requirements for compiling Ruby are on your system, using Homebrew:
brew install autoconf automake gdbm gmp libksba libtool libyaml openssl pkg-config readline

#To stop Compile C errors
brew install gcc

#Install applications via cask
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
	spectacle
	slack
	springtoolsuite
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
brew cask install ${apps[@]}

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
