#!/bin/bash

#
# Setup sources
#

readonly d="$(cd "$(dirname "$0")" || exit 1; pwd)"
readonly webui="${d}/open-webui"

set -e
cd "$webui"
cp -fr "${d}/mcpo" mcpo
cp -fr "${d}/nginx" nginx

__sed="sed"
if which gsed > /dev/null ; then
    __sed="gsed"
fi
# FATAL ERROR: Reached heap limit Allocation failed - JavaScript heap out of memory
"$__sed" -i 's|RUN npm run build|ARG NODE_OPTIONS="--max-old-space-size=8192"\nRUN npm run build|' Dockerfile
cp -f "${d}/docker-compose-local.yml" .
