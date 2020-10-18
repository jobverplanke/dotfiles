#!/usr/bin/env bash

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
