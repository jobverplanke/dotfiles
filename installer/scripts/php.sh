#!/usr/bin/env bash

function installComposer() {
   logBrewInstall "brew" "composer"
}

function installComposerPackages() {
  local packages="
    laravel/valet
    laravel/installer
    vimeo/psalm
  "

  if ! test "$(which composer)"; then
    installComposer
  else
    for package in $packages
    do
      logDateTimeInstall "$package" "Installing $package..."
      composer global require "$package" 2>&1 | tee -a "$LOG_DIR/install.log"
      newLine
    done
  fi
}

function installPhpPeclPackages() {
  local packages="
    xdebug
    redis
    pcov
  "

  pecl channel-update pecl.php.net

  for package in $packages
  do
    logDateTimeInstall "$package" "Installing $package..."
    pecl install "$package"
    newLine
  done
}

function installPhpCsFixer() {
  if ! test "$(which php-cs-fixer)"; then
    logBrewInstall "brew" "php-cs-fixer"
  else
    appIsInstalled "php-cs-fixer"
  fi
}

function installValet() {
  valet install
  sudo valet trust
  newLine
}

function installPhp() {
  local phpVersions="
    7.2
    7.3
    7.4
  "

  for version in $phpVersions
  do
    if ! test "$(which "php@$version")"; then
      logBrewInstall "brew" "php@$version"
    else
      appIsInstalled "php@$version"
    fi
  done

  log "${YELLOW}Set default PHP version php@$DEFAULT_PHP_VERSION $NC"
  brew link --overwrite php@$DEFAULT_PHP_VERSION --force
  newLine

  installComposer
  installComposerPackages
  installPhpPeclPackages
  installPhpCsFixer
  installValet

  log "${YELLOW}Set custom PHP configuration$NC"

  for version in $phpVersions
  do
    sed -i '' 's/zend_extension="xdebug.so"/; zend_extension="xdebug.so"/g' "/usr/local/etc/php/$version/php.ini"
    symLinkFile "$DOTFILES/config/php/custom.ini" "/usr/local/etc/php/$version/conf.d/zz-custom.ini"
    symLinkFile "$DOTFILES/config/php/xdebug.ini" "/usr/local/etc/php/$version/conf.d/zz-xdebug.ini"
  done
}
