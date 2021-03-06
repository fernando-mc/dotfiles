#!/usr/bin/env bash

# Move scripts and dotfiles to home folder
cp -r scripts ~/.scripts
cp ./my-zshrc ~/.zshrc

# Install my programs and packages
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap homebrew/bundle
brew bundle install

# Install the specific version of hugo I need for my blog theme
brew install https://raw.githubusercontent.com/Homebrew/homebrew-core/d3c4aadfd067534a723f9cf2e5c5bec444d0579d/Formula/hugo.rb

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
nvm install 6.10.3
nvm use 6.10.3

git config --global user.name "Fernando Medina Corey"
git config --global user.email "fmcorey@gmail.com"

# Install my repositories
mkdir ~/Documents/code

cd ~/Documents/code && git clone git@github.com:fernando-mc/fernandomc.com.git
cd ~/Documents/code && git clone git@github.com:fernando-mc/serverlessfoo.com.git

# Set ssh keys on OSX keychain
ls ~/.ssh/id_rsa* | grep -v '.pub' | xargs ssh-add -K
