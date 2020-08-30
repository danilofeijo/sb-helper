#-----------------------------------------------------#
#         Aliases                                     #
#-----------------------------------------------------#

upterm () {
  source ~/.zshrc
  echo
  echo 'Terminal Updated!'
  echo
}

hifunc () {
  echo 'Hi There! SB'
}

function cl() {
  DIR="$*";
    # if no DIR given, go home
    if [ $# -lt 1 ]; then
      DIR=$HOME;
  fi;
  builtin cd "${DIR}" && \
  # use your preferred ls command
    ls -F --color=auto
}
