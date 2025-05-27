package org.example.characterservice.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Entity
@Getter
@Setter
public class PlayerCharacter {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String playerName;
    private String name;
    private String classIndex;
    private String raceIndex;
    @ElementCollection
    private List<String> spells;
    @ElementCollection
    private List<String> skills;
}
