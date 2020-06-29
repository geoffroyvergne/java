#!/usr/bin/env bash

#curl --data "grant_type=password&client_id=test&username=user&password=user123" http://localhost:8080/auth/realms/test/protocol/openid-connect/token

RESULT_TOKEN_ADMIN=`curl -X POST 'http://localhost:8080/auth/realms/test/protocol/openid-connect/token' \
-H "Content-Type:application/x-www-form-urlencoded" \
-d "username=admin" \
-d "password=admin" \
-d "grant_type=password" \
-d "client_id=test" \
-d "client_secret=e85f61f0-6d04-4095-ac64-621aefad2de9"`

TOKEN_ADMIN=`echo $RESULT_TOKEN_ADMIN | sed 's/.*access_token":"//g' | sed 's/".*//g'`

export TOKEN_ADMIN

RESULT_TOKEN_USER=`curl -X POST 'http://localhost:8080/auth/realms/test/protocol/openid-connect/token' \
-H "Content-Type:application/x-www-form-urlencoded" \
-d "username=user" \
-d "password=user123" \
-d "grant_type=password" \
-d "client_id=test" \
-d "client_secret=e85f61f0-6d04-4095-ac64-621aefad2de9"`

TOKEN_USER=`echo $RESULT_TOKEN_USER | sed 's/.*access_token":"//g' | sed 's/".*//g'`

export TOKEN_USER