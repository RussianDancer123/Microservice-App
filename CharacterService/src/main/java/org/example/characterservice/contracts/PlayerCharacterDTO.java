package org.example.characterservice.contracts;

import java.util.List;

public record PlayerCharacterDTO(String playerName, String name, String classIndex, String raceIndex, List<String> spells, List<String> skills){
}
