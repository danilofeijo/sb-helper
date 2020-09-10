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

function setDefaultHardLinks() {
  echo
  echo '>>  SB --> Creating default hard links for config files  <<'
  echo
  ln -f ~/labspace/sb-helper/live-files/.bash_aliases ~/.bash_aliases
  ln -f ~/labspace/sb-helper/live-files/.bash_functions ~/.bash_functions
  ln -f ~/labspace/sb-helper/live-files/.bashrc ~/.bashrc
  ln -f ~/labspace/sb-helper/live-files/.zshrc ~/.zshrc
  ln -f ~/labspace/sb-helper/live-files/config ~/.config/terminator/config
  ln -f ~/labspace/sb-helper/live-files/keybindings.json ~/.config/Code/User/keybindings.json
  ln -f ~/labspace/sb-helper/live-files/projects.json ~/.config/Code/User/globalStorage/alefragnani.project-manager/projects.json
  ln -f ~/labspace/sb-helper/live-files/settings.json ~/.config/Code/User/settings.json
}

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

function bitbucketsshkeygen () {
  echo
  echo '>>  SB --> Creating a new Bitbucket SSH Key  <<'
  echo
  ssh-keygen
  echo
  echo 'Check the keys generated ~/.ssh/'
  ls ~/.ssh
  eval `ssh-agent`
  ssh-add ~/.ssh/id_rsa
  echo
  cat ~/.ssh/id_rsa.pub
  echo
  echo '- Select and copy the key output in the clipboard'
  echo '- Paste copied content "Personal settings >> SSH keys >> Add key >> Key (field)"'
  echo
  # Reference
  # https://support.atlassian.com/bitbucket-cloud/docs/set-up-an-ssh-key/#SetupanSSHkey-ssh2
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

