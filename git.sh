#!/bin/sh

git.bin "$@"
EXITCODE=$?

[ "$1" = fetch ] && [ -d .git-crypt ] || exit $EXITCODE

GNUPGHOME=/app/config/gpg/keys git-crypt unlock > /dev/stderr
exit $EXITCODE
