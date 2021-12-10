#!/bin/bash
# SB Functions

#######################################################
#                                                     #
#         Bash Functions                              #
#                                                     #
#######################################################

#-----------------------------------------------------#
#         Helpers                                     #
#-----------------------------------------------------#

function TEMPLATEMSG() {
  sleep 1
  echo
  echo " >>  SB - $1  <<"
  echo
}

function FINALMSG() {
  sleep 1
  echo
  echo " >>  Finished --> SB!  <<"
  echo
}

#-----------------------------------------------------#
#         Basic Setup                                 #
#-----------------------------------------------------#

function sbSetupInitial() {
  ACTION="Initial Setup by SB helper"
  TEMPLATEMSG "$ACTION"

  installSnap
  installGDebi
  installGit
  installVim
  installCurl
  installNvm
  installPostman
  installVSCcode
  installFlameshot
  installPeek
  installSpotify
  installZshFull
  installAWSCli
  setDefaultfolders
  createHardLinks

  FINALMSG
}

function helloWorld() {
  ACTION="Printing Hello World"
  TEMPLATEMSG "$ACTION"

  echo " Hello World!"

  FINALMSG
}

function setDefaultfolders() {
  ACTION="Creating default folders"
  TEMPLATEMSG "$ACTION"

  sudo mkdir ~/labspace  # A place for your studing projects
  sudo mkdir ~/workspace # A place for your professional projects
  sudo chmod -R +777 studyspace
  sudo chmod -R +777 workspace

  FINALMSG
}

function createHardLinks() {
  ACTION="Creating default hard links for config files"
  TEMPLATEMSG "$ACTION"

  ln -f ~/sb-helper/live-files/.bash_aliases ~/.bash_aliases
  ln -f ~/sb-helper/live-files/.bashrc ~/.bashrc
  ln -f ~/sb-helper/live-files/.zshrc ~/.zshrc
  ln -f ~/sb-helper/live-files/keybindings.json ~/.config/Code/User/keybindings.json
  ln -f ~/sb-helper/live-files/projects.json ~/.config/Code/User/globalStorage/alefragnani.project-manager/projects.json
  ln -f ~/sb-helper/live-files/settings.json ~/.config/Code/User/settings.json
  mkdir ~/.config/terminator
  ln -f ~/sb-helper/live-files/config ~/.config/terminator/config

  FINALMSG
}

function bitbucketSSHKeyGen() {
  ACTION="Creating a new Bitbucket SSH Key"
  TEMPLATEMSG "$ACTION"

  ssh-keygen
  echo
  echo "Check the keys generated ~/.ssh/"
  ls ~/.ssh
  eval "$(ssh-agent)"
  ssh-add ~/.ssh/id_rsa
  echo
  cat ~/.ssh/id_rsa.pub
  echo
  echo "- Select and copy the key output in the clipboard"
  echo "- Paste copied content 'Personal settings >> SSH keys >> Add key >> Key (field)'"
  echo

  FINALMSG
  # Reference
  # https://support.atlassian.com/bitbucket-cloud/docs/set-up-an-ssh-key/#SetupanSSHkey-ssh2
}

function disableTouch() {
  ACTION="Disabling laptop touchscreen"
  TEMPLATEMSG "$ACTION"

  sudo xinput set-prop "ELAN Touchscreen" "Device Enabled" 0

  FINALMSG
  # Reference
  # http://www.cleuber.com.br/index.php/2016/03/14/como-desabilitar-tela-de-touch-screen-no-linux
}

#-----------------------------------------------------#
#         Install Programs                            #
#-----------------------------------------------------#

#---- >> Essential << --------------------------------#

function installSnap() {
  ACTION="Installing snapcraft"
  TEMPLATEMSG "$ACTION"

  sudo apt update
  sudo apt install snapd

  FINALMSG
  # Reference
  # https://snapcraft.io/docs/installing-snap-on-ubuntu
}

function installGDebi() {
  ACTION="Installing GDebi"
  TEMPLATEMSG "$ACTION"

  sudo apt install gdebi -y

  FINALMSG
}

function installGit() {
  ACTION="Installing Git"
  TEMPLATEMSG "$ACTION"

  sudo apt install git -y

  FINALMSG
}

function installVim() {
  ACTION="Installing Vim"
  TEMPLATEMSG "$ACTION"

  sudo apt-get install vim -y

  FINALMSG
}

function installCurl() {
  ACTION="Installing Curl"
  TEMPLATEMSG "$ACTION"

  sudo apt install curl -y

  FINALMSG
}

