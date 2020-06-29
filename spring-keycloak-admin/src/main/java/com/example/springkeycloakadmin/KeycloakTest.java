package com.example.springkeycloakadmin;

import org.jboss.resteasy.client.jaxrs.ResteasyClientBuilder;
import org.keycloak.OAuth2Constants;
import org.keycloak.admin.client.Keycloak;
import org.keycloak.admin.client.KeycloakBuilder;
import org.keycloak.admin.client.resource.UserResource;
import org.keycloak.representations.idm.CredentialRepresentation;
import org.keycloak.representations.idm.RoleRepresentation;
import org.keycloak.representations.idm.UserRepresentation;

import javax.ws.rs.core.Response;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class KeycloakTest {
  public static void main(String[] args) {
    Keycloak keycloak = KeycloakBuilder.builder()
        .serverUrl("http://localhost:8080/auth")
        .realm("master")
        //.grantType(OAuth2Constants.CLIENT_CREDENTIALS)
        .clientId("admin-cli")
        //.clientSecret("4090b3cf-f36c-42b1-a43d-86ec91544b17")
        .username("admin")
        .password("admin123!")
        /*.resteasyClient(
            new ResteasyClientBuilder()
                .connectionPoolSize(10).build())*/
        .build();

    //System.out.println(keycloak.serverInfo().getInfo().getSystemInfo().getVersion());

    //System.out.println("users().count() : " + keycloak.realms().realm("Test").users().count());

    //UserResource userResource = keycloak.realm("Test").users().get("2d8d13bb-d8ba-4444-beb7-7a74f40fd92c");
    //System.out.println(userResource.toRepresentation().getEmail());

    CredentialRepresentation credential = new CredentialRepresentation();
    credential.setType(CredentialRepresentation.PASSWORD);
    credential.setValue("test");
    credential.setTemporary(false);

    UserRepresentation user = new UserRepresentation();
    user.setUsername("test");
    user.setFirstName("test");
    user.setLastName("test");
    user.setEmail("no@email.com");
    user.setEmailVerified(true);
    user.setEnabled(true);

    user.setRealmRoles(Arrays.asList(new String[]{"user"}));

    Map<String, List<String>> userRole = new HashMap<>();
    userRole.put("angular", Arrays.asList(new String[]{"user"}));

    user.setClientRoles(userRole);

    user.setCredentials(Arrays.asList(credential));

    //Map<String, Boolean> access = new HashMap<String, Boolean>();
    //user.setAccess(access);

    //RoleRepresentation testerRealmRole = keycloak.realm("Test").roles().get("user").toRepresentation();
    
    Response response = keycloak.realm("Test").users().create(user);

    //keycloak.realm("Test").users().get("").toRepresentation().setClientRoles(userRole);

    System.out.println(response.getStatus());
  }
}
