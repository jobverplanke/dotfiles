# Switch PHP versions
phpversion() {
  unlinkPhp

  echo -e ""
  valet use "php@$1" --force
  echo -e ""
  valet restart

  echo -e ""
  composer global update
  echo -e ""

  linkPhpCustomConfigurations "$1"
  checkExtraExtensionAreLoaded
  zsh
}

# Unlink all PHP versions
unlinkPhp() {
  local phpVersions=(7.3 7.4 8.0)

  for version in ${phpVersions[*]}
  do
    brew unlink "php@$version"
  done
}

# Link selected PHP version
linkPhp() {
  echo -e ""
  brew link --overwrite --force "php@$1"
}

# Link custom PHP configuration of selected PHP version
linkPhpCustomConfigurations() {
  if [[ -d "/usr/local/etc/php/$1" ]]; then
    if [[ -f "/usr/local/etc/php/$1/conf.d/zz-custom.ini" ]]; then
      rm -r "/usr/local/etc/php/$1/conf.d/zz-custom.ini"
    fi

    if [[ -f "/usr/local/etc/php/$1/conf.d/zz-xdebug.ini" ]]; then
      rm -r "/usr/local/etc/php/$1/conf.d/zz-xdebug.ini"
    fi

    ln -sf "$DOTFILES/config/php/zz-custom.ini" "/usr/local/etc/php/$1/conf.d/zz-custom.ini"
    ln -sf "$DOTFILES/config/php/zz-xdebug.ini" "/usr/local/etc/php/$1/conf.d/zz-xdebug.ini"
    echo -e "Linking custom configuration for PHP$1"
  fi
}

# Check if extra PHP extensions are loaded of current PHP version
checkExtraExtensionAreLoaded() {
  local extensions=(igbinary imagick pcov redis xdebug)
  php -v
  echo -e ""

  for extension in ${extensions[*]}
  do
    php -r "echo (extension_loaded('""$extension""')) ? 'Extension [$extension] Loaded' . PHP_EOL : 'Extension [$extension] NOT loaded, run: pecl install $extension' . PHP_EOL;"
  done
}