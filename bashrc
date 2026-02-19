# work in progress, adding git status

source $HOME/.bash_aliases;

###Colors
CYAN="\[\e[38;2;25;249;216m\]";

MPC=$CYAN;
AE="$(tput sgr0)";

###VCS_PROMPT
VCS_F_UNTRACKED(){
	VCS_UNTRACKED=$(git status --porcelain | grep "??" | wc -l);
	VCS_S_UNTRACKED="?"
	if [[ "$VCS_UNTRACKED" > 0 ]]; then
		echo "$VCS_S_UNTRACKED$VCS_UNT";
	fi
}

VCS_PROMPT(){
	VCS_BRANCH=$(git branch --show-current 2>/dev/null);
	if [ "$VCS_BRANCH" ]; then
		echo "($VCS_BRANCH $(VCS_F_UNTRACKED)"
	fi
}

###PROMPT
prompt() {
	L1="\u@sandbox:\w jobs:\j";
	R1="$(VCS_PROMPT)";
	L2="\n>$AE";
        PS1=$(printf "%s%*s%s%s" "$MPC" "$(tput cols)" "$R1\r" "$L1" "$L2");
}
PROMPT_COMMAND=prompt
