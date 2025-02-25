package org.example.compendiumclientservice.controllers;

import lombok.AllArgsConstructor;
import org.example.compendiumclientservice.contracts.Entries;
import org.example.compendiumclientservice.contracts.Entry;
import org.example.compendiumclientservice.services.ICompendiumService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;

import java.util.List;

@RestController
@RequestMapping("api/v1")
@AllArgsConstructor
public class CompendiumController implements ICompendiumController {
    private final ICompendiumService compendiumService;

    private Mono<ResponseEntity<List<Entry>>> getEntries(Entries entry) {
        return compendiumService.getEntries(entry)
                .map(entries -> {
                    if (entries.isEmpty()) {
                        return ResponseEntity.status(204).body((List<Entry>) null);
                    }
                    return ResponseEntity.ok(entries);
                })
                .onErrorResume(ex -> {
                    System.err.println("Error fetching entries for " + entry + ": " + ex.getMessage());
                    return Mono.just(ResponseEntity.status(500).body(null));
                });


    }

    @GetMapping("/{entryType}")
    public Mono<ResponseEntity<List<Entry>>> getEntriesByType(@PathVariable String entryType) {
        Entries entry;
        try {
            entry = Entries.valueOf(entryType.toUpperCase());
        } catch (IllegalArgumentException ex) {
            return Mono.just(ResponseEntity.badRequest().body(null));
        }

        return getEntries(entry);
    }

}
