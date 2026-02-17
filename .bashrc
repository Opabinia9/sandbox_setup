# work in progress, adding git status

source $HOME/.bash_aliases;

MPC="\e[38;2;25;249;216m";
AE="\e[0m";

function parse_git_dirty() {
        [[ $(git status --porcelain 2> /dev/null) ]] && echo "*";
}
function parse_git_branch() {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/";
}
prompt() {
        PS1=$(printf "%s%s%*s%s" "\[$MPC\]" "\u@sandbox:\w jobs:\j" "$(tput cols)" "$(parse_git_branch)\r" "\n>\[$AE\]");
}
PROMPT_COMMAND=prompt
