# work in progress, adding git status

source $HOME/.bash_aliases;

###Colors
CYAN="\[\e[38;2;25;249;216m\]";

MPC=$CYAN;
AE="$(tput sgr0)";

###VCS_PROMPT
VCS_F_UNTRACKED(){
	VCS_UNTRACKED=$(git status --porcelain |sed 's/^ //'| grep ^"??" | wc -l);
	VCS_S_UNTRACKED="?"
	if [[ "$VCS_UNTRACKED" > 0 ]]; then
		echo "$VCS_S_UNTRACKED$VCS_UNTRACKED" | xargs | cat - <(echo " ") | tr -d '\n';
	fi
}

VCS_F_UNSTAGED(){
	VCS_UNSTAGED=$(git status --porcelain |sed 's/^ //'| grep ^M | wc -l);
	VCS_S_UNSTAGED="!"
	if [[ "$VCS_UNSTAGED" > 0 ]]; then
		echo "$VCS_S_UNSTAGED$VCS_UNSTAGED" | xargs | cat - <(echo " ") | tr -d '\n';
	fi
}

VCS_F_UNCOMMITED(){
	VCS_UNCOMMITED=$(git status --porcelain |sed 's/^ //'| grep ^"A" | wc -l);
	VCS_S_UNCOMMITED="+"
	if [[ "$VCS_UNCOMMITED" > 0 ]]; then
		echo "$VCS_S_UNCOMMITED$VCS_UNTCOMMITED" | xargs | cat - <(echo " ") | tr -d '\n';
	fi
}

VCS_F_BEHIND(){
	VCS_BEHIND=$(git rev-list --count HEAD..@{u});
	VCS_S_BEHIND="⇣"
	if [[ "$VCS_BEHIND" > 0 ]]; then
		echo "$VCS_S_BEHIND$VCS_BEHIND" | xargs | cat - <(echo " ") | tr -d '\n';
	fi
}

VCS_F_AHEAD(){
	VCS_AHEAD=$(git rev-list --count @{u}..HEAD);
	VCS_S_AHEAD="⇡"
	if [[ "$VCS_AHEAD" > 0 ]]; then
		echo "$VCS_S_AHEAD$VCS_AHEAD" | xargs | cat - <(echo " ") | tr -d '\n';
	fi
}

VCS_PROMPT(){
	VCS_BRANCH=$(git branch --show-current 2>/dev/null);
	if [ "$VCS_BRANCH" ]; then
		echo "($VCS_BRANCH $(VCS_F_UNTRACKED)$(VCS_F_UNSTAGED)$(VCS_F_UNCOMMITED)$(VCS_F_BEHIND)$(VCS_F_AHEAD))"
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
