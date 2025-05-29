package org.example.compendiumclientservice.services;

import lombok.AllArgsConstructor;
import org.example.compendiumclientservice.client.ICompendiumClient;
import org.example.compendiumclientservice.contracts.Entries;
import org.example.compendiumclientservice.contracts.Entry;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Mono;

import java.util.List;

@Service
@AllArgsConstructor
public class CompendiumService implements ICompendiumService {
    private final ICompendiumClient compendiumClient;

    @Override
    public Mono<Page<Entry>> getEntries(Entries entry, int page) {
        int pageSize = 20;
        return compendiumClient.getEntries(entry)
                .onErrorResume(e -> Mono.just(List.of()))
                .defaultIfEmpty(List.of())
                .map(entries -> {
                    int start = page * pageSize;
                    int end = Math.min(entries.size(), (page + 1) * pageSize);
                    return new PageImpl<>(
                            entries.subList(start, end),
                            PageRequest.of(page, pageSize),
                            entries.size()
                    );
                });
    }
}
