package org.example.apigateway;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.reactive.EnableWebFluxSecurity;
import org.springframework.security.config.web.server.ServerHttpSecurity;
import org.springframework.security.web.server.SecurityWebFilterChain;

@Configuration
@EnableWebFluxSecurity
public class SecurityConfig {

    @Bean
    public SecurityWebFilterChain springSecurityFilterChain(ServerHttpSecurity http) {
        http
                .csrf(csrf -> csrf.disable()) // Disable CSRF protection for REST APIs
                .authorizeExchange(exchanges -> exchanges
                        .pathMatchers("/eureka/**").permitAll() // Allow unrestricted access to Eureka endpoints
                        .pathMatchers("/actuator/**").permitAll() // Allow unrestricted access to actuator endpoints
//                        -------------for testing - unlock link for plain browser
//                        .pathMatchers("/compendium/skills").permitAll()
                        .anyExchange().authenticated() // Authenticate all other requests
                )
                .oauth2ResourceServer(oauth2 -> oauth2.jwt(Customizer.withDefaults())); // Use JWT for OAuth2 authentication

        return http.build();
    }

    //in case if needed
//    @Bean
//    public JwtDecoder jwtDecoder(){
//        return NimbusJwtDecoder.withJwkSetUri("http://localhost:8090/auth/realms/microservice-realm/protocol/openid-connect/certs").build();
//    }
}
