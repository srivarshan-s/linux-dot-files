# Install bash config
ln -nfs $(pwd)/.bashrc ~/.
ln -nfs $(pwd)/.bash_aliases ~/.

# Install fonts
ln -nfs $(pwd)/.fonts ~/.

# Install git configs
if [ -f ~/.git-credentials ]; then
	echo "Git credentials file found in HOME directory!"
else
	cp .git-credentials ~/.
fi
ln -nfs $(pwd)/.gitconfig ~/.

# Install tmux config
ln -nfs $(pwd)/.tmux.conf ~/.

# Install alacritty config
ln -nfs $(pwd)/alacritty ~/.config/.

# Install starship config
ln -nfs $(pwd)/starship.toml ~/.config/.

# Install hosts file
sudo ln -nfs $(pwd)/hosts /etc/.
