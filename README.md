# Domain zone refresher in Digital ocean

## Envionment variables (refresh some-name.example.com):
- TOKEN : Personal access token
- DOMAIN : Domain name (example.com)
- RECORD_NAME : Record name (some-name)
- GET_IP_URL (optional) : Getting your ip address from this site. default: https://ipecho.net/plain

## build with docker
docker build -t dns .

## example via docker:
docker run \\<br>
-e TOKEN="dop_v1_abc12333333333333333333333333333" \\<br>
-e DOMAIN="example.com" \\<br>
-e RECORD_NAME="some-name" \\<br>
dns

