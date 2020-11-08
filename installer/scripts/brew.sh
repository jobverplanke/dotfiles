#!/usr/bin/env bash

function installBrew() {
  logDateTimeInstall "Brew" "Installing Brew..."

  if test ! "$(which brew)"; then
    sudo rm -rf /usr/local/Cellar /usr/local/.git && brew cleanup
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    newLine
  else
    appIsInstalled "Brew"
  fi
}
