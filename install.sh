#!/bin/bash
export PS1="\e[38;2;136;57;239m\u@sandbox:\w \n>\e[0m"

alias cm='chmod u+x'
alias ga='git add'
alias gs='git status'
alias gc='git commit -m'
alias gp='git push'

git config --global user.email "sebastionprice@gmail.com"
git config --global user.name "Sebastion"
git config --global credential.helper 'cache --timeout=7200'

git clone https://github.com/Opabinia9/holbertonschool-low_level_programming.git
