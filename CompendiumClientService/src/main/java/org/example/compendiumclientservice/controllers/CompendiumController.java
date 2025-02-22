package org.example.compendiumclientservice.controllers;

import lombok.AllArgsConstructor;
import org.example.compendiumclientservice.contracts.Entries;
import org.example.compendiumclientservice.contracts.Entry;
import org.example.compendiumclientservice.services.ICompendiumService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1")
@AllArgsConstructor
public class CompendiumController implements ICompendiumController {
    private final ICompendiumService compendiumService;

    private List<Entry> getEntries(Entries entry) {
        return compendiumService.getEntries(entry);
    }

    @Override
    @GetMapping("/skills")
    public ResponseEntity<List<Entry>> getSkills() {
        return ResponseEntity.ok(getEntries(Entries.SKILLS));
    }

    @Override
    @GetMapping("/spells")
    public ResponseEntity<List<Entry>> getSpells() {
        return ResponseEntity.ok(getEntries(Entries.SPELLS));
    }

    @Override
    @GetMapping("/races")
    public ResponseEntity<List<Entry>> getRaces() {
        return ResponseEntity.ok(getEntries(Entries.RACES));
    }

    @Override
    @GetMapping("/classes")
    public ResponseEntity<List<Entry>> getClasses() {
        return ResponseEntity.ok(getEntries(Entries.CLASSES));
    }
}
