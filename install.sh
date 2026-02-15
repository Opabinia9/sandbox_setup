#!/bin/bash
if [[ -f ~/.bashrc ]]; then
	mv ~/.bashrc ~/.bashrc.bak;
fi
wget https://raw.githubusercontent.com/Opabinia9/sandbox_setup/refs/heads/main/.bashrc -o ~/.bashrc

#echo '
#export PS1="\e[38;2;136;57;239m\u@sandbox:\w \n>\e[0m"
#' >> ~/.bashrc

if [[ -f ~/.bash_aliases ]]; then
	mv ~/.bash_aliases~/.bash_aliases.bak;
fi
wget https://raw.githubusercontent.com/Opabinia9/sandbox_setup/refs/heads/main/.bash_aliases -o ~/.bash_aliases

git config --global user.email "sebastionprice@gmail.com"
git config --global user.name "Sebastion"
git config --global credential.helper 'cache --timeout=7200'

if [[ ! -f ~/git-intro ]]; then
	git clone https://github.com/Opabinia9/git-intro.git;
fi
if [[ ! -f ~/holbertonschool-shell ]]; then
	git clone https://github.com/Opabinia9/holbertonschool-shell.git;
fi
if [[ ! -f ~/holbertonschool-low_level_programming ]]; then
	git clone https://github.com/Opabinia9/holbertonschool-low_level_programming.git;
fi

echo "-Wall -pedantic -Werror -Wextra -std=gnu89" > holbertonschool-low_level_programming/flags

source ~/.bashrc
