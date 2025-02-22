package org.example.compendiumclientservice.contracts;

import java.util.List;

public record EntryResults(int count, List<Entry> results) {
}
