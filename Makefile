install: git tmuxifier vim z zsh nvim
	@echo 'Run :PluginInstall in vim to complete :D'
.PHONY:install

git:
	rm -f ~/.gitconfig
	ln -s `pwd`/gitconfig ~/.gitconfig
.PHONY:git

tmuxifier:
	rm -rf ~/.tmuxifier ~/.tmuxifier-layouts
	rm -f ~/.tmux.conf
	git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
	ln -s `pwd`/tmuxifier/layouts ~/.tmuxifier-layouts
	ln -s `pwd`/tmux.conf ~/.tmux.conf
.PHONY:tmuxifier

vim:
	rm -rf ~/.vim ~/.vimrc
	ln -s `pwd`/vimrc ~/.vimrc
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	ln -s `pwd`/vim/snipps ~/.vim/snipps
.PHONY:vim

z:
	rm -rf ~/.z
	git clone https://github.com/rupa/z.git ~/.z
.PHONY:z

zsh:
	rm -f ~/.zshrc
	ln -s `pwd`/zshrc ~/.zshrc
.PHONY:zsh

nvim:
	mkdir -p ~/.config
	ln -s ~/.vim ~/.config/nvim
	ln -s ~/.vimrc ~/.config/nvim/init.vim
.PHONY:nvim
