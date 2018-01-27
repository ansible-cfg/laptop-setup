
REPO="https://github.com/brpaz/laptop-setup.git"
SETUP_DIR="$HOME/setup"
CLONE_DIR="playbooks"

echo -e "\033[33mPerforming initial system update and installing base dependencies\033[0m"
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y
sudo apt-get install -y python-pip python-apt python-setuptools git-core python-dev libxml2-dev libxslt-dev wget

mkdir -p $SETUP_DIR

cd $SETUP_DIR
if [ -d "$CLONE_DIR" ]; then
  echo -e "\033[33mCloning playbook repository onto $CLONE_DIR\033[0m"
  git clone $REPO $CLONE_DIR
fi

cd $CLONE_DIR

echo -e "\033[33mStarting playbook ...\033[0m"
sudo pip install -r requirements.txt

sudo chmod +x scripts/get_latest_release.sh 
sudo mv scripts/get_latest_gh_release.sh /usr/local/bin

ansible-playbook setup.yml -i HOSTS --ask-become-pass --module-path ./ansible_modules

if [ ! $? -eq 0 ]; then
    echo -e "\033[33mError running ansible playbooks. Aborting ...\033[0m"
    exit -1
if

dropbox start -i

sudo tlp start

exec zsh

echo -e "\033[33m<<EOF
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