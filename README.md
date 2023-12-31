# Dotfiles
Automated environment builder using Ansible

### Requirements

- Ansible
- python3 and pip

### Install
```
git clone https://github.com/IwasakiYuuki/dotfiles
cd dotfiles
ansible-playbook -i localhost, -c local setup.yaml --ask-become-pass
```
