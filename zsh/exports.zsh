# Local bin directories before anything else (Useful for e.g Git)
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Add Brew Composer & global Composer to PATH
export PATH="$PATH:/usr/local/bin/composer:$HOME/.composer/vendor/bin"

# Add MacGPG2 to PATH
export PATH="$PATH:/usr/local/MacGPG2/bin"

# Saves 10 million lines in memory and in the bash history file.
export HISTSIZE=10000000
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

# Make some commands not show up in history
export HISTIGNORE="ls:ll:cd:cd -:pwd:exit:date:* --help"

# And include the parameter for ZSH
export HISTORY_IGNORE="(ls|ll|cd|cd -|pwd|exit|date|* --help)"

# Default terminal editor & default language for environment
export EDITOR="nano"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Path to .dotfiles
export DOTFILES="$HOME/.dotfiles"

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set kubeconfig with config files, use ':' for multiple files.
export KUBECONFIG="$HOME/.kube/config"

# Always enable colored `grep` output
export GREP_OPTIONS="--color=auto"

# Github Container Registry
export GHCR_PAT=
