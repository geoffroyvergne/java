#!/usr/bin/env bash

RESULT_TOKEN_USER=`curl -u 7mETTt_RwUw76kksO_KWyWBkPb4a:tJjJbXyTX5mVRdjHyilKOf4XB1ka -k \
-d "grant_type=password" \
-d "username=user" \
-d "password=user123" \
-H "Content-Type:application/x-www-form-urlencoded" \
https://localhost:9443/oauth2/token?scope=openid`

ACCESS_TOKEN_USER=`echo $RESULT_TOKEN_USER | sed 's/.*access_token":"//g' | sed 's/".*//g'`

export ACCESS_TOKEN_USER

curl http://localhost:9001/resource/secured/test
curl -H "Authorization: Bearer $ACCESS_TOKEN_USER" http://localhost:9001/resource/secured/test
