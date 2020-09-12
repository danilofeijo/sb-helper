#
# Hard linked to:
# ~/.bash_aliases
#

#######################################################
#                                                     #
#         Bash Aliases                                #
#                                                     #
#######################################################

#-----------------------------------------------------#
#         Aliases                                     #
#-----------------------------------------------------#

alias sblinuxupdate='linuxUpdate'
alias upterm='rebootTerminal'
alias cl='accessAndList'
alias mkcd='createAndAccess'

# Zsh
alias zzz='clear && zsh'  # Only if you have Zsh
alias zz='exit'

# Project
alias gotoproject='cd ~/folder00/project_folder/'
alias runsomething='cd ~/folder00/project_folder/ && ./bashFile.sh'


#-----------------------------------------------------#
#         Functions                                   #
#-----------------------------------------------------#

function linuxUpdate() {
  # Updates the list of available packages and their versions
  sudo apt update
  # Installs newer versions of the packages you have
  sudo apt -y upgrade
  # Remove dependencies that is no longer used
  sudo apt -y autoremove
  # Clear out the local repository of retrieved package files
  sudo apt -y autoclean
  # Clear Apt Cache - Reference https://www.fossmint.com/keep-ubuntu-system-clean/
  sudo apt-get clean
}

function rebootTerminal () {
  source ~/.zshrc
  echo
  echo '>>  Terminal Updated! --> SB!  <<'
  echo
}

function accessAndList () {
  DIR="$*";
  # if no DIR given, go home
  if [ $# -lt 1 ]; then
    DIR=$HOME;
  fi;
  builtin cd "${DIR}" && \
  # use your preferred ls command
    ls -F --color=auto
}

function createAndAccess () {
  mkdir -p -- "$1"
  chmod -R +777 -- "$1"
  cd -- "$1"
}
