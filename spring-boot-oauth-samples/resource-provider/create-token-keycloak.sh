#!/usr/bin/env bash

RESULT_TOKEN_USER=`curl -X POST 'http://localhost:8080/auth/realms/test/protocol/openid-connect/token' \
-H "Content-Type:application/x-www-form-urlencoded" \
-d "username=user" \
-d "password=user123" \
-d "grant_type=password" \
-d "client_id=test" \
-d "client_secret=e85f61f0-6d04-4095-ac64-621aefad2de9"`

ACCESS_TOKEN_USER=`echo $RESULT_TOKEN_USER | sed 's/.*access_token":"//g' | sed 's/".*//g'`

export ACCESS_TOKEN_USER

echo "ACCESS_TOKEN_USER : " $ACCESS_TOKEN_USER

curl http://localhost:9001/resource/secured/test

curl http://localhost:9001/resource/index/test
curl -H "Authorization: Bearer $ACCESS_TOKEN_USER" http://localhost:9001/resource/secured/test