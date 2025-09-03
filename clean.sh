#!/bin/bash

#
# Remove generated/edited sources
#

readonly d="$(cd "$(dirname "$0")" || exit 1; pwd)"
readonly webui="${d}/open-webui"

set -e
cd "${webui}"
git reset --hard
git clean -d -f
