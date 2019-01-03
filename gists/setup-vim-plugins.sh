if !(which git > /dev/null); then
	echo "请安装：Git"
	exit 127
fi

if !(which vim > /dev/null); then
	echo "请安装：VIM"
	exit 127
fi

mkdir -p $HOME/.vim/pack/foo/start
cd $HOME/.vim/pack/foo/start
git clone https://github.com/python-mode/python-mode.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/vim-airline/vim-airline.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/yianwillis/vimcdoc.git

vim -u NONE -c "helptags python-mode/doc" -c "helptags nerdtree/doc" -c "helptags vim-airline/doc" -c "helptags vim-fugitive/doc" -c "helptags vimcdoc/doc" -c q

cd $HOME/.vim/pack/foo/start/python-mode
git submodule update --init --recursive
