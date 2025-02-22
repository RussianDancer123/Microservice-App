package org.example.compendiumclientservice.client;

import org.example.compendiumclientservice.IUriProvider;
import org.example.compendiumclientservice.contracts.Entries;
import org.example.compendiumclientservice.contracts.Entry;
import reactor.core.publisher.Mono;

import java.util.List;

public interface ICompendiumClient {

    public Mono<List<Entry>> getEntries(Entries entry);
}
