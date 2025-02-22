package org.example.compendiumclientservice.controllers;

import org.example.compendiumclientservice.contracts.Entry;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

public interface ICompendiumController {

    public ResponseEntity<List<Entry>> getSpells();
    public ResponseEntity<List<Entry>> getSkills();
    public ResponseEntity<List<Entry>> getRaces();
    public ResponseEntity<List<Entry>> getClasses();
}
