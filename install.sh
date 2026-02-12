#!/bin/bash
echo '
export PS1="\e[38;2;136;57;239m\u@sandbox:\w \n>\e[0m"
' >> ~/.bashrc

echo "\
alias cm='chmod u+x'\n\
alias ga='git add'\n\
alias gs='git status'\n\
alias gc='git commit -m'\n\
alias gp='git push'\n\
" >> ~/.bash_aliases

git config --global user.email "sebastionprice@gmail.com"
git config --global user.name "Sebastion"
git config --global credential.helper 'cache --timeout=7200'

git clone https://github.com/Opabinia9/holbertonschool-low_level_programming.git

source ~/.bashrc
