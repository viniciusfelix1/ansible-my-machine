#!/bin/bash

source /etc/os-release

function _ubuntu {
  sudo apt update
  sudo apt install -y software-properties-common
  sudo apt-add-repository --yes --update ppa:ansible/ansible
  sudo apt install -y ansible
}

function _debian {
  echo 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main' | sudo tee -a /etc/sources.list.d/ansible
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
  sudo apt update
  sudo apt install -y ansible
}

_$ID

ansible-playbook playbook.yml
