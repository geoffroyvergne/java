#!/usr/bin/env bash

RESULT_TOKEN=`curl -XPOST -k test:secret@localhost:9000/identity/oauth/token \
 -d grant_type=password \
 -d client_id=test \
 -d client_secret=secret \
 -d username=user \
 -d password=user`

ACCESS_TOKEN=`echo $RESULT_TOKEN | sed 's/.*access_token":"//g' | sed 's/".*//g'`
REFRESH_TOKEN=`echo $RESULT_TOKEN | sed 's/.*refresh_token":"//g' | sed 's/".*//g'`

echo "RESULT_TOKEN : " $RESULT_TOKEN
echo "ACCESS_TOKEN : " $ACCESS_TOKEN
echo "REFRESH_TOKEN : " $REFRESH_TOKEN

curl -H "Authorization: Bearer $ACCESS_TOKEN" http://localhost:9001/resource/
