#!/bin/sh

if [ -z $TOKEN ]; then
    echo Environment variable: TOKEN is required!
    exit 1
fi;

if [ -z $DOMAIN ]; then
    echo Environment variable: DOMAIN is required!
    exit 1
fi;

if [ -z $RECORD_NAME ]; then
    echo Environment variable: RECORD_NAME is required!
    exit 1
fi;

if [ -z $GET_IP_URL ]; then
    GET_IP_URL="https://ipecho.net/plain"
fi;


IP=$(curl -s $GET_IP_URL)


RECORD_ID=$(curl -X GET \
  -s \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer ${TOKEN}" \
  "https://api.digitalocean.com/v2/domains/${DOMAIN}/records" | jq '.domain_records[] | select(.name == "'${RECORD_NAME}'") | .id')

curl -s -X PUT -H "Content-Type: application/json" \
-H "Authorization: Bearer ${TOKEN}" \
-d "{\"data\":\"${IP}\"}" \
"https://api.digitalocean.com/v2/domains/${DOMAIN}/records/${RECORD_ID}"