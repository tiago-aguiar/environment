#!/bin/bash

INSTALL='sudo apt-get -y install'

echo "Updating system.."
sudo apt-get -y update

echo "Installing Git.."
$INSTALL git
echo "Installing ZSH.."

$INSTALL zsh
echo "Installing Oh My Zsh.."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm -rf ~/.zshrc

echo "Installing MySQL Client (for python)"
$INSTALL libmysqlclient-dev

echo "Installing Python.."
$INSTALL curl
$INSTALL python-setuptools
sudo easy_install pip
sudo pip install virtualenv
$INSTALL build-essential
$INSTALL texinfo libtinfo-dev

# Get options.
LNOPTS=""
if [ $# -gt 0 ]; then
  if [[ "$1" == "--vagrant" ]]; then
    LNOPTS="-f"

    VAGRANT_HOME=/home/ubuntu
    cd $VAGRANT_HOME

    sudo -u ubuntu mkdir -p $VAGRANT_HOME/.emacs.d
    sudo -u ubuntu ln -sf /vagrant/dotfiles/emacs.d/init.el $VAGRANT_HOME/.emacs.d/init.el
    sudo -u ubuntu ln -sf /vagrant/dotfiles/emacs.d/lisp $VAGRANT_HOME/.emacs.d/lisp

    # compile
    EMACSBASE=emacs-24.5
    EMACSPKG="$EMACSBASE.tar.gz"
    if [ ! -f /vagrant/archive/$EMACSPKG ]; then
        mkdir -p /vagrant/archive
        curl -XGET -O "http://ftp.gnu.org/gnu/emacs/$EMACSPKG"
        mv -f $EMACSPKG /vagrant/archive/
    fi
    tar xzvf /vagrant/archive/$EMACSPKG
    cd $EMACSBASE
    ./configure --without-all --with-zlib
    make
    sudo make install

    # and cleanup
    cd $VAGRANT_HOME
    rm -rf $EMACSBASE
    
  else
    echo "Unrecognized option: $1"
    cat << EOF
Usage: $me [OPTIONS]

    Options:
    -vagrant    mount emacs env in virtual machine.
EOF
    exit 1
  fi
fi

if [[ -z $LNOPTS ]]; then
    echo "Installing Emacs.."
    $INSTALL emacs

    echo "Linking.."
    zsh linkall.zsh
fi


#echo "Installing Eclipse Oxygen.."
#wget -c http://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/oxygen/R/eclipse-jee-oxygen-R-linux-gtk-x86_64.tar.gz -O /opt/eclipse.tar.gz
