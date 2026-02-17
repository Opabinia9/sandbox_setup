#!/bin/bash
echo "hello, getting bashrc and saving your old one"
if [[ -f ~/.bashrc ]]; then
	mv $HOME/.bashrc $HOME/.bashrc.bak;
fi
wget https://raw.githubusercontent.com/Opabinia9/holberton-sandbox-setup/refs/heads/main/.bashrc

#echo '
#export PS1="\e[38;2;136;57;239m\u@sandbox:\w \n>\e[0m"
#' >> ~/.bashrc

echo "getting aliases and saving your old ones"
if [[ -f $HOME/.bash_aliases ]]; then
	mv $HOME/.bash_aliases $HOME/.bash_aliases.bak;
fi
wget https://raw.githubusercontent.com/Opabinia9/holberton-sandbox-setup/refs/heads/main/.bash_aliases

echo "configuring git"
git config --global user.email "sebastionprice@gmail.com"
git config --global user.name "Sebastion"
git config --global credential.helper 'cache --timeout=7200'

echo "and downloading your repops"
if [ ! -d "$HOME/git-intro" ]; then
	git clone https://github.com/Opabinia9/git-intro.git;
fi
if [ ! -d "$HOME/holbertonschool-shell" ]; then
	git clone https://github.com/Opabinia9/holbertonschool-shell.git;
fi
if [ ! -d "$HOME/holbertonschool-low_level_programming" ]; then
	git clone https://github.com/Opabinia9/holbertonschool-low_level_programming.git;
fi
if [ ! -d "$HOME/sandbox_setup" ]; then
	git clone https://github.com/Opabinia9/holberton-sandbox-setup.git;
fi

echo "-Wall -pedantic -Werror -Wextra -std=gnu89" > holbertonschool-low_level_programming/flags

source ~/.bashrc
