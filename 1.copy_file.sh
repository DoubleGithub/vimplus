#!/bin/bash

# 拷贝文件
function copy_files()
{
    rm -rf ~/.vimrc
	cp ${PWD}/.vimrc ~

    rm -rf ~/.vimrc.local
    cp ${PWD}/.vimrc.local ~

    rm -rf ~/.vim
    mkdir ~/.vim
    rm -rf ~/.vim/colors

	cp -r ${PWD}/colors ~/.vim
	
	rm -rf ~/.ycm_extra_conf.py
    
	cp ${PWD}/.ycm_extra_conf.py ~/.vim
	
	mkdir ~/.vim/TempFiles
	mkdir ~/.vim/TempFiles/backupdir
	mkdir ~/.vim/TempFiles/swapdir
	mkdir ~/.vim/TempFiles/undodir
}

copy_files