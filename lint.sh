#!/bin/bash
set -euo pipefail
#
# If the tslint.json is present ..
#
if [ -e tslint.json ]; then


    # Run it.
    yarn install  --frozen-lockfile
    tslint -c tslint.json -e \"node_modules/**/*.ts\" -e \"**/*.d.ts\" \"./**/*.ts\" -p .
    echo "done linting"
    # Preserve the exit-code
    exit $?

else

    #
    # Script is missing.
    #
    echo "Repository does not contain 'tslint.json'"
    exit 1
fi