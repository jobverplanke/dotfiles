# Switch PHP versions
phpversion() {
  local phpVersions=(7.3 7.4 8.0)

  for version in ${phpVersions[*]}
  do
    brew unlink php@$version
  done

  brew link --overwrite --force "php@$1"

  composer global update

  if [[ -d "/usr/local/etc/php/$1" ]]; then
    rm -r "/usr/local/etc/php/$1/conf.d/zz-custom.ini"
    ln -sf "$DOTFILES/config/php/zz-custom.ini" "/usr/local/etc/php/$1/conf.d/zz-custom.ini"
    echo -e "Symlinked custom configuration for PHP$1."
  fi

  source "$HOME/.zshrc"
}

