#
# Hard linked to:
# ~/.bash_functions
#

#-----------------------------------------------------#
#         Bash Functions                              #
#-----------------------------------------------------#

#-----------------------------------------------------#
#         Custom Commands                             #
#-----------------------------------------------------#

function status () {
  echo
  echo "Super Bash Helper is ready to help you!"
  echo
}

function upterm () {
  source ~/.zshrc
  echo
  echo 'Terminal Updated!'
  echo
}

function cl () {
  DIR="$*";
  # if no DIR given, go home
  if [ $# -lt 1 ]; then
    DIR=$HOME;
  fi;
  builtin cd "${DIR}" && \
  # use your preferred ls command
    ls -F --color=auto
}

function mkcd () {
  mkdir -p -- "$1"
  chmod -R +777 -- "$1"
  cd -- "$1"
}

function disabletouch () {
  sudo xinput set-prop 'ELAN Touchscreen' 'Device Enabled' 0
  # Reference
  # http://www.cleuber.com.br/index.php/2016/03/14/como-desabilitar-tela-de-touch-screen-no-linux
}


#-----------------------------------------------------#
#         Install and Setup                           #
#-----------------------------------------------------#

function setdefaultfolders() {
  sudo mkdir ~/labspace   # A place for your studing projects
  sudo mkdir ~/workspace    # A place for your professional projects
  sudo chmod -R +777 studyspace
  sudo chmod -R +777 workspace
}

