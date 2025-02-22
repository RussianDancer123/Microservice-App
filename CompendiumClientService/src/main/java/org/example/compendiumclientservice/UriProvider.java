package org.example.compendiumclientservice;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public record UriProvider(String host) implements IUriProvider {

    public UriProvider(@Value("${dnd5api.host}") String host) {
        this.host = host;
    }
}
