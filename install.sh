#!/bin/bash

echo "Updating system.."
apt-get update
echo "Installing Git.."
apt-get install git
echo "Installing ZSH.."
apt-get install zsh -y
echo "Installing Oh My Zsh.."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm -rf ~/.zshrc
echo "Installing Emacs.."
apt-get install emacs -y
