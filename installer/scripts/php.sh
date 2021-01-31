#!/usr/bin/env bash

sudo -v

# Enables to call script as stand-alone script
source ./helpers.sh

YELLOW=$'\033[1;33m'
NC=$'\033[0m'

DEFAULT_PHP_VERSION='7.4'

function installComposerPackages() {
  local packages="
    laravel/valet
    laravel/installer
  "

  if ! test "$(which composer)"; then
    logInstall "Composer" "Is not installed."
  else
    for package in $packages
    do
      logInstall "$package" "Installing $package..."
      composer global require "$package" 2>&1 | tee -a "$LOG_DIR/composer-packages.log"
      newLine
    done
  fi
}

function installPhpPeclPackages() {
  local packages="
    igbinary-3.1.6
    redis-5.3.2
  "

  pecl channel-update pecl.php.net

  for package in $packages
  do
    logInstall "$package" "Installing $package..."
    yes | pecl install "$package" 2>&1 | tee -a "$LOG_DIR/pecl-packages.log"
    newLine
  done
}

function setupPhp() {
  local phpVersions="
    7.2
    7.3
    7.4
    8.0
  "

  echo -e "${YELLOW}Set default PHP version php@$DEFAULT_PHP_VERSION ${NC}"
  brew link --overwrite "php@$DEFAULT_PHP_VERSION" --force
  newLine

  installComposerPackages
  installPhpPeclPackages

  echo -e "${YELLOW}Set custom PHP configuration${NC}"

  for version in $phpVersions
  do
    if [[ -d "/usr/local/etc/php/$version" ]]; then
      symLinkFile "$DOTFILES/config/php/zz-custom.ini" "/usr/local/etc/php/$version/conf.d/zz-custom.ini"
      echo -e "Symlinked custom configuration for PHP${version}."
    fi
  done
}

setupPhp
