#!/bin/bash -e

# Update repositoties
sudo apt-get update -y
# Install commom packages
sudo apt-get install -y curl wget htop tmux vim zip unzip tree git
# Install programming languages
sudo apt-get install -y gcc g++ python3 python3-pip openjdk-11-jdk-headless nodejs npm
sudo npm install -g npm@latest typescript ts-node eslint yarn
# Install network utilities
sudo apt-get install -y net-tools traceroute w3m
# Install media packages
sudo apt-get install -y ffmpeg

# Setup configs
sudo cp -f vimrc /etc/vim/vimrc
sudo cp -f hosts /etc/hosts
cp -f tmux.conf ~/.tmuc.conf
sudo update-alternatives --set editor /usr/bin/vim.basic

# Setup binary files
sudo cp ../../binaries/* /usr/local/bin/
sudo chmod +x /usr/local/bin/oj /usr/local/bin/qconv

