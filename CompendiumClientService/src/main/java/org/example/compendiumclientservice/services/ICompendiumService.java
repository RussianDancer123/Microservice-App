package org.example.compendiumclientservice.services;

import org.example.compendiumclientservice.contracts.Entries;
import org.example.compendiumclientservice.contracts.Entry;
import org.example.compendiumclientservice.contracts.EntryResults;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface ICompendiumService {
    List<Entry> getEntries(Entries entry);
}
