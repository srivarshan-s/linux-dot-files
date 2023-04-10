# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

################################## USER CHANGES ###################################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History Customization
export HISTCONTROL="erasedups:ignorespace"

# Append to the history file, don't overwrite it
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# History Completion
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Check the window size after each command and, if necessary,
# Update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Alias definitions
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
export PATH="$HOME/.local/bin/:$PATH"

# Add ~/.cargo/bin/ to path
export PATH="$HOME/.cargo/bin:$PATH"

# Add non-network local connections to access control list
xhost +local:* > /dev/null

# Customize prompt
PS1='\[\033[01;32m\]\u@\h \[\033[01;34m\]\W\[\033[00m\] % '

# Starship Prompt
if which starship > /dev/null 2>&1
then
	eval "$(starship init bash)"
fi

# Custom functions
git-credential-store () {
    git config credential.helper store
}
backup-snapper () {
	snapper -c root create
	snapper -c home create
}
backup () {
	rsync -av --delete --exclude 'venv' $HOME/Documents/ $HOME/Windows/Downloads/Documents-Backup/
	rsync -av --delete --exclude 'venv' $HOME/Downloads/ $HOME/Windows/Downloads/Downloads-Backup/
	rsync -av --exclude 'venv' $HOME/Builds/ $HOME/Windows/Downloads/Builds-Backup/
	rsync -av $HOME/Music/ $HOME/Windows/Downloads/Music-Backup/
}

# Added by rustup intallation
if which rustup > /dev/null 2>&1
then
	. "$HOME/.cargo/env"
fi
