alias ll="ls -lahF"
alias dev='cd "$HOME/dev"'
alias web='cd "$HOME/dev/webapps"'
alias ppath='echo -e ${PATH//:/\\n}'
alias git=hub
alias copykey='command cat ~/.ssh/id_personal.pub" | pbcopy'
alias ip="curl https://diagnostic.opendns.com/myip ; echo"
alias ports="sudo lsof -PiTCP -sTCP:LISTEN | grep $1"
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"
alias usage="du -sh"

# Config
alias hostsconf="sudo nano /etc/hosts"
alias zshconf='open -a /Applications/Visual\ Studio\ Code.app "$DOTFILES/zsh/.zshrc"'
alias sshconf='open -a /Applications/Visual\ Studio\ Code.app "$HOME/Google\ Drive/Documenten/Mackup/.ssh/config"'
alias gitconf='open -a /Applications/Visual\ Studio\ Code.app "$HOME/Google\ Drive/Documenten/Mackup/.gitconfig"'
alias aliasconf='open -a /Applications/Visual\ Studio\ Code.app "$DOTFILES/zsh/aliases.zsh"'

# PHP
alias php73="phpversion 7.3"
alias php74="phpversion 7.4"
alias php80="phpversion 8.0"
alias php-files="find . -type f -print | grep php | wc -l"
alias php-ext-check="checkExtraExtensionAreLoaded"
alias php-link-conf73="linkPhpCustomConfigurations 7.3"
alias php-link-conf74="linkPhpCustomConfigurations 7.4"
alias php-link-conf80="linkPhpCustomConfigurations 8.0"
alias pa="php artisan"
alias pu="./vendor/bin/phpunit --colors=always -c ./phpunit.xml"
alias puf="./vendor/bin/phpunit --colors=always -c ./phpunit.xml --filter "
alias puc="./vendor/bin/phpunit --colors=always -c ./phpunit.xml --coverage-html docs/phpunit"
alias cs-copy='cp $HOME/.dotfiles/config/php/.php_cs "`pwd`"'
alias cs-dry="./vendor/bin/php-cs-fixer fix --config='.php_cs' -v --show-progress=none --dry-run"
alias cs-fix="./vendor/bin/php-cs-fixer fix --config='.php_cs' -v --show-progress=none"

# Editor shortcut
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'
alias code='open -a /Applications/Visual\ Studio\ Code.app "`pwd`"'

# Architecture switch
alias toArm="arch -arm64 zsh"
alias toIntel="arch -x86_64 zsh"