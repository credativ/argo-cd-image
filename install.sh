#!/bin/sh

set -eu

apt update
apt install -y \
    --no-install-recommends \
    -o "DPkg::options::=--force-confdef" \
    -o "Dpkg::Options::=--force-confold" \
    git-crypt \
    gpg

mv /usr/bin/git /usr/bin/git.orig
cp /tmp/git.sh /usr/bin/git
chmod 755 /usr/bin/git

apt clean -y
find /var/log -type f -exec rm -f {} +
rm -rf /tmp/* /var/tmp/* /var/cache/* /var/lib/apt/lists/*
