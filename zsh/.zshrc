# ZSH Settings & plugins
ZSH_THEME="default/agnoster"
ZSH_CUSTOM=${HOME}/.dotfiles/zsh/zsh-custom
plugins=()

# Terminal Settings
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Changes command execution time of history command output
HIST_STAMPS="%d-%m-%y %T"

# Source file for further use
source $HOME/.dotfiles/zsh/exports.zsh
source $HOME/.dotfiles/zsh/functions.zsh
source $ZSH/oh-my-zsh.sh
source $HOME/.dotfiles/zsh/aliases.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
