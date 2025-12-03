#!/bin/bash

set -euo pipefail

export GNUPGHOME="$(mktemp -d)"

cat <<EOF | gpg --batch --gen-key
Key-Type: eddsa
Key-Curve: ed25519
Name-Real: Argo CD
Name-Email: argocd@example.com
Expire-Date: 0

Subkey-Type: ecdh
Subkey-Curve: cv25519
Subkey-Usage: encrypt

%no-protection
%commit
EOF

export GPG_KEY_ID=$(gpg --armor --export 'argocd@example.com' | gpg --list-keys  --keyid-format LONG | grep '^pub' | sed -r 's/^pub[^/]+\/([A-z0-9]+)\ .*$/\1/')
echo "GPG Key ID: ${GPG_KEY_ID}"
gpg --armor --export 'argocd@example.com'
gpg --armor --export-secret-keys 'argocd@example.com'

echo "Should temp GPG directory '${GNUPGHOME}' be deleted? (y/n)"
read -r answer

if [[ $answer == "y" ]]; then
    rm -rf "${GNUPGHOME}" 
fi

unset GNUPGHOME
