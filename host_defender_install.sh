#!/bin/sh
#Get token
token=$(curl -H "Content-Type: application/json" \
  -d '{"username":"<USERNAME>", "password":"<PASSWORD>"}' \
  https://<COMPUTE_CONSOLE>/api/v1/authenticate | sed 's/{"token":"//g;s/"}//g')
#Install Defender
curl -sSL -k --header "authorization: Bearer ${token}" https://<COMPUTE_CONSOLE>/api/v1/scripts/defender.sh | sudo bash -s -- -c "asia-northeast1.cloud.twistlock.com" -d "none"  --install-host
