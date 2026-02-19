#!/bin/bash
gitsetup()
{
		git config --global user.email "$2";
		git config --global user.name "$3";
		git config --global credential.helper 'cache --timeout=7200';

		echo "and downloading your repops";
		for r in $4; do
			if [ ! -d "$HOME/$r" ]; then
				git clone "https://github.com/$1/$r.git";
			fi
		done;
}

rmdf()
{
		DF=("");
		read -p "Would you like to remove the defualt folders and files from the holberton sandbox\n$DF\ny/n: " -r remove;
		if [[ "$remove" == "y" ]];then
			for d in $DF; do
				echo "removing defualts!";
				rm "$d";
			done		
		else
			echo "righty-o, not removing";
		fi
}

if [[ $SHELL == *bash ]]; then
	echo "WARNING: UNTESETED";
	read -p "continue: y/n" ans;
	if [[ "$ans" == "y" ]]; then
		echo "Hello and thank you for picking me :)";
		read -p "Please enter your username" UN;
		read -p "Please enter your name" NAME;
		read -p "Please enter your email" EMAIL;
		REPOS=("git-intro" "holbertonschool-shell" "holbertonschool-low_level_programming");

		rmdf;

		echo "hello, getting bashrc and saving your old one";
		if [[ -f ~/.bashrc ]]; then
			mv $HOME/.bashrc $HOME/.bashrc.bak;
		fi
		wget https://raw.githubusercontent.com/Opabinia9/holberton-sandbox-setup/refs/heads/main/bashrc;

		echo "getting aliases and saving your old ones";
		if [[ -f $HOME/.bash_aliases ]]; then
			mv $HOME/.bash_aliases $HOME/.bash_aliases.bak;
		fi
		wget https://raw.githubusercontent.com/Opabinia9/holberton-sandbox-setup/refs/heads/main/bash_aliases;

		echo "configuring git";
		gitsetup "$UN" "$EMAIL" "$NAME" "$REPOS";

		source ~/.bashrc;
	fi
else
	echo "Sorry, this is ment for bash not $SHELL";
fi
