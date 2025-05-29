package org.example.compendiumclientservice.services;

import org.example.compendiumclientservice.contracts.Entries;
import org.example.compendiumclientservice.contracts.Entry;
import org.springframework.data.domain.Page;
import reactor.core.publisher.Mono;

import java.util.List;

public interface ICompendiumService {
    Mono<Page<Entry>> getEntries(Entries entry, int page);
}
