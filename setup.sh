
set -e

REPO="https://github.com/brpaz/laptop-setup.git"
SETUP_DIR="$HOME/setup"
CLONE_DIR="$SETUP_DIR/playbooks"

sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y
sudo apt-get install -y python-pip python-apt python-setuptools git-core python-dev libxml2-dev libxslt-dev wget

mkdir -p $SETUP_DIR

cd $SETUP_DIR

if [ ! -d "$CLONE_DIR" ]; then
  git clone $REPO $CLONE_DIR
  cd $CLONE_DIR
else
  cd $CLONE_DIR
  git reset HEAD --hard &&  git pull
fi

sudo pip install -r requirements.txt

sudo cp scripts/get_latest_gh_release.sh /usr/local/bin

sudo chmod +x /usr/local/bin/get_latest_gh_release.sh 
sudo chown $USER:$USER /usr/local/bin/get_latest_gh_release.sh 

ansible-playbook setup.yml -i HOSTS --ask-become-pass --module-path ./ansible_modules
 
yadm decrypt

exec zsh

cat <<EOF
Next steps:
Manual Install Applications:
 - Teamviewer (https://www.teamviewer.com/en/download/linux/)
 - Crashplan (https://support.code42.com/CrashPlan/4/Get_started/Install_the_Code42_app)
 - Keyloard (https://protonail.com/)
 - Robo3t (https://robomongo.org/)

Other
 - Sync vscode and PHPStorm settings
 - Login into applications (Franz, Chrome, Ramme and more)
 - IDE Settings
 - Install ulaunche extensions
 - Configure startup applications
EOF

exit 0