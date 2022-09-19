#!/usr/bin/env bash

set -euxo pipefail # see https://gist.github.com/mohanpedala/1e2ff5661761d3abd0385e8223e16425
ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." >/dev/null 2>&1 && pwd )"
pushd "$ROOT_DIR" || { echo "could not change to root directory: $ROOT_DIR"; exit 1; }

docker rmi -f $(docker images -q) || true

kubectl delete -f ./deploy/final.yaml || true

rm -f deploy/deployment.yaml
rm -f deploy/service.yaml
rm -f deploy/final.yaml
rm -f bin/srv
rm -f _IMG _TAG
