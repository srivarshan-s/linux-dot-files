# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History Customization
export HISTCONTROL="erasedups:ignorespace"

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# History Completion
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# Replacing vi and vim with neovim
export VISUAL="nvim"
export EDITOR="nvim"

# Add ~/.local/bin/ to path
export PATH="$HOME/.local/bin:$PATH"

# Add ~/.cargo/bin/ to path
export PATH="$HOME/.cargo/bin:$PATH"

# Add non-network local connections to access control list
xhost +local:* > /dev/null

# Customize prompt
PS1='\[\033[01;32m\]\u@\h \[\033[01;34m\]\W\[\033[00m\] % '

# Starship Prompt
eval "$(starship init bash)"

# Custom function
git-credential-store () {
    git config credential.helper store
}
backup () {
	rsync -av --delete --exclude 'venv' $HOME/Documents/ $HOME/Windows/Downloads/Documents-Backup/
	rsync -av --delete --exclude 'venv' $HOME/Downloads/ $HOME/Windows/Downloads/Downloads-Backup/
	rsync -av --delete --exclude 'venv' $HOME/Builds/ $HOME/Windows/Downloads/Builds-Backup/
}

# Added by rustup intallation
. "$HOME/.cargo/env"
