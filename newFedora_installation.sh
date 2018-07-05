#!/bin/bash
# In order to run the script needs the sudo password as the first argument in the command line

# TODO: check that the password is provided
#if[ $0 ]

echo "Welcome to your new Fedora environment!"

# Installing basic tools
echo "Upgrading the system\t\t"
echo "$0" | sudo -S dnf -y update

# TODO: check if last command returned a good exit value then echo OK, otherwise fail
echo "[  OK  ]\n"


echo "Installing git\t\t"
echo "$0" | sudo -S dnf install git
echo [  OK  ]
