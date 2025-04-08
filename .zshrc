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

#### initialize completion system ####
# see https://unix.stackexchange.com/questions/593433/bash-like-autocompletion-for-ssh-command-in-zsh-shell-with-etc-hosts-file
# see https://zsh.sourceforge.io/Doc/Release/Completion-System.html
autoload -Uz compinit; compinit


# enable bash style autocomplete (requires compinit to be called before this)
# see https://stackoverflow.com/questions/3249432/can-a-bash-tab-completion-script-be-used-in-zsh
# see https://zsh.sourceforge.io/Doc/Release/Completion-System.html
autoload -Uz bashcompinit; bashcompinit


# replace the default ssh autocomplete that comes from compinit
# with this _complete_ssh_hosts function which looks for hosts in ~/.ssh/config and ~/.ssh/known_hosts
# Note: requires bashcompinit to enable this bash style autocomplete function
# see https://stackoverflow.com/questions/52438964/mac-autocomplete-for-ssh-hosts-in-terminal
# see https://gist.github.com/aliang/1024466
_complete_ssh_hosts ()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
                        cut -f 1 -d ' ' | \
                        sed -e s/,.*//g | \
                        grep -v ^# | \
                        uniq | \
                        grep -v "\[" ;
                cat ~/.ssh/config | \
                        grep "^Host " | \
                        awk '{print $2}'
                `
        COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
        return 0
}
complete -F _complete_ssh_hosts ssh