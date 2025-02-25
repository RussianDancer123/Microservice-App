package org.example.compendiumclientservice.configs;

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
    public SecurityWebFilterChain securityWebFilterChain(ServerHttpSecurity http) {
        return http
                .csrf(csrf -> csrf.disable())
                .authorizeExchange(auth -> auth
                        .pathMatchers("/public/**").permitAll() // Free access
//                        -----------------------for testing - unlocked link for plain browser
//                        .pathMatchers("/api/v1/skills").permitAll()
                        .anyExchange().authenticated() // All other endpoints require token
                )
                .oauth2ResourceServer( // Configure JWT authentication
                        oauth2 -> oauth2.jwt(Customizer.withDefaults())
                )
                .build();

    }
}
