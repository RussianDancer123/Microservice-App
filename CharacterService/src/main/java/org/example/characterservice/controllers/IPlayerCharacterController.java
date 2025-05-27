package org.example.characterservice.controllers;

import org.example.characterservice.contracts.PlayerCharacterDTO;
import org.springframework.http.ResponseEntity;
import reactor.core.publisher.Mono;

import java.util.List;

public interface IPlayerCharacterController {

    Mono<ResponseEntity<List<PlayerCharacterDTO>>> getAllPlayerCharacters();
    Mono<ResponseEntity<PlayerCharacterDTO>> getPlayerCharacterByName(String name);
    Mono<ResponseEntity<PlayerCharacterDTO>> getPlayerCharacterByPlayerName(String playerName);
    Mono<ResponseEntity<PlayerCharacterDTO>> createPlayerCharacter(PlayerCharacterDTO playerCharacterDTO);
    Mono<ResponseEntity<PlayerCharacterDTO>> updatePlayerCharacter(PlayerCharacterDTO playerCharacterDTO);
    Mono<ResponseEntity<Void>> deletePlayerCharacterByName(String name);
}
