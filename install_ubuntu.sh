#!/bin/bash


# 判断是否是ubuntu14.04LTS版本
function is_ubuntu1404()
{
    version=$(cat /etc/lsb-release | grep "DISTRIB_RELEASE")
    if [ ${version} == "DISTRIB_RELEASE=14.04" ]; then
        echo 1
    else
        echo 0
    fi
}

# 源代码安装vim
function compile_vim()
{
    # with GUI
    sudo apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
        libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
        libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git
    
    # without GUI
    #sudo apt-get install -y libncurses5-dev \
    #     python-dev python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git
    
	# 彻底卸载现有VIM
	sudo apt-get --purge remove -y vim vim-runtime gvim
    sudo apt-get --purge remove -y vim-tiny vim-common vim-gui-common vim-nox

    sudo rm -rf ~/vim
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
    
    git clone https://github.com/vim/vim.git ~/vim
    cd ~/vim
    ./configure --with-features=huge \
        --enable-multibyte \
        --enable-rubyinterp=yes \
        --enable-python3interp=yes \
        --with-python3-config-dir=/usr/lib/python${python3_version%.*}/config-${python3_version%.*}m-${system_arch}-linux-gnu \
        --enable-perlinterp=yes \
        --enable-luainterp=yes \
        --enable-cscope --prefix=/usr/local \
        --enable-gui=gtk2  \
    
    vim_version=`cat README.md| grep "for version"|awk '{print $4}'`
    make VIMRUNTIMEDIR=/usr/local/share/vim/vim${vim_version/./}
    sudo make install
    cd -
}

# 安装ubuntu发行版必要软件
function install_prepare_software_on_ubuntu()
{
    sudo apt-get install -y ctags astyle gcc g++ gdb build-essential cmake python python3 python-dev python3-dev fontconfig curl ack-grep vim git
    ubuntu_1404=`is_ubuntu1404`
    echo ${ubuntu_1404}

    if [ ${ubuntu_1404} == 1 ]; then
        echo "ubuntu 14.04 LTS"
        compile_vim
    else
        echo "not ubuntu 14.04 LTS"
        vim_support_python3=$(vim --version| awk '$3=="+python3"'|awk '{print $3}')
        if [ ! -z ${vim_support_python3} ]; then
            echo 1
            need_compile_vim=0
        else
            echo 0
            need_compile_vim=1
        fi
        
        if [ ${need_compile_vim} == 1 ]; then
            echo "need_compile_vim"
            compile_vim
        fi
    fi
}

# 拷贝文件
function copy_files()
{
    rm -rf ~/.vimrc
    # ln -s ${PWD}/.vimrc ~
	cp ${PWD}/.vimrc ~

    rm -rf ~/.vimrc.local
    cp ${PWD}/.vimrc.local ~

    rm -rf ~/.vim
    mkdir ~/.vim
    rm -rf ~/.vim/colors
    # ln -s ${PWD}/colors ~/.vim
	cp -r ${PWD}/colors ~/.vim
	
	rm -rf ~/.ycm_extra_conf.py
    # ln -s ${PWD}/.ycm_extra_conf.py ~
	cp ${PWD}/.ycm_extra_conf.py ~/.vim
	
	mkdir ~/.vim/TempFiles
	mkdir ~/.vim/TempFiles/backupdir
	mkdir ~/.vim/TempFiles/swapdir
	mkdir ~/.vim/TempFiles/undodir
}

# 安装linux平台字体
function install_fonts_on_linux()
{
    mkdir ~/.fonts
    rm -rf ~/.fonts/Droid\ Sans\ Mono\ Nerd\ Font\ Complete.otf
    cp ./fonts/Droid\ Sans\ Mono\ Nerd\ Font\ Complete.otf ~/.fonts

    fc-cache -vf ~/.fonts
}

# 下载插件管理软件vim-plug
function download_vim_plug()
{
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

# 安装vim插件
function install_vim_plugin()
{
    vim -c "PlugInstall" -c "q" -c "q"
}

# 在linux平台编译ycm插件
function compile_ycm_on_linux()
{

    system_version=$(cat /etc/lsb-release | grep "DISTRIB_RELEASE")
    system_codename=$(cat /etc/lsb-release | grep "DISTRIB_CODENAME")
    system_arch=`arch`
    is_compile_ycm=0
    if [ ${system_arch} == "x86_64" ]; then
       if [ ${system_version} == "DISTRIB_RELEASE=14.04" ] || [ ${system_version} == "DISTRIB_RELEASE=16.04" ]; then
            is_compile_ycm=1
            cd ~/.vim/plugged/YouCompleteMe
            sudo ./install.py --clang-completer
       fi 
    fi
    
    if [ ${is_compile_ycm} == 0 ]; then
        if [ ${system_version} == "DISTRIB_RELEASE=14.04" ]; then
            sudo echo -e "\n" | sudo add-apt-repository ppa:ubuntu-toolchain-r/test
            #echo -e "\n"
        fi
        sudo cp /etc/apt/sources.list /etc/apt/sources.list.bakAfterLLVM
        echo -e "deb http://apt.llvm.org/${system_codename#*=}/ llvm-toolchain-trusty-5.0 main" >> /etc/apt/sources.list
        echo -e "deb-src http://apt.llvm.org/${system_codename#*=}/ llvm-toolchain-trusty-5.0 main" >> /etc/apt/sources.list
        wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -
        sudo apt-get update
        sudo apt-get -y install clang-5.0
        
		mkdir ~/Temp
        cd ~/Temp
        mkdir ycm_build
        cd ycm_build
        cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON . ~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp -DUSE_PYTHON2=OFF
        cmake --build . --target ycm_core
        
        cd ~/Temp
        mkdir regex_build
        cd regex_build
        cmake -G "Unix Makefiles" . ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/cregex
        cmake --build . --target _regex
        
        cd ~/.vimplus
    fi   
}

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

# 打印logo
function print_logo()
{
    color="$(tput setaf 6)"
    normal="$(tput sgr0)"
    printf "${color}"
    echo '        __                __           '
    echo '__   __/_/___ ___  ____  / /_  _______ '
    echo '\ \ / / / __ `__ \/ __ \/ / / / / ___/ '
    echo ' \ V / / / / / / / /_/ / / /_/ (__  )  '
    echo '  \_/_/_/ /_/ /_/ ,___/_/\____/____/   '
    echo '               /_/                     ...is now installed!'
    echo ''
    echo ''
    echo 'Just enjoy it!'
    echo 'p.s. Follow me at https://github.com/chxuan.'
    echo ''
    printf "${normal}"
}

function begin_install_vimplus()
{
    copy_files
    install_fonts_on_linux
    download_vim_plug
    install_vim_plugin
    compile_ycm_on_linux
    chown_dir
    print_logo
}

# 在ubuntu发行版安装vimplus
function install_vimplus_on_ubuntu()
{
    install_prepare_software_on_ubuntu
    begin_install_vimplus
}

# 在linux平台安装vimplus
function install_vimplus_on_linux()
{
    install_vimplus_on_ubuntu
}

# main函数
function main()
{
	install_vimplus_on_linux
}

# 调用main函数
echo -n "You will install vimplus(include YouCompleteMe...) without GUI,it's use Ubuntu 14.04 and laster(i386 and x86_64),Centos 7 x86_64,are you sure[y/n]"
read  your_option
if [ ${your_option} == "y" ]; then
    echo "Install vimplus begining..."
    main
else
    echo "Stop install vimplus"
fi
