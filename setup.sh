
REPO="https://github.com/brpaz/laptop-setup.git"
SETUP_DIR="$HOME/setup"
CLONE_DIR="$SETUP_DIR/playbooks"

# Needs for avoid rate limits when using GitHub API to get latest releases.
export GITHUB_AUTH_TOKEN=47fe0042c26a699e8d2e2d2920ff14ff01f3a93b

echo "\033[33m---------------------------------------------------------------------\033[0m"
echo "\033[33mPerforming initial system update and installing base dependencies\033[0m"
echo "\033[33m---------------------------------------------------------------------\033[0m"
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y
sudo apt-get install -y python-pip python-apt python-setuptools git-core python-dev libxml2-dev libxslt-dev wget

mkdir -p $SETUP_DIR

cd $SETUP_DIR

if [ ! -d "$CLONE_DIR" ]; then
  echo "\033[33m---------------------------------------------------------------------\033[0m"
  echo "\033[33mCloning playbook repository onto $CLONE_DIR\033[0m"
  echo "\033[33m---------------------------------------------------------------------\033[0m"
  git clone $REPO $CLONE_DIR
  cd $CLONE_DIR
else
  cd $CLONE_DIR
  echo "\033[33m---------------------------------------------------------------------\033[0m"
  echo "\033[33mUpdating playbooks $CLONE_DIR\033[0m"
  echo "\033[33m---------------------------------------------------------------------\033[0m"
  git reset HEAD --hard &&  git pull
fi

echo "\033[33m---------------------------------------------------------------------\033[0m"
echo  "\033[33mInstalling setup dependencies\033[0m"
echo "\033[33m---------------------------------------------------------------------\033[0m"
sudo pip install -r requirements.txt

sudo chmod +x scripts/get_latest_gh_release.sh 
sudo chown $(whoami):$(whoami) scripts/get_latest_gh_release.sh 
sudo cp scripts/get_latest_gh_release.sh /usr/local/bin

echo "\033[33m---------------------------------------------------------------------\033[0m"
echo  "\033[33mRunning setup playbook\033[0m"
echo "\033[33m---------------------------------------------------------------------\033[0m"
ansible-playbook setup.yml -i HOSTS --ask-become-pass --module-path ./ansible_modules

if [ ! $? -eq 0 ]; then
    echo  "\033[33mError running ansible playbooks. Aborting ...\033[0m"
    exit -1
if

yadm decrypt

dropbox start -i

sudo tlp start

exec zsh

echo  "\033[33m<<EOF
The machine was provisioned with success. 
Some steps still need to be executed manually:

---------------------------------------------
Manual Install Applications:
 - Crashplan (https://support.code42.com/CrashPlan/4/Get_started/Install_the_Code42_app)
 - Keyloard (https://protonail.com/)
 - GravitDesigner (https://www.designer.io/#download)
 - Robo3t (https://robomongo.org/)
-----------------------------------------------

---------------------------------------------
Other
 - Sync vscode and PHPStorm settings
 - Login into applications
 - Run hardcore icons fix
-----------------------------------------------
EOF"

exit 0