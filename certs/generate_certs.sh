#!/usr/bin/env bash

set -e

if [ "$#" -ne 1 ]; then
    echo "Usage: generate_certs.sh domain_name"
    exit 1
fi

openssl req -subj "/CN=$1/O=Docker Registry/C=US" -new -newkey rsa:2048 -days 365 -nodes -x509 -keyout key.pem -out cert.pem

echo "Successfully created a cert bundle for $1"
