package org.example.compendiumclientservice.controllers;

import jakarta.ws.rs.PathParam;
import lombok.AllArgsConstructor;
import org.example.compendiumclientservice.contracts.Entries;
import org.example.compendiumclientservice.contracts.Entry;
import org.example.compendiumclientservice.services.ICompendiumService;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Mono;

import java.util.List;

@RestController
@RequestMapping("api/v1")
@AllArgsConstructor
public class CompendiumController implements ICompendiumController {
    private final ICompendiumService compendiumService;

    private Mono<ResponseEntity<Page<Entry>>> getEntries(Entries entry, int page) {
        return compendiumService.getEntries(entry, page)
                .map(resultPage -> {
                    if (resultPage.isEmpty()) {
                        return ResponseEntity.status(204).body((Page<Entry>) null);
                    }
                    return ResponseEntity.ok(resultPage);
                })
                .onErrorResume(ex -> {
                    System.err.println("Error fetching entries for " + entry + ": " + ex.getMessage());
                    return Mono.just(ResponseEntity.status(500).body(null));
                });
    }

    @GetMapping("/{entryType}")
    public Mono<ResponseEntity<Page<Entry>>> getEntriesByType(@PathVariable String entryType, @RequestParam(required = false) Integer page) {
        Entries entry;
        try {
            entry = Entries.valueOf(entryType.toUpperCase());
        } catch (IllegalArgumentException ex) {
            return Mono.just(ResponseEntity.badRequest().body(null));
        }
        page = page == null ? 1 : page;

        return getEntries(entry, --page);
    }

}
