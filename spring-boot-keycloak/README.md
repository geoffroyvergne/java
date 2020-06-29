# spring-boot-keycloak

curl --head localhost:8181/api/test/user/test
curl localhost:8181/api/test/user/test
 
source ./create-token.sh

curl -H "Authorization: Bearer $TOKEN_USER" http://localhost:8080/auth/realms/test/protocol/openid-connect/userinfo

curl localhost:8181/api/test/user/test -H "Authorization: bearer $TOKEN_USER"
curl localhost:8181/api/test/user/me -H "Authorization: bearer $TOKEN_USER"

curl localhost:8181/api/test/admin/test -H "Authorization: bearer $TOKEN_USER"
curl localhost:8181/api/test/admin/test -H "Authorization: bearer $TOKEN_ADMIN"

curl localhost:4200/api/test/admin/test -H "Authorization: bearer $TOKEN_ADMIN"
