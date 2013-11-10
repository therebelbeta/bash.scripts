#! /bin/bash
# Install Node.js
sudo apt-get update && sudo apt-get install curl build-essential openssl libssl-dev git python;

# Ensure here that any previous version of node is uninstalled

git clone git://github.com/creationix/nvm.git ~/.nvm;
printf "\n\n# NVM\nif [ -s ~/.nvm/nvm.sh ]; then\n\tNVM_DIR=~/.nvm\n\tsource ~/.nvm/nvm.sh\nfi" >> ~/.bashrc;
NVM_DIR=~/.nvm;
source ~/.nvm/nvm.sh;
nvm install v0.10.5;
nvm alias default 0.10;
nvm use 0.10