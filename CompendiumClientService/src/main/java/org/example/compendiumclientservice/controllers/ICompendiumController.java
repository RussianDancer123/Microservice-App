package org.example.compendiumclientservice.controllers;

import org.example.compendiumclientservice.contracts.Entry;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Mono;

import java.util.List;

public interface ICompendiumController {

    Mono<ResponseEntity<List<Entry>>> getEntriesByType(@PathVariable String entryType);
}
