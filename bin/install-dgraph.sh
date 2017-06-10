#!/usr/bin/env bash
#
#                  Dgraph Installer Script, for OSX

set -e
mkdir -p tmp
cd tmp
if [ ! -f dgraph-darwin-amd64-v0.7.7-dev.tar.gz ]; then
	wget https://github.com/dgraph-io/dgraph/releases/download/nightly/dgraph-darwin-amd64-v0.7.7-dev.tar.gz
fi

if [ ! -f dgraph/dgraph ]; then
	tar xvfz dgraph-darwin-amd64-v0.7.7-dev.tar.gz
fi
