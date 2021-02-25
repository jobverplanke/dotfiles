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
alias pa="php artisan"
alias cs-copy='cp $HOME/.dotfiles/config/php/.php_cs "`pwd`"'
alias cs-dry="./vendor/bin/php-cs-fixer fix --config='.php_cs' -v --show-progress=none --dry-run"
alias cs-fix="./vendor/bin/php-cs-fixer fix --config='.php_cs' -v --show-progress=none"
alias pu="./vendor/bin/phpunit --colors=always -c ./phpunit.xml"
alias puf="./vendor/bin/phpunit --colors=always -c ./phpunit.xml --filter "
alias puc="./vendor/bin/phpunit --colors=always -c ./phpunit.xml --coverage-html docs/phpunit"
alias phpfiles="find . -type f -print | grep php | wc -l"

# Editor shortcut
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'
alias code='open -a /Applications/Visual\ Studio\ Code.app "`pwd`"'

# Architecture
alias toArm="arch -arm64 zsh"
alias toIntel="arch -x86_64 zsh"