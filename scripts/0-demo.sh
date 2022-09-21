#!/usr/bin/env bash

set -euxo pipefail # see https://gist.github.com/mohanpedala/1e2ff5661761d3abd0385e8223e16425
ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." >/dev/null 2>&1 && pwd )"
pushd "$ROOT_DIR" || { echo "could not change to root directory: $ROOT_DIR"; exit 1; }

sh="/usr/bin/env sh"

tmux split-window -h "$sh -c \"htop\" "

docker run -it --rm --name demo1 ubuntu  bash -c "eval 'apt update && apt install -y p7zip-full && (echo; echo \"--------------------------------------------------------------\"; 7z b) & (sleep 20; exit 0;)' "

echo
echo "--------------------------------------------------------------"
echo
docker run --cpus="1.0" -it --rm --name demo1 ubuntu  bash -c "eval 'apt update && apt install -y p7zip-full && (echo; echo \"--------------------------------------------------------------\"; echo \"LIMITING CPU TO  _1_ CORE\"; 7z b) & (sleep 20; exit 0;)' "


