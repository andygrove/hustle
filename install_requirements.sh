#!/usr/bin/env bash

if [[ `uname` == "Darwin" ]]; then
		brew update && brew bundle --file=Brewfile
elif [[ `uname` == "Linux" ]]; then
		wget https://cmake.org/files/v3.15/cmake-3.15.5.tar.gz
		tar -xzvf cmake-3.15.5.tar.gz
		rm -f cmake-3.15.5.tar.gz
		cd cmake-3.15.5 && ./bootstrap && make -j 6 && sudo make install
		rm -rf cmake-3.15.5
		sudo add-apt-repository ppa:ubuntu-toolchain-r/test --yes
		sudo apt-get update
		sudo apt-get install gcc-9 g++-9 --yes
		sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 60 --slave /usr/bin/g++ g++ /usr/bin/g++-9
		# For arrow
		#sudo apt-get install \
		#     build-essential \
		#     cmake \
		#     libboost-filesystem-dev \
		#     libboost-regex-dev \
		#     libboost-system-dev
fi