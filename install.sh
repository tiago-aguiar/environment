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
echo "Installing Eclipse Oxygen.."
wget -c http://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/oxygen/R/eclipse-jee-oxygen-R-linux-gtk-x86_64.tar.gz -O /opt/eclipse.tar.gz
