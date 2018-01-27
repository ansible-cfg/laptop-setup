
REPO="https://github.com/brpaz/laptop-setup.git"
SETUP_DIR="$HOME/setup"
CLONE_DIR="$SETUP_DIR/playbooks"

echo "\033[33m---------------------------------------------------------------------[0m"
echo "\033[33mPerforming initial system update and installing base dependencies\033[0m"
echo "\033[33m---------------------------------------------------------------------[0m"
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y
sudo apt-get install -y python-pip python-apt python-setuptools git-core python-dev libxml2-dev libxslt-dev wget

mkdir -p $SETUP_DIR

cd $SETUP_DIR

if [ ! -d "$CLONE_DIR" ]; then
  echo "\033[33m---------------------------------------------------------------------[0m"
  echo "\033[33mCloning playbook repository onto $CLONE_DIR\033[0m"
  echo "\033[33m---------------------------------------------------------------------[0m"
  git clone $REPO $CLONE_DIR
  cd $CLONE_DIR
else
  cd $CLONE_DIR
  echo "\033[33m---------------------------------------------------------------------[0m"
  echo -e "\033[33mUpdating playbooks $CLONE_DIR\033[0m"
  echo "\033[33m---------------------------------------------------------------------[0m"
  git reset HEAD --hard &&  git pull
fi

echo "\033[33m---------------------------------------------------------------------[0m"
echo  "\033[33mInstalling setup dependencies\033[0m"
echo "\033[33m---------------------------------------------------------------------[0m"
sudo pip install -r requirements.txt

sudo chmod +x scripts/get_latest_gh_release.sh 
sudo cp scripts/get_latest_gh_release.sh /usr/local/bin

echo "\033[33m---------------------------------------------------------------------[0m"
echo  "\033[33mRunning setup playbook\033[0m"
echo "\033[33m---------------------------------------------------------------------[0m"
ansible-playbook setup.yml -i HOSTS --ask-become-pass --module-path ./ansible_modules

if [ ! $? -eq 0 ]; then
    echo  "\033[33mError running ansible playbooks. Aborting ...\033[0m"
    exit -1
if

dropbox start -i

sudo tlp start

exec zsh

echo  "\033[33m<<EOF
Machine provisioned with success.
A todo.txt file was created on your desktop indicating some manual steps to take after.
EOF\033[0m"

tee  ~/Desktop/setup.txt <<'EOF'
Next Steps:
  - Install crashplan
  - Install robo3t
  - Install gravit designer
  - Sync vscode settings
  - Sync PHPStorm Settings
  - Sync Google Chrome and Firefox
  - Login into applications
EOF

exit 0