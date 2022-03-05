#!/bin/bash

cd ${0%/*}

diff -U 3 \
  <(./bin/kustomize build deploy/${1}) \
  <(./bin/kustomize build deploy/${2}) | \
  less
