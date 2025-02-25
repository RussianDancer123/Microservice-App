package org.example.compendiumclientservice.services;

import org.example.compendiumclientservice.contracts.Entries;
import org.example.compendiumclientservice.contracts.Entry;
import reactor.core.publisher.Mono;

import java.util.List;

public interface ICompendiumService {
    Mono<List<Entry>> getEntries(Entries entry);
}
