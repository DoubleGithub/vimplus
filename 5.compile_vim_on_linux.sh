#!/bin/bash

# 源代码安装vim
function compile_vim()
{
    # with GUI
    #sudo apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
    #    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    #    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git
    
    # without GUI
    sudo apt-get install -y libncurses5-dev \
         python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git
    
	# 彻底卸载现有VIM
	sudo apt-get --purge remove -y vim vim-runtime gvim
    sudo apt-get --purge remove -y vim-tiny vim-common vim-gui-common vim-nox

    #sudo rm -rf ~/vim
    sudo rm -rf /etc/vim/
    #sudo rm -rf /usr/share/vim/vim74
    #sudo rm -rf /usr/share/vim/vim80
    sudo rm -rf /usr/share/vim/
	
    python3_version=`python3 -V |awk '{print $2}'`
    system_arch=`arch`
    if [ ${system_arch} == "x86_64" ]; then
        echo "64bit"
        system_arch="x86_64"
    else
        echo "32bit"
        system_arch="i386"
    fi
    
    git clone https://github.com/vim/vim.git 
    cd vim
    ./configure --with-features=huge \
        --enable-multibyte \
        --enable-rubyinterp=yes \
        --enable-python3interp=yes \
        --with-python3-config-dir=/usr/lib/python${python3_version%.*}/config-${python3_version%.*}m-${system_arch}-linux-gnu \
        --enable-perlinterp=yes \
        --enable-luainterp=yes \
        --enable-cscope 	\
		--prefix=/usr/local \
		--enable-fontset \
    #    --enable-gui=gtk2  \
    
    #vim_version=`cat README.md| grep "for version"|awk '{print $4}'`
    #make VIMRUNTIMEDIR=/usr/local/share/vim/vim${vim_version/./}
	make VIMRUNTIMEDIR=/usr/local/share/vim/vim81
    sudo make install
    cd -
}

compile_vim