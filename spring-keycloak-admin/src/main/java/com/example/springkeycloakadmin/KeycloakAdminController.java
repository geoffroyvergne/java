package com.example.springkeycloakadmin;

import org.keycloak.admin.client.Keycloak;
import org.keycloak.representations.idm.CredentialRepresentation;
import org.keycloak.representations.idm.UserRepresentation;
import org.keycloak.representations.info.ServerInfoRepresentation;
import org.keycloak.representations.info.SystemInfoRepresentation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.ws.rs.core.Response;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin")
public class KeycloakAdminController {

  @Autowired
  Keycloak keycloak;

  @RequestMapping(value="/serverinfo", produces= MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.GET)
  public ResponseEntity test() {

    //logger.info("configObject : " + configObject);
    //return new ResponseEntity<>(new Status(0, "index " + testValue), HttpStatus.OK);

    SystemInfoRepresentation systemInfo = keycloak.serverInfo().getInfo().getSystemInfo();

    return new ResponseEntity<>(systemInfo, HttpStatus.OK);
  }

  @RequestMapping(value="/adduser/{realm}", produces= MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.POST)
  public ResponseEntity<Response> addUser(@PathVariable("realm") String realm) {

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

    //Map<String, List<String>> userRole = new HashMap<>();
    //userRole.put("angular", Arrays.asList(new String[]{"user"}));

    //user.setClientRoles(userRole);

    user.setCredentials(Arrays.asList(credential));

    Response response = keycloak.realm(realm).users().create(user);

    return new ResponseEntity<>(response, HttpStatus.OK);
  }
}
