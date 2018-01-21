#!/usr/bin/env bash

#ECHO Retrieve a user token
#TOKEN=$(curl https://auth.docker.io/token | jq -r '.token')

#ECHO User token:
#ECHO $TOKEN

#ECHO .
#ECHO Contact registry
#curl -i -H "Authorization: Bearer $TOKEN" https://registry-1.docker.io/v2/


TAGINFO=$(curl https://registry.access.redhat.com/v1/repositories/rhel7/tags)

LATEST=$(echo $TAGINFO | jq ".latest")
echo LATEST $LATEST

#curl https://registry.access.redhat.com/v1/repositories/rhel7/tags | jq


#curl https://registry.access.redhat.com/v1/repositories/rhel7/tags/7.4 | jq

echo $TAGINFO | jq

echo $TAGINFO | jq --arg LATEST '$LATEST' 'with_entries(select(any(.value[]; . == "$LATEST"))'
