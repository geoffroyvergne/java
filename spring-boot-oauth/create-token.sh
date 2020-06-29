#!/usr/bin/env bash

RESULT_TOKEN_ADMIN=`curl -X POST -kliu clientapp2:1234562 \
    http://localhost:9000/oauth/token \
    -H "Accept: application/json" \
    -d grant_type=password \
    -d scope=read%20write \
    -d client_id=clientapp2 \
    -d client_secret=1234562 \
    -d username=admin \
    -d password=admin`

TOKEN_ADMIN=`echo $RESULT_TOKEN_ADMIN | sed 's/.*access_token":"//g' | sed 's/".*//g'`

export RESULT_TOKEN_ADMIN
export TOKEN_ADMIN

RESULT_TOKEN_USER=`curl -X POST -kliu clientapp2:1234562 \
    http://localhost:9000/oauth/token \
    -H "Accept: application/json" \
    -d grant_type=password \
    -d scope=read%20write \
    -d client_id=clientapp2 \
    -d client_secret=1234562 \
    -d username=user \
    -d password=user`

TOKEN_USER=`echo $RESULT_TOKEN_USER | sed 's/.*access_token":"//g' | sed 's/".*//g'`

export RESULT_TOKEN_USER
export TOKEN_USER

echo "TOKEN_ADMIN $TOKEN_ADMIN"
echo "TOKEN_USER $TOKEN_USER"