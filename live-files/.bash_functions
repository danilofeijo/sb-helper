#
# Hard linked to:
# ~/.bash_functions
#

#######################################################
#                                                     #
#         Bash Functions                              #
#                                                     #
#######################################################

#-----------------------------------------------------#
#         Basic Setup                                 #
#-----------------------------------------------------#

function setDefaultfolders() {
  echo
  echo '>>  Creating default folders --> SB!  <<'
  echo
  sudo mkdir ~/labspace   # A place for your studing projects
  sudo mkdir ~/workspace    # A place for your professional projects
  sudo chmod -R +777 studyspace
  sudo chmod -R +777 workspace
  echo
  echo '>>  Finished --> SB!  <<'
  echo
}

function setDefaultHardLinks() {
  echo
  echo '>>  Creating default hard links for config files --> SB!  <<'
  echo
  ln -f ~/labspace/sb-helper/live-files/.bash_aliases ~/.bash_aliases
  ln -f ~/labspace/sb-helper/live-files/.bash_functions ~/.bash_functions
  ln -f ~/labspace/sb-helper/live-files/.bashrc ~/.bashrc
  ln -f ~/labspace/sb-helper/live-files/.zshrc ~/.zshrc
  ln -f ~/labspace/sb-helper/live-files/config ~/.config/terminator/config
  ln -f ~/labspace/sb-helper/live-files/keybindings.json ~/.config/Code/User/keybindings.json
  ln -f ~/labspace/sb-helper/live-files/projects.json ~/.config/Code/User/globalStorage/alefragnani.project-manager/projects.json
  ln -f ~/labspace/sb-helper/live-files/settings.json ~/.config/Code/User/settings.json
  echo
  echo '>>  Finished --> SB! <<'
  echo
}

function bitbucketSSHKeyGen () {
  echo
  echo '>>  Creating a new Bitbucket SSH Key --> SB!  <<'
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
  echo
  echo '>>  Finished --> SB! <<'
  echo
  # Reference
  # https://support.atlassian.com/bitbucket-cloud/docs/set-up-an-ssh-key/#SetupanSSHkey-ssh2
}

function disableTouch () {
  echo
  echo '>>  Disabling laptop touchscreen --> SB!  <<'
  echo
  sudo xinput set-prop 'ELAN Touchscreen' 'Device Enabled' 0
  echo
  echo '>>  Finished --> SB! <<'
  echo
  # Reference
  # http://www.cleuber.com.br/index.php/2016/03/14/como-desabilitar-tela-de-touch-screen-no-linux
}


#-----------------------------------------------------#
#         Install Programs                            #
#-----------------------------------------------------#

#---- >> Essential << --------------------------------#

function installSnap() {
  echo
  echo '>>  Installing snapcraft --> SB!  <<'
  echo
  sudo apt update
  sudo apt install snapd
  echo
  echo '>>  Finished --> SB!  <<'
  echo
  # Reference
  # https://snapcraft.io/docs/installing-snap-on-ubuntu
}

function installGDebi() {
  echo
  echo '>>  Installing GDebi --> SB!  <<'
  echo
  sudo apt install gdebi -y
  echo
  echo '>>  Finished --> SB!  <<'
  echo
}

function installGit() {
  echo
  echo '>>  Installing Git --> SB!  <<'
  echo
  sudo apt install git -y
  echo
  echo '>>  Finished --> SB!  <<'
  echo
}

function installVim() {
  echo
  echo '>>  Installing Vim --> SB!  <<'
  echo
  sudo apt-get install vim -y
  echo
  echo '>>  Finished --> SB!  <<'
  echo
}

function installCurl() {
  echo
  echo '>>  Installing Curl --> SB!  <<'
  echo
  sudo apt install curl -y
  echo
  echo '>>  Finished --> SB!  <<'
  echo
}


#---- >> Basic << ------------------------------------#

