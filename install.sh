#!/bin/bash
mv ~/.bashrc ~/.bashrc.bak
wget https://raw.githubusercontent.com/Opabinia9/sandbox_setup/refs/heads/main/.bashrc -o ~/.bashrc

#echo '
#export PS1="\e[38;2;136;57;239m\u@sandbox:\w \n>\e[0m"
#' >> ~/.bashrc

#wget -o ~/.bash_aliases

echo "
alias cm='chmod u+x'
alias ga='git add'
alias gs='git status'
alias gc='git commit -m'
alias gp='git push'
" >> ~/.bash_aliases

git config --global user.email "sebastionprice@gmail.com"
git config --global user.name "Sebastion"
git config --global credential.helper 'cache --timeout=7200'

git clone https://github.com/Opabinia9/git-intro.git
git clone https://github.com/Opabinia9/holbertonschool-shell.git
git clone https://github.com/Opabinia9/holbertonschool-low_level_programming.git

echo "-Wall -pedantic -Werror -Wextra -std=gnu89" > holbertonschool-low_level_programming/flags

source ~/.bashrc
