#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/60003db82269cb0016a692bd/webhook/build/pull > /dev/null
curl -s -X POST https://api.stackbit.com/project/60003db82269cb0016a692bd/webhook/build/ssgbuild > /dev/null
hugo
./inject-netlify-identity-widget.js public
curl -s -X POST https://api.stackbit.com/project/60003db82269cb0016a692bd/webhook/build/publish > /dev/null
