#!/usr/bin/env bash

function symLinkFile() {
    SRC="$1"
    DEST="$2"

    if [[ -f "$DEST" ]]; then
        rm -r "$DEST"
        ln -sf "$SRC" "$DEST"
    else
        ln -sf "$SRC" "$DEST"
    fi
}

function log() {
  echo "$1" >> "$LOG_DIR/install.log"
}

function newLine() {
  log ""
}

function logDateTimeInstall() {
  date "+[%d/%m/%Y %H:%M:%S] [$1]: $2" >> "$LOG_DIR/install.log"
}


function appIsInstalled() {
  logDateTimeInstall "$1" "Already installed."
  newLine
}










function logBrewInstall() {
  logDateTimeInstall "$2" "Installing $2..."

  if [ "$1" == "brew" ]; then
    brew install "$2" 2>&1 | tee -a "$LOG_DIR/.log/install.log"
  fi

  if [ "$1" == "cask" ]; then
    brew cask install "$2" 2>&1 | tee -a "$LOG_DIR/.log/install.log"
  fi

  newLine

  # Do something with status code 0
  # if [ "${PIPESTATUS[0]}" -ne "0" ]; then
  #   writeToLog ""
  # fi
}

