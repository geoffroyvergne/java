package com.example.springkeycloakadmin;

import org.keycloak.admin.client.Keycloak;
import org.keycloak.admin.client.KeycloakBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class KeycloakConfig {

  private KeycloakProperties keycloakProperties;

  /*@Autowired
  public KeycloakConfig(KeycloakProperties keycloakProperties) {
    this.keycloakProperties = keycloakProperties;
  }*/

  @Autowired
  public void setKeycloakProperties(KeycloakProperties keycloakProperties) {
    this.keycloakProperties = keycloakProperties;
  }

  /*@Value("${kekcloak.serverUrl}")
  private String serverUrl;

  @Value("${kekcloak.realms}")
  private String realm;

  @Value("${kekcloak.clientId}")
  private String clientId;

  @Value("${kekcloak.username}")
  private String username;

  @Value("${kekcloak.password}")
  private String password;*/

  @Bean
  Keycloak keycloak() {
    return KeycloakBuilder.builder()
        .serverUrl(keycloakProperties.getServerUrl())
        .realm(keycloakProperties.getRealm())
        .clientId(keycloakProperties.getClientId())
        .username(keycloakProperties.getUsername())
        .password(keycloakProperties.getPassword())
        .build();
  }
}
