#!/bin/bash

#
# Manipulate containers
#

readonly d="$(cd "$(dirname "$0")" || exit 1; pwd)"
readonly webui="${d}/open-webui"
readonly compose_yml="docker-compose-local.yml"
readonly ollama_url="http://localhost:11434"

cd "${webui}" || exit 1
if [[ ! -f "$compose_yml" ]] ; then
    cat <<EOS >&2
${compose_yml} not found!
Maybe 'make setup' will resolve it...
EOS
    exit 1
fi
if ! curl -s "$ollama_url" > /dev/null ; then
    echo >&2 "Ollama is not running! (${ollama_url})"
    exit 1
fi

docker compose -f "$compose_yml" "$@"
