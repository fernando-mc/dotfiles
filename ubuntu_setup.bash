## Note, this script restarts your machine at the end. Heads up.

#################### Install the basics & prereqs ####################
sudo apt-get install build-essential libssl-dev
sudo apt-get install curl
sudo apt-get install git

#################### Install Programs ####################

# Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

# Install Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update 
sudo apt-get install google-chrome-stable


#################### git configs and GitHub Setup ####################

# Create a new key from scratch for the host machine
ssh-keygen
subl ~/.ssh/*.pub
read -n 1 -s -r -p "After adding public key to github - press any key to continue"

git config --global user.name "Fernando Medina Corey"
git config --global user.email "fmcorey@gmail.com"

#################### Setup my folder structure ####################
mkdir ~/Documents/code

# Repos to clone
cd ~/Documents/code && git clone git@github.com:fernando-mc/fernandomc.com.git
cd ~/Documents/code && git clone git@github.com:fernando-mc/serverlessfoo.com.git
cd ~/Documents/code && git clone git@github.com:fernando-mc/serverless-node-text-message-app.git
cd ~/Documents/code && git clone git@github.com:fernando-mc/serverless-node-rest-api.git
cd ~/Documents/code && git clone git@github.com:fernando-mc/serverless-node-cron-ses-reminder.git
cd ~/Documents/code && git clone git@github.com:fernando-mc/serverless-finch.git

#################### Install zsh & other utils ####################
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
[ -x /usr/bin/zsh ] && exec /usr/bin/zsh

# Switch to zsh so other steps install profile specifics in zsh not just bash
zsh


#################### Install Node, npm, and nvm ####################

## nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

## Setup the specific node version I want
nvm install 6.10.3
nvm use 6.10.3

# Might also need to install npm/node first? TBD.

#################### Install Python Stuff ####################
# Get Pip and python tools
sudo apt-get install python-pip python-virtualenv

#################### Install Globals ####################
npm install serverless -g

#################### RESTARTS YOUR MACHINE TO MAKE FINAL CHANGES ####################
# Let's the zsh stuff start by default cause it's in etc/passwd
sudo shutdown -r 0