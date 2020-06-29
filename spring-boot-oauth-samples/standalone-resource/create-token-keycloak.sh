#!/usr/bin/env bash

RESULT_TOKEN_USER=`curl -X POST 'http://localhost:8080/auth/realms/test/protocol/openid-connect/token' \
-H "Content-Type:application/x-www-form-urlencoded" \
-d "username=user" \
-d "password=user123" \
-d "grant_type=password" \
-d "client_id=test" \
-d "client_secret=b5f1ccf0-a3cf-4066-94fd-678f25a002be"`

ACCESS_TOKEN_USER=`echo $RESULT_TOKEN_USER | sed 's/.*access_token":"//g' | sed 's/".*//g'`

export ACCESS_TOKEN_USER

echo $ACCESS_TOKEN_USER

# curl http://localhost:9002/standalone-resource/index/test
# curl http://localhost:9002/standalone-resource/secured/test
# curl http://192.168.116.1:8280/test/1.0/secured/test
# curl http://192.168.116.1:8280/test/1.0/index/test
curl http://localhost:8080/apiman-gateway/test-organization/spring-test-api/1.0/index/test
echo ""
curl -H "Authorization: Bearer $ACCESS_TOKEN_USER" http://localhost:8080/apiman-gateway/test-organization/spring-test-api/1.0/index/test
echo ""
curl -H "Authorization: Bearer $ACCESS_TOKEN_USER" http://localhost:8080/apiman-gateway/test-organization/spring-test-api/1.0/secured/test
echo ""
curl -H "Authorization: Bearer $ACCESS_TOKEN_USER" http://localhost:8080/apiman-gateway/test-organization/spring-test-api/1.0/user/me
echo ""
curl -H "Authorization: Bearer $ACCESS_TOKEN_USER" http://localhost:8080/auth/realms/test/protocol/openid-connect/userinfo
echo ""
