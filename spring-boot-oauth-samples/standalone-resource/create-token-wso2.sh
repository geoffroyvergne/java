#!/usr/bin/env bash

RESULT_TOKEN_USER=`curl -u wwyLOF3ZAv6vXj6dvmlksU6tlToa:KiS8qT3FlL8oObxMsQTSx_cfkBIa -k \
-d "grant_type=password" \
-d "username=user" \
-d "password=user123" \
-H "Content-Type:application/x-www-form-urlencoded" \
https://192.168.116.1:8243/token?scope=openid`

ACCESS_TOKEN_USER=`echo $RESULT_TOKEN_USER | sed 's/.*access_token":"//g' | sed 's/".*//g'`

export ACCESS_TOKEN_USER

echo $ACCESS_TOKEN_USER

# curl http://localhost:9002/standalone-resource/index/test
# curl http://localhost:9002/standalone-resource/secured/test
# curl http://192.168.116.1:8280/test/1.0/secured/test
# curl http://192.168.116.1:8280/test/1.0/index/test
curl -H "Authorization: Bearer $ACCESS_TOKEN_USER" http://192.168.116.1:8280/test/1.0/index/test
echo ""
curl -H "Authorization: Bearer $ACCESS_TOKEN_USER" http://192.168.116.1:8280/test/1.0/secured/test
echo ""
curl -H "Authorization: Bearer $ACCESS_TOKEN_USER" http://192.168.116.1:8280/spring-test/1.0/index/test
echo ""
curl -H "Authorization: Bearer $ACCESS_TOKEN_USER" http://192.168.116.1:8280/spring-test/1.0/secured/test
echo ""
curl -H "Authorization: Bearer $ACCESS_TOKEN_USER" https://localhost:9443/oauth2/userinfo?schema=openid
echo ""
