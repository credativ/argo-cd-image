#!/bin/sh

git.bin "$@"
EXITCODE=$?

if ([ "$1" = "fetch" ] || [ "$1" = "checkout" ]) && [ -d .git-crypt ]; then
GNUPGHOME=/app/config/gpg/keys git-crypt unlock
fi

exit $EXITCODE
