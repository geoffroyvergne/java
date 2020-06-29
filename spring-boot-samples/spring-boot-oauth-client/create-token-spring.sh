#!/usr/bin/env bash

RESULT_TOKEN_ADMIN=`curl -X POST -u clientapp:123456 'http://localhost:9000/oauthserver/oauth/token' \
-H "Accept: application/json" \
-d "scope=read%20write" \
-d "client_id=clientapp" \
-d "client_secret=123456" \
-d "username=admin" \
-d "password=admin" \
-d "grant_type=password"`

TOKEN_ADMIN=`echo $RESULT_TOKEN_ADMIN | sed 's/.*access_token":"//g' | sed 's/".*//g'`

export TOKEN_ADMIN

RESULT_TOKEN_USER=`curl -X POST -u clientapp:123456 'http://localhost:9000/oauthserver/oauth/token' \
-H "Accept: application/json" \
-d "scope=read%20write" \
-d "client_id=clientapp" \
-d "client_secret=123456" \
-d "username=user" \
-d "password=user" \
-d "grant_type=password"`

TOKEN_USER=`echo $RESULT_TOKEN_USER | sed 's/.*access_token":"//g' | sed 's/".*//g'`

export TOKEN_USER


