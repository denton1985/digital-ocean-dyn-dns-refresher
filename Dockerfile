FROM alpine:latest

RUN apk update && apk add curl jq

ADD ./refresh-dns.sh /refresh-dns.sh

ENTRYPOINT ["/refresh-dns.sh"]