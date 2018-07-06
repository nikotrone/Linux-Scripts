#!/bin/bash
# In order to run the script needs the sudo password as the first argument in the command line

# TODO: check that the password is provided
#if[ $? ]

echo -e "Welcome to your new Fedora environment!\\n"

# Upgrading system
echo -e "Upgrading the system\\t\\t"

if [[ $("echo -e $0 | sudo -S dnf -y update | cat > dnf_update_log") ]]; then
    echo -e "[  OK  ]\\n"
else
    echo -e "[ FAIL ]\\n"
fi


# Installing basic tools
echo -e "Installing git\\t\\t"

if [[ $("echo $0 | sudo -S dnf install git nano | cat >> dnf_install_basic_log") ]]; then
    echo -e "[  OK  ]\\n"
else
    echo -e "[ FAIL ]\\n"
fi


echo -e "Checking if ll shortcut is in place\\t\\t"
if [[ $("ll > temp.log") ]]; then
    echo -e "[  OK  ]\\n"
else
    echo -e "\\n ll shortcut does not exist, creating shortcut now\\n" >> dnf_install_basic_log
    if [ -e ~/.bash_profile ]
    then
        echo "alias ll='ls -lGh \$@'" >> ~/.bash_profile
    else
        echo "alias ll='ls -lGh \$@'" > ~/.bash_profile
    fi
    echo -e "[ DONE ]\\n"
fi

mkdir ~/installation_tmp
cd ~/installation_tmp || exit
git clone https://github.com/nikotrone/Linux-Scripts.git
cd Linux-Scripts || exit