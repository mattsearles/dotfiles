#!/usr/bin/env bash

ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# https://argcomplete.readthedocs.org/en/latest/#global-completion
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh

#brew install homebrew/dupes/screen
#brew install homebrew/php/php55 --with-gmp

#brew install exiv2
brew install git
#brew install git-lfs
brew install ssh-copy-id
brew install tree

#To stop Compile C errors
brew install gcc
brew install apple-gcc42

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep

brew install caskroom/cask/brew-cask

#Install applocation via cask
# Apps
#java 8 is installed below
#java 6 may be needed for SQLDeveloper installed seperately
apps=(
	bettertouchtool
	alfred
	chicken
	caffeine
	disk-inventory-x
	appcleaner
	dropbox
	evernote
	firefox
	filezilla
	google-chrome
	google-photos-backup
	git
	gitup
	handbrake
	iterm2
	jaspersoft-studio
	java
	skype
	sonos
	slack
	sts
	teamviewer
	textmate
	utorrent
	vlc
	vagrant
	vagrant-manager
	virtualbox
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

# Link Cask Apps to Alfred
#brew cask alfred link

brew tap caskroom/fonts                  # you only have to do this once!

# fonts
fonts=(
  font-m-plus
  font-clear-sans
  font-roboto
  font-inconsolata
)

# install fonts
echo "installing fonts..."
brew cask install ${fonts[@]}

# Remove outdated versions from the cellar.
brew cleanup
brew cask cleanup
