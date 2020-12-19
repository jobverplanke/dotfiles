#!/usr/bin/env bash

YELLOW=$'\033[1;33m'
NC=$'\033[0m'

DEFAULT_PHP_VERSION='7.4'
DEFAULT_MYSQL_VERSION='8.0'
LOG_DIR="$DOTFILES/.log"

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

function logInstall() {
  date "+[%d/%m/%Y %H:%M:%S] [$1]: $2" >> "$LOG_DIR/$1.log"
}

function appIsInstalled() {
  logInstall "$1" "Already installed."
  newLine
}

function newLine() {
  echo -e "\n"
}
