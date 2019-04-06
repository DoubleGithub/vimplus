#!/bin/bash

# 下载插件管理软件vim-plug
function download_vim_plug()
{
    #curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	mkdir -p ~/.vim/autoload
	cp plug.vim ~/.vim/autoload/
}

download_vim_plug