package org.example.compendiumclientservice.client;

import lombok.AllArgsConstructor;
import org.example.compendiumclientservice.IUriProvider;
import org.example.compendiumclientservice.contracts.Entries;
import org.example.compendiumclientservice.contracts.Entry;
import org.example.compendiumclientservice.contracts.EntryResults;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;

import java.util.List;

@AllArgsConstructor
@Component
public class CompendiumClient implements ICompendiumClient {
    private final IUriProvider uriProvider;
    private final WebClient webClient;

    @Override
    public Mono<List<Entry>> getEntries(Entries entry) {

        /**
         * add exceptions and tests
         * HTTPStatus 404 ???
         */
        var uri = uriProvider.builder().pathSegment(entry.getPath()).toUriString();

        return webClient.get()
                .uri(uri)
                .accept(MediaType.APPLICATION_JSON)
                .retrieve()
                .onStatus(HttpStatusCode::is4xxClientError, response -> {
                    if (response.statusCode().value() == 404) {
                        return Mono.error(new RuntimeException("404 Not Found: Unable to find resource at " + uri));
                    }
                    return response.createException()
                            .flatMap(error -> Mono.error(new RuntimeException("Client error: " + error.getMessage(), error)));
                })
                .onStatus(HttpStatusCode::is3xxRedirection, response -> {
                    return response.headers()
                            .asHttpHeaders()
                            .getLocation() != null
                            ? Mono.error(new RuntimeException("Redirected to " + response.headers().asHttpHeaders().getLocation()))
                            : Mono.error(new RuntimeException("Redirection occurred but no 'Location' header was found."));
                })
                .onStatus(HttpStatusCode::is5xxServerError, response -> {
                    return response.createException()
                            .flatMap(error -> Mono.error(new RuntimeException("Server error: " + error.getMessage(), error)));
                })
                .bodyToMono(EntryResults.class)
                .map(response -> response != null
                && response.results() != null ?
                        response.results() : List.of());

    }
}
