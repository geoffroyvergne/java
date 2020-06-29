#!/usr/bin/env bash

RESULT_TOKEN_ADMIN=`curl -u 7mETTt_RwUw76kksO_KWyWBkPb4a:tJjJbXyTX5mVRdjHyilKOf4XB1ka -k \
-d "grant_type=password" \
-d "username=admin" \
-d "password=admin" \
-H "Content-Type:application/x-www-form-urlencoded" \
https://localhost:9443/oauth2/token?scope=openid`

TOKEN_ADMIN=`echo $RESULT_TOKEN_ADMIN | sed 's/.*access_token":"//g' | sed 's/".*//g'`

export TOKEN_ADMIN

RESULT_TOKEN_USER=`curl -u 7mETTt_RwUw76kksO_KWyWBkPb4a:tJjJbXyTX5mVRdjHyilKOf4XB1ka -k \
-d "grant_type=password" \
-d "username=user" \
-d "password=user123" \
-H "Content-Type:application/x-www-form-urlencoded" \
https://localhost:9443/oauth2/token?scope=openid`

TOKEN_USER=`echo $RESULT_TOKEN_USER | sed 's/.*access_token":"//g' | sed 's/".*//g'`

export TOKEN_USER


