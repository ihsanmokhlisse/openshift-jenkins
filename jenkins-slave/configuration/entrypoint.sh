#!/bin/sh
export USER_ID=123
mkdir ~/.ssh
cp ~/.sshkeys/ssh-privatekey ~/.ssh/id_rsa
chmod 600 ~/.ssh/*
chmod 700 ~/.ssh
ls -la ~
ls -la ~/.ssh

exec /var/lib/jenkins/run-jnlp-client "$@"
