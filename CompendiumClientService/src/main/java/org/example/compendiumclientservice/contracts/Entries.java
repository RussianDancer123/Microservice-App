package org.example.compendiumclientservice.contracts;

import lombok.Getter;

@Getter
public enum Entries {
    SPELLS("spells"),
    SKILLS("skills"),
    RACES("races"),
    CLASSES("classes");

    private final String path;

    Entries(String path) {
        this.path = path;
    }
}
