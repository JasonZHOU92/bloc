#!/bin/bash

blochost=$(curl ident.me)

cd /var/run/strato/bloc-server
blocserver="/usr/lib/strato/bloc-server/bin/main.js"
sed -i "s|^apiURL: .*\$|apiURL: 'http$(${ssl:-false} && echo "s")://$blochost/strato-api'|" config.yaml
HOST=0.0.0.0 exec $blocserver start
