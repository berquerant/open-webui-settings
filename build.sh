#!/bin/bash

#
# Build container images
#

readonly d="$(cd "$(dirname "$0")" || exit 1; pwd)"
readonly runsh="${d}/run.sh"

"$runsh" down || true
"$runsh" build
