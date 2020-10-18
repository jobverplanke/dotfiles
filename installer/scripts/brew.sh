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

function updateBrew() {
  logDateTimeInstall "Brew" "Updating Brew..."
  brew update 2>&1 | tee -a "$LOG_DIR/brew.log"
  newLine
}

function updateBrewTaps() {
  logDateTimeInstall "Brew Taps" "Updating Brew Taps..."
  brew tap homebrew/cask 2>&1 | tee -a "$LOG_DIR/brew.log"
  brew tap homebrew/cask-versions 2>&1 | tee -a "$LOG_DIR/brew.log"
  newLine
}

function startBrewServices() {
  logDateTimeInstall "PHP" "Starting PHP $DEFAULT_PHP_VERSION as service (root user)"
  sudo brew services start php@$DEFAULT_PHP_VERSION
  newLine

  logDateTimeInstall "MySQL" "Starting MySQL $DEFAULT_MYSQL_VERSION as service (root user)"
  sudo brew services start mysql@$DEFAULT_MYSQL_VERSION
  newLine
}

function cleanUpBrew() {
  logDateTimeInstall "Brew" "Cleaning up old breweries."
  brew cleanup
  newLine
}
