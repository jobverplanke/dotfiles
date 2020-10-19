#!/usr/bin/env bash

CLI_APPLICATIONS="
  ansible
  git
  hey
  htop
  iterm2
  kubectl
  mackup
  minikube
  mysql@5.7
  mysql@8.0
  node@12
  redis
  svn
  sqlite
  wget
"

APPLICATIONS="
  1password
  appcleaner
  docker
  dropbox
  font-hack-nerd-font
  font-ibm-plex-mono
  google-chrome
  google-backup-and-sync
  gpg-suite-no-mail
  jetbrains-toolbox
  mailplane
  postman
  rectangle
  slack
  sourcetree
  spotify
  tableplus
  tinkerwell
  visual-studio-code
  whatsapp
"

function installCliApps() {
  for app in $CLI_APPLICATIONS
  do
    if ! test "$(which "$app")"; then
      logBrewInstall "brew" "$app"
    else
      appIsInstalled "$app"
    fi
  done
}

function installGuiApps() {
  for app in $APPLICATIONS
  do
    logBrewInstall "cask" "$app" "Installing $app..."
  done
}
