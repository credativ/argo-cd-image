#!/bin/sh

git.bin "$@"
EXITCODE=$?

# Recursion filter, if git-crypt is triggering git
if [ "${GIT_CRYPT_BYPASS:-0}" = "1" ];
  exit $EXITCODE
fi

if ([ "$1" = "fetch" ] || [ "$1" = "checkout" ]) && [ -d .git-crypt ]; then
  export GIT_CRYPT_BYPASS=1
  export GNUPGHOME=/app/config/gpg/keys
  git-crypt unlock
fi

exit $EXITCODE
