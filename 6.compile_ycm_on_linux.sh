#!/bin/bash


# 在linux平台编译ycm插件
function compile_ycm_on_linux()
{
	sudo apt-get -y install cmake
    system_version=$(cat /etc/lsb-release | grep "DISTRIB_RELEASE")
    system_codename=$(cat /etc/lsb-release | grep "DISTRIB_CODENAME")
    system_arch=`arch`
    is_compile_ycm=0
    if [ ${system_arch} == "x86_64" ]; then
       if [ ${system_version} == "DISTRIB_RELEASE=14.04" ] || [ ${system_version} == "DISTRIB_RELEASE=16.04" ] || [ ${system_version} == "DISTRIB_RELEASE=18.04" ]; then
            is_compile_ycm=1
			#自动编译
            #cd ~/.vim/plugged/YouCompleteMe
            #sudo ./install.py --clang-completer
			#手动编译
			xz -d *.tar.xz
			mkdir clang
			tar -xf *.tar --strip-components=1 -C clang
			
			sudo rm -r ycm_build
			mkdir ycm_build
			cd ycm_build
			cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=${PWD}/../clang . ~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp -DUSE_PYTHON2=OFF
			cmake --build . --target ycm_core
			cd -
			
			sudo rm -r regex_build
			mkdir regex_build
			cd regex_build
			cmake -G "Unix Makefiles" . ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/cregex -DUSE_PYTHON2=OFF
			cmake --build . --target _regex
			cd -
       fi 
    fi
    
    if [ ${is_compile_ycm} == 0 ]; then
        if [ ${system_version} == "DISTRIB_RELEASE=14.04" ]; then
            sudo echo -e "\n" | sudo add-apt-repository ppa:ubuntu-toolchain-r/test
            #echo -e "\n"
        fi
        sudo cp /etc/apt/sources.list /etc/apt/sources.list.bakAfterLLVM
        echo -e "deb http://apt.llvm.org/${system_codename#*=}/ llvm-toolchain-trusty-7 main" >> /etc/apt/sources.list
        #echo -e "deb-src http://apt.llvm.org/${system_codename#*=}/ llvm-toolchain-trusty-7 main" >> /etc/apt/sources.list
        wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -
        sudo apt-get update
        sudo apt-get -y install clang-7 cmake
        
		sudo rm -r ycm_build
        mkdir ycm_build
        cd ycm_build
        cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON . ~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp -DUSE_PYTHON2=OFF
        cmake --build . --target ycm_core
		cd -
        
		sudo rm -r regex_build
        mkdir regex_build
        cd regex_build
        cmake -G "Unix Makefiles" . ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/cregex
        cmake --build . --target _regex
		cd -
		
    fi   
}

compile_ycm_on_linux