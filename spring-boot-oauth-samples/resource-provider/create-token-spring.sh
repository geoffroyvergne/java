#!/usr/bin/env bash

curl http://localhost:9001/resource/secured/test

RESULT_TOKEN_USER=`curl -XPOST -k foo:foosecret@localhost:9000/identity/oauth/token \
 -d grant_type=password \
 -d client_id=foo \
 -d client_secret=foosecret \
 -d username=user \
 -d password=user123`

ACCESS_TOKEN_USER=`echo $RESULT_TOKEN_USER | sed 's/.*access_token":"//g' | sed 's/".*//g'`
REFRESH_TOKEN_USER=`echo $RESULT_TOKEN_USER | sed 's/.*refresh_token":"//g' | sed 's/".*//g'`

export ACCESS_TOKEN_USER

echo "RESULT_TOKEN_USER : " $RESULT_TOKEN_USER
echo "ACCESS_TOKEN_USER : " $ACCESS_TOKEN_USER
echo "REFRESH_TOKEN_USER : " $REFRESH_TOKEN_USER

curl http://localhost:9001/resource/secured/test
curl -H "Authorization: Bearer $ACCESS_TOKEN_USER" http://localhost:9001/resource/secured/test

# curl -H "Authorization: Bearer $ACCESS_TOKEN_USER" http://localhost:9000/identity/user/me


#RESULT_TOKEN=`curl -XPOST -k foo:foosecret@localhost:9000/identity/oauth/token \
#    -d grant_type=refresh_token \
#    -d refresh_token=$REFRESH_TOKEN`