function installZshFull() {
  echo
  echo '>>  Installing Zsh --> SB!  <<' # Not as root user
  echo
  sudo apt install zsh -y

  echo
  echo '>>  Installing Oh-my-zsh --> SB!  <<' # Not as root user
  echo
  wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
  # Copy the template .zshrc.zsh-template configuration file to the home directory .zshrc
  # cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
  # Apply settings previously set
  source ~/.zshrc

  echo
  echo '>>  Installing zsh-better-npm-completion --> SB!  <<' # Not as root user
  echo
  git clone https://github.com/lukechilds/zsh-better-npm-completion ~/.oh-my-zsh/custom/plugins/zsh-better-npm-completion

  echo
  echo '>>  Finished --> SB!  <<'
  echo
  # Reference
  # https://www.howtoforge.com/tutorial/how-to-setup-zsh-and-oh-my-zsh-on-linux/
  # https://github.com/lukechilds/zsh-better-npm-completion
}

function installNvm() {
  echo
  echo '>>  Installing NVM - Node Version Manager --> SB!  <<'
  echo
  # Requires curl
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
  bash install_nvm.sh
  source ~/.profile
  nvm --version             # Verify your nvm version
  nvm install node          # "node" is an alias for the latest version
  # nvm use v12             # Change to an installed node version
  # nvm alias default v12   # Set a node version as default
  echo
  echo '>>  Finished --> SB!  <<'
  echo
  # Reference
  # https://github.com/nvm-sh/nvm#git-install
  # https://medium.com/@nbanzyme/easy-way-to-install-nvm-on-ubuntu-18-04-2cfb19ee5391
}

function installPostman() {
  echo
  echo '>>  Installing Postman --> SB!  <<'
  echo
  sudo snap install postman
  echo
  echo '>>  Finished --> SB!  <<'
  echo
  # Reference
  # https://snapcraft.io/postman
  # https://blog.bluematador.com/posts/postman-how-to-install-on-ubuntu-1604/
}

function installVSCcode() {
  echo
  echo '>>  Installing VSCode --> SB!  <<'
  echo
  sudo snap install --classic code

  echo
  echo '>>  Installing VSCode extensions --> SB!  <<'
  echo
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
  echo
  echo '>>  Finished --> SB!  <<'
  echo
  # Reference
  # https://code.visualstudio.com/docs/setup/linux
}

function installFlameshot() {
  echo
  echo '>>  Installing Flameshot --> SB!  <<'
  echo
  sudo apt install flameshot -y
  echo
  echo '>>  Finished --> SB!  <<'
  echo
}

function installPeek() {
  echo
  echo '>>  Installing Peek --> SB!  <<'
  echo
  sudo add-apt-repository ppa:peek-developers/stable -y
  sudo apt update
  sudo apt install peek -y
  echo
  echo '>>  Finished --> SB!  <<'
  echo
  # Reference
  # https://github.com/phw/peek#ubuntu
}


#---- >> Regular << ----------------------------------#

function installSpotify() {
  echo
  echo '>>  Installing Spotify --> SB!  <<'
  echo
  sudo snap install spotify
  echo
  echo '>>  Finished --> SB!  <<'
  echo
}

function installChrome() {
  echo
  echo '>>  Installing Google Chrome --> SB!  <<'
  echo
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome-stable_current_amd64.deb
  echo
  echo '>>  Finished --> SB!  <<'
  echo
}

function installAWSCli() {
  echo
  echo '>>  Installing AWS cli --> SB!  <<'
  echo
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
  echo
  echo '>>  Finished --> SB!  <<'
  echo
  # Reference
  # https://linuxhint.com/install_aws_cli_ubuntu/
}

function installNotepadqq() {
  echo
  echo '>>  Installing Notepad++ --> SB!  <<'
  echo
  sudo snap install notepadqq
  echo
  echo '>>  Finished --> SB!  <<'
  echo
}
