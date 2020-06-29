#!/usr/bin/env bash

RESULT_TOKEN_ADMIN=`curl -X POST 'http://localhost:8080/auth/realms/test/protocol/openid-connect/token' \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "username=admin" \
-d "password=admin" \
-d "grant_type=password" \
-d "client_id=test"`

TOKEN_ADMIN=`echo $RESULT_TOKEN_ADMIN | sed 's/.*access_token":"//g' | sed 's/".*//g'`

export TOKEN_ADMIN

RESULT_TOKEN_USER=`curl -X POST 'http://localhost:8080/auth/realms/test/protocol/openid-connect/token' \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "username=user" \
-d "password=user" \
-d "grant_type=password" \
-d "client_id=test"`

TOKEN_USER=`echo $RESULT_TOKEN_USER | sed 's/.*access_token":"//g' | sed 's/".*//g'`

export TOKEN_USER