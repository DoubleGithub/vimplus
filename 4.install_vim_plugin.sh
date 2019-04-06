#!/bin/bash

# 安装vim插件
function install_vim_plugin()
{
    #vim -c "PlugInstall" -c "q" -c "q"
	if [ -f "plugged.tar.bz2" ];then
		echo "文件存在"
		rm -r ~/.vim/plugged
		tar -xjf plugged.tar.bz2
		mv plugged ~/.vim/
	else
		echo "文件不存在"
		vim -c "PlugInstall" -c "q" -c "q"
	fi
}

install_vim_plugin