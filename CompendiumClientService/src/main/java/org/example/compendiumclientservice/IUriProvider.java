package org.example.compendiumclientservice;

import org.springframework.web.util.UriComponentsBuilder;

public interface IUriProvider {
    String host();

    default UriComponentsBuilder builder(){
        return UriComponentsBuilder.newInstance()
                .scheme("https")
                .path("api/2014")
                .host(host());
    }
}
