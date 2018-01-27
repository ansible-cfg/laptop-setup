# My Laptop Setup Playbooks

> This repository contains a set of Ansible Playbooks and bash scripts, to fully provision an Ubuntu based PC with all my used Applications and Settings.

## Usage

**This is a Work in progress project**

On the machine you want to provision just run the following script to start the setup.

```
sudo wget -qO- https://github.com/brpaz/laptop-setup/raw/master/setup.sh | bash
```

## TODO

* Improve Idepontence in some situations like when installing from DEB files and zips.
* Extract some configurations to variables.

## Reference

* http://radeksprta.eu/automatically-setup-computer-ansible-playbook/
* http://blog.josephkahn.io/articles/ansible/
* https://github.com/Benoth/ansible-ubuntu