#
# .zshrc
#
# @author Wim Wenigerkind
#

# Include alias file (if present) containing aliases for ssh, etc.
if [ -f ~/.aliases ]
then
  source ~/.aliases
fi

# Enter a running Docker container.
function denter() {
 if [[ ! "$1" ]] ; then
     echo "You must supply a container ID or name."
     return 0
 fi

 docker exec -it $1 bash
 return 0
}

# Ask for confirmation when 'prod' is in a command string.
prod_command_trap () {
  if [[ $BASH_COMMAND == *prod* ]]
  then
    read -p "Are you sure you want to run this command on prod [Y/n]? " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
      echo -e "\nRunning command \"$BASH_COMMAND\" \n"
    else
      echo -e "\nCommand was not run.\n"
      return 1
    fi
  fi
}

# Alias Section
alias wim='vim'
alias d='docker'
alias bc='bin/console'
alias bcdmm='bin/console doctrine:migrations:migrate'
alias goDev='cd ~/Development/'
alias goOneDev='cd ~/OneDrive/development/'
alias goSym='cd ~/SymfonyProjects/'
alias ll='ls -la'
alias up='cd ..'