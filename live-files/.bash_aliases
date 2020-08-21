#
# Hard linked to:
# ~/.bash_aliases
#

#######################################################
#                                                     #
#   Welcome to Super Bash Helper                      #
#     Your superhero after Linux formating            #
#                                                     #
#     How to make it work:                            #
#       - Download this file                          #
#       - Put downloaded file on "~/" directory       #
#       - Close all terminal windows                  #
#                                                     #
#     Check if it works:                              #
#       - Open a new terminal and run                 #
#         - sbstatus                                  #
#                                                     #
#     Version:                                        #
#       1.5                                           #
#                                                     #
#######################################################

#-----------------------------------------------------#
#         Aliases                                     #
#-----------------------------------------------------#

# Default
alias sbstatus='_status'
alias sblinuxupdate='_linux_update'
alias sbsetup_essentials='_setup_essentials'
alias sbsetup_regular='_setup_regular'
alias sbsetup_all='_setup_all'

sbdisable_touchscreen () {
  sudo xinput set-prop 'ELAN Touchscreen' 'Device Enabled' 0
  # Reference
  # http://www.cleuber.com.br/index.php/2016/03/14/como-desabilitar-tela-de-touch-screen-no-linux
}

mkcd () {
  mkdir -p -- "$1"
  chmod -R +777 -- "$1"
  cd -- "$1"
}

cdls () {
  cd $1 && ls
}

# Personal
alias zzz='_open_zsh'  # Only if you have Zsh
alias zz='exit'

# Project

# Examples
alias gotoproject='cd ~/folder00/folder01/folder02/folder03/project_folder/'
alias runsomething='cd ~/folder00/folder01/folder02/folder03/project_folder/ && ./bashFile.sh'

# <add new alias below>

#-----------------------------------------------------#
#         Functions - Personal                        #
#-----------------------------------------------------#

_open_zsh() {
  clear
  zsh
}

#-----------------------------------------------------#
#         Functions - Basics                          #
#-----------------------------------------------------#

_status() {
  echo
  echo "Super Bash Helper is ready to save your time!"
  echo
}

_create_default_folders() {
  sudo mkdir ~/studyspace   # A place for your studing projects
  sudo mkdir ~/workspace    # A place for your professional projects
  sudo chmod -R +777 studyspace
  sudo chmod -R +777 workspace
}

_setup_essentials() {
  # Essential Packages
  _install_snap
  _install_gdebi
  _install_xclip
  _install_git
  _install_vim
  _install_curl
  _install_node_version_manager
  # _install_chrome - not needed for now
}

_setup_regular() {
  # Regular Packages
  # _install_aws_cli
  _install_flameshot
  # _install_hyper
  # _install_notepadqq
  _install_peek
  _install_postman
  _install_spotify
  _install_vscode
}

_setup_all() {
  # Basics
  _create_default_folders
  _setup_essentials

  # Regular Packages
  _setup_regular
}

_linux_update() {
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

#-----------------------------------------------------#
#         Functions - Essentials Install              #
#-----------------------------------------------------#

_install_snap() {
  sudo apt update
  sudo apt install snapd
  # Reference
  # https://snapcraft.io/docs/installing-snap-on-ubuntu
}

_install_gdebi() {
  sudo apt install gdebi -y
}

_install_git() {
  sudo apt install git -y
}

_install_vim() {
  sudo apt-get install vim -y
}

_install_curl() {
  sudo apt install curl -y
}

_install_xclip() {
  sudo apt install xclip
}

_install_chrome() {
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome-stable_current_amd64.deb
}

_install_node_version_manager() {
  _install_curl
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
  bash install_nvm.sh
  source ~/.profile
  nvm --version             # Verify your nvm version
  nvm install node          # "node" is an alias for the latest version
  # nvm use v12             # Change to an installed node version
  # nvm alias default v12   # Set a node version as default
  # Reference
  # https://github.com/nvm-sh/nvm#git-install
  # https://medium.com/@nbanzyme/easy-way-to-install-nvm-on-ubuntu-18-04-2cfb19ee5391
}


#-----------------------------------------------------#
#         Functions - Regular Install                 #
#-----------------------------------------------------#

_install_aws_cli() {
  # Reference
  # https://linuxhint.com/install_aws_cli_ubuntu/

  sudo snap install aws-cli --classic
  echo "##################################################"
  echo "####    Starting AWS profile configuration    ####"
  echo "##################################################"
  aws configure
  # aws configure set aws_access_key_id default_access_key
  # aws configure set aws_secret_access_key default_secret_key
  # aws configure set default.region us-west-2
  # aws configure set default.ca_bundle /path/to/ca-bundle.pem
}

_install_flameshot() {
  sudo apt install flameshot -y
}

_install_hyper() {
  wget https://hyper-updates.now.sh/download/linux_deb
  sudo gdebi linux_deb
}

_install_notepadqq() {
  sudo snap install notepadqq
}

_install_peek() {
  sudo add-apt-repository ppa:peek-developers/stable -y
  sudo apt update
  sudo apt install peek -y
  # Reference
  # https://github.com/phw/peek#ubuntu
}

_install_postman() {
  sudo snap install postman
  # Reference
  # https://snapcraft.io/postman
  # https://blog.bluematador.com/posts/postman-how-to-install-on-ubuntu-1604/
}

_install_spotify() {
  sudo snap install spotify
}

_install_vscode() {
  sudo snap install --classic code
  # Reference
  # https://code.visualstudio.com/docs/setup/linux

  # Install VSCode extensions
  # code --install-extension truman.autocomplate-shell
  code --install-extension aaron-bond.better-comments
  code --install-extension CoenraadS.bracket-pair-colorizer
  code --install-extension nwhatt.chai-snippets
  code --install-extension naumovs.color-highlight
  code --install-extension flydreame.docblocker
  code --install-extension dracula-theme.theme-dracula
  # code --install-extension editorconfig.editorconfig
  code --install-extension spoonscen.es6-mocha-snippets
  code --install-extension dbaeumer.vscode-eslint
  # code --install-extension amandeepmittal.expressjs
  code --install-extension codezombiech.gitignore
  code --install-extension eamodio.gitlens
  code --install-extension oderwat.indent-rainbow
  # code --install-extension orta.vscode-jest
  # code --install-extension firsttris.vscode-jest-runner
  # code --install-extension andys8.jest-snippets
  # code --install-extension ms-vsliveshare.vsliveshare
  code --install-extension yzhang.markdown-all-in-one
  code --install-extension eg2.vscode-npm-script
  code --install-extension zhuangtongfa.material-theme
  # code --install-extension maty.vscode-mocha-sidebar
  code --install-extension techer.open-in-browser
  code --install-extension esbenp.prettier-vscode
  code --install-extension alefragnani.project-manager
  # code --install-extension mechatroner.rainbow-csv
  code --install-extension foxundermoon.shell-format
  code --install-extension laurenttreguier.vscode-simple-icons
  # code --install-extension stevejpurves.cucumber
  # code --install-extension redhat.vscode-yaml
  code --install-extension gruntfuggly.todo-tree
}
