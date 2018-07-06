#!/bin/bash
# In order to run the script needs the sudo password as the first argument in the command line

# TODO: check that the password is provided
#if[ $0 ]

echo -e "Welcome to your new Fedora environment!\\n"

# Installing basic tools
echo -e "Upgrading the system\\t\\t"
echo -e "$0" | sudo -S dnf -y update

# TODO: check if last command returned a good exit value then echo OK, otherwise fail
echo -e "[  OK  ]\\n"


echo -e "Installing git\\t\\t"
echo "$0" | sudo -S dnf install git
echo -e "[  OK  ]\\n"
