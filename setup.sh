
REPO=" https://github.com/brpaz/laptop-setup.git"
SETUP_DIR="$HOME/setup"
CLONE_DIR="playbooks"

echo -e "\033[33mPerforming initial system update\033[0m"
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y
sudo apt-get install -y python-pip python-setuptools git python-dev libxml2-dev libxslt-dev wget

mkdir -p "$SETUP_DIR/downloads"

cd $SETUP_DIR
if [ -d "$CLONE_DIR" ]; then
  echo -e "\033[33mCloning playbooks\033[0m"
  git clone $REPO $CLONE_DIR
fi

cd $CLONE_DIR

echo -e "\033[33mStarting playbook ...\033[0m"
sudo pip install -r requirements.txt
ansible-playbook setup.yml -i HOSTS --ask-become-pass --module-path ./ansible_modules

if [ !$? -eq 0 ]; then 
  exit -1
fi

dropbox start -i

sudo tlp start

exec zsh

echo -e "\033[33m<<EOF
Machine provisioned with success.
Next Steps:
    - Install crashplan
    - Install robo3t
    - Sync vscode settings
    - Sync PHPStorm Settings
    - Sync Google Chrome and Firefox
    - Login into applications
EOF\033[0m"

exit 0