#!/bin/bash

if [ -f /etc/secrets/authorized-keys ];
then
    echo "Authorized keys found" > /tmp/logfile
    sudo useradd -m ubuntu -s /bin/bash
    mkdir -p /home/ubuntu/.ssh
    cp /etc/secrets/authorized-keys /home/ubuntu/.ssh/authorized_keys
    chown -R ubuntu:ubuntu /home/ubuntu
    echo "User ubuntu created" > /tmp/logfile
else
    echo "Authorized keys not found" > /tmp/logfile
fi

mkdir -p /var/run/sshd
sudo /usr/sbin/sshd -D
