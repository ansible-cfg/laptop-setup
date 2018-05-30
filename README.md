# My Laptop Setup Playbooks

> This repository contains a set of Ansible Playbooks and bash scripts, to fully provision my personal Laptop with all my favorite applications and settings.

## System Requirements

* Ubuntu 18.04 (it might work on other versions, but not tested)
* Ansible > 2.1
* Python > 2.7
* Gitlab and Github access tokens.

## Usage

```
export GITHUB_AUTH_TOKEN=<my_github_token>
export GITLAB_PASSWORD=mygitlabpassowrd
git clone https://github.com/brpaz/laptop-setup.git 
sudo chmod +x setup.sh
./setup.sh
```

## Manual Steps

Some tasks couldnt be automated and should be done after running the provision script.

#### Install Software Manually

* [Robo 3T](https://robomongo.org/)
* [Crashplan](https://www.crashplan.com/en-us/download/)
* [Keylord](https://protonail.com/)

#### Other

* Sync VScode settings
* Sync PHPStorm and InteliJ settings
* Chrome Login
* Configure "Online Accounts" for Contacts. Calendar, etc
* Configure workspaces and startup applications.
* Login into applications (Franz, Ramme, etc)
* Cleanup "install" dir

## TODO

* Improve Idepontence in some situations like when installing from DEB files and zips.
* Extract some configurations to variables.

## Reference

* http://radeksprta.eu/automatically-setup-computer-ansible-playbook/
* http://blog.josephkahn.io/articles/ansible/
* https://github.com/Benoth/ansible-ubuntu