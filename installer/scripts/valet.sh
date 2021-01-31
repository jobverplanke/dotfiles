#!/usr/bin/env bash

sudo -v

# Enables to call script as stand-alone script
source ./helpers.sh

function installValet() {
  valet install
  sudo valet trust
  newLine
}

installValet
