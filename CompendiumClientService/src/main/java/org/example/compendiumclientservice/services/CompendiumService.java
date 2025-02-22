package org.example.compendiumclientservice.services;

import lombok.AllArgsConstructor;
import org.example.compendiumclientservice.client.ICompendiumClient;
import org.example.compendiumclientservice.contracts.Entries;
import org.example.compendiumclientservice.contracts.Entry;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class CompendiumService implements ICompendiumService {
    private final ICompendiumClient compendiumClient;

    @Override
    public List<Entry> getEntries(Entries entry) {
        return compendiumClient.getEntries(entry).block();
    }
}
