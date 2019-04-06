#!/bin/bash

# 改变一些文件、文件夹属组和用户关系
function chown_dir()
{
    who_is=$(who)
    current_user=${who_is%% *}
    sudo chown -R ${current_user}:${current_user} ~/.vim
    sudo chown -R ${current_user}:${current_user} ~/.fonts
    sudo chown -R ${current_user}:${current_user} ~/.cache
    sudo chown ${current_user}:${current_user} ~/.vimrc.local
    sudo chown ${current_user}:${current_user} ~/.vimrc
	sudo chown ${current_user}:${current_user} ~/.viminfo
}

chown_dir