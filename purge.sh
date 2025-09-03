#!/bin/bash

#
# Remove created container images
#

readonly d="$(cd "$(dirname "$0")" || exit 1; pwd)"
readonly runsh="${d}/run.sh"

set -e
docker rmi markitdown-mcp-local
"$runsh" down --rmi local --remove-orphans
