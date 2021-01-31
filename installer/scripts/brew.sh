#!/usr/bin/env bash

sudo -v

# Enables to call script as stand-alone script
source ./helpers.sh

function installBrew() {
  logInstall "Brew" "Installing Brew..."

  if test ! "$(which brew)"; then
    sudo rm -rf /usr/local/Cellar /usr/local/.git && brew cleanup
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    newLine
  else
    appIsInstalled "Brew"
  fi
}
