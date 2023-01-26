# Install bash config
ln -nfs $(pwd)/.bashrc ~/.
ln -nfs $(pwd)/.bash_aliases ~/.

# Install fonts
ln -nfs $(pwd)/.fonts ~/.

# Install git configs
cp .git-credentials ~/.
ln -nfs $(pwd)/.gitconfig ~/.

# Install tmux config
ln -nfs $(pwd)/.tmux.conf ~/.

# Install alacritty config
ln -nfs $(pwd)/alacritty ~/.config/.

# Install starship config
ln -nfs $(pwd)/starship.toml ~/.config/.