#---- >> Basic << ------------------------------------#

function installZshFull() {
  ACTION="Installing Zsh"
  TEMPLATEMSG "$ACTION"

  sudo apt install zsh -y

  ACTION="Installing Oh-my-zsh"
  TEMPLATEMSG "$ACTION"

  wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
  # Copy the template .zshrc.zsh-template configuration file to the home directory .zshrc
  # cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
  # Apply settings previously set
  source "$HOME/.zshrc"

  ACTION="Installing zsh-better-npm-completion"
  TEMPLATEMSG "$ACTION"

  git clone https://github.com/lukechilds/zsh-better-npm-completion ~/.oh-my-zsh/custom/plugins/zsh-better-npm-completion

  FINALMSG
  # Reference
  # https://www.howtoforge.com/tutorial/how-to-setup-zsh-and-oh-my-zsh-on-linux/
  # https://github.com/lukechilds/zsh-better-npm-completion
}

function installNvm() {
  ACTION="Installing NVM - Node Version Manager"
  TEMPLATEMSG "$ACTION"

  # Requires curl
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
  bash install_nvm.sh
  source "$HOME/.profile"
  nvm --version # Verify your nvm version
  # nvm install v12
  # nvm install node          # "node" is an alias for the latest version
  # nvm use v12             # Change to an installed node version
  # nvm alias default v12   # Set a node version as default

  FINALMSG
  # Reference
  # https://github.com/nvm-sh/nvm#git-install
  # https://medium.com/@nbanzyme/easy-way-to-install-nvm-on-ubuntu-18-04-2cfb19ee5391
}

function installPostman() {
  ACTION="Installing Postman"
  TEMPLATEMSG "$ACTION"

  sudo snap install postman

  FINALMSG
  # Reference
  # https://snapcraft.io/postman
  # https://blog.bluematador.com/posts/postman-how-to-install-on-ubuntu-1604/
}

function installVSCcode() {
  ACTION="Installing VSCode"
  TEMPLATEMSG "$ACTION"

  sudo snap install --classic code

  ACTION="Installing VSCode extensions"
  TEMPLATEMSG "$ACTION"

  code --install-extension truman.autocomplate-shell
  code --install-extension aaron-bond.better-comments
  code --install-extension coenraads.bracket-pair-colorizer-2
  code --install-extension nwhatt.chai-snippets
  code --install-extension streetsidesoftware.code-spell-checker
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
  code --install-extension nitayneeman.puppeteer-snippets
  # code --install-extension mechatroner.rainbow-csv
  code --install-extension foxundermoon.shell-format
  code --install-extension laurenttreguier.vscode-simple-icons
  # code --install-extension stevejpurves.cucumber
  # code --install-extension redhat.vscode-yaml
  code --install-extension gruntfuggly.todo-tree

  FINALMSG
  # Reference
  # https://code.visualstudio.com/docs/setup/linux
}

function installFlameshot() {
  ACTION="Installing Flameshot"
  TEMPLATEMSG "$ACTION"

  sudo apt install flameshot -y

  FINALMSG
}

function installPeek() {
  ACTION="Installing Peek"
  TEMPLATEMSG "$ACTION"

  sudo add-apt-repository ppa:peek-developers/stable -y
  sudo apt update
  sudo apt install peek -y

  FINALMSG
  # Reference
  # https://github.com/phw/peek#ubuntu
}

#---- >> Regular << ----------------------------------#

function installSpotify() {
  ACTION="Installing Spotify"
  TEMPLATEMSG "$ACTION"

  sudo snap install spotify

  FINALMSG
}

function installChrome() {
  ACTION="Installing Google Chrome"
  TEMPLATEMSG "$ACTION"

  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome-stable_current_amd64.deb

  FINALMSG
}

function installAWSCli() {
  ACTION="Installing AWS CLI"
  TEMPLATEMSG "$ACTION"

  sudo snap install aws-cli --classic
  echo
  echo "#------------------------------------------------#"
  echo "#       Starting AWS profile configuration       #"
  echo "#------------------------------------------------#"
  echo
  aws configure
  # aws configure set aws_access_key_id default_access_key
  # aws configure set aws_secret_access_key default_secret_key
  # aws configure set default.region us-west-2
  # aws configure set default.ca_bundle /path/to/ca-bundle.pem

  FINALMSG
  # Reference
  # https://linuxhint.com/install_aws_cli_ubuntu/
}
