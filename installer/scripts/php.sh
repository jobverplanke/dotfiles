#!/usr/bin/env bash

function installComposerPackages() {
  local packages="
    laravel/valet
    laravel/installer
    vimeo/psalm
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
    xdebug@3.0.1
    redis@5.3.2
  "

  pecl channel-update pecl.php.net

  for package in $packages
  do
    logInstall "$package" "Installing $package..."
    pecl install "$package" 2>&1 | tee -a "$LOG_DIR/pecl-packages.log"
    newLine
  done
}

function installValet() {
  valet install
  sudo valet trust
  newLine
}

function setupPhp() {
  local phpVersions="
    7.2
    7.3
    7.4
  "

  echo -e "${YELLOW}Set default PHP version php@${DEFAULT_PHP_VERSION} ${NC}"
  brew link --overwrite php@"${DEFAULT_PHP_VERSION}" --force
  newLine

  installComposerPackages
  installPhpPeclPackages
  installValet

  echo -e "${YELLOW}Set custom PHP configuration${NC}"

  for version in $phpVersions
  do
    sed -i '' 's/zend_extension="xdebug.so"/; zend_extension="xdebug.so"/g' "/usr/local/etc/php/$version/php.ini"
    symLinkFile "$DOTFILES/config/php/custom.ini" "/usr/local/etc/php/$version/conf.d/zz-custom.ini"
    symLinkFile "$DOTFILES/config/php/xdebug.ini" "/usr/local/etc/php/$version/conf.d/zz-xdebug.ini"
  done
}
