# ZSH Settings & plugins
ZSH_CUSTOM="$HOME/.dotfiles/shell/zsh-custom"
ZSH_THEME="default/agnoster"
plugins=(
  kubectl
  minikube
)

# Terminal Settings
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Changes command execution time of history command output
HIST_STAMPS="%d-%m-%y %T"

# Source file for further use
source $HOME/.dotfiles/shell/exports.zsh
source $HOME/.dotfiles/shell/functions.zsh
source $ZSH/oh-my-zsh.sh
source $HOME/.dotfiles/shell/aliases.zsh
