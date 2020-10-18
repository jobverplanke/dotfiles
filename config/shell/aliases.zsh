alias ll="ls -lahF"
alias dev="cd $HOME/dev"
alias ppath='echo -e ${PATH//:/\\n}'
alias git=hub

alias hostconf="sudo nano /etc/hosts"
alias zshconf='open -a /Applications/Visual\ Studio\ Code.app "$DOTFILES/config/shell/.zshrc"'
alias sshconf='open -a /Applications/Visual\ Studio\ Code.app "$DOTFILES/config/ssh/config"'
alias gitconf='open -a /Applications/Visual\ Studio\ Code.app "$DOTFILES/config/git/.config"'
alias kubeconf='open -a /Applications/Visual\ Studio\ Code.app "$HOME/.kube/config"'
alias aliasconf='open -a /Applications/Visual\ Studio\ Code.app "$DOTFILES/config/shell/aliases.zsh"'
alias copykey='command cat ~/.ssh/id_personal.pub" | pbcopy'

# PHP
alias php72="phpv 7.2"
alias php73="phpv 7.3"
alias php74="phpv 7.4"
alias phplinter='cp $HOME/.dotfiles/config/php/.php_cs "`pwd`"'
alias tlint="php-cs-fixer fix --config='.php_cs' -v --show-progress=none --dry-run"
alias pa="php artisan"
alias pu="vendor/bin/phpunit"
alias puf="vendor/bin/phpunit --filter "
alias cphpfiles="find . -type f -print | grep php | wc -l"

alias ip="curl https://diagnostic.opendns.com/myip ; echo"
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"
alias usage="du -sh"


alias gitlog="git l"
alias gitlogp="git g"
alias gitcont="git contrib"

alias phpstorm='open -a ~/Library/Application\ Support/JetBrains/Toolbox/apps/PhpStorm/ch-0/202.6397.115/PhpStorm.app "`pwd`"'
alias idea='open -a ~/Library/Application\ Support/JetBrains/Toolbox/apps/IDEA-U/ch-0/202.6397.94/IntelliJ\ IDEA.app "`pwd`"'
alias code='open -a /Applications/Visual\ Studio\ Code.app "`pwd`"'
