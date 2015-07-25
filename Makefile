install: git tmuxifier vim z zsh
	@echo 'Run :PluginInstall in vim to complete :D'

git:
	rm -f ~/.gitconfig
	ln -s `pwd`/gitconfig ~/.gitconfig

tmuxifier:
	rm -rf ~/.tmuxifier ~/.tmuxifier-layouts
	git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
	ln -s `pwd`/tmuxifier/layouts ~/.tmuxifier-layouts

vim:
	rm -rf ~/.vim ~/.vimrc
	ln -s `pwd`/vimrc ~/.vimrc
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	ln -s `pwd`/vim/snipps ~/.vim/snipps

z:
	rm -rf ~/.z
	git clone https://github.com/rupa/z.git ~/.z

zsh:
	rm -f ~/.zshrc
	ln -s `pwd`/zshrc ~/.zshrc
