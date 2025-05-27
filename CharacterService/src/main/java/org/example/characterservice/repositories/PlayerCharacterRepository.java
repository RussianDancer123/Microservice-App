package org.example.characterservice.repositories;

import org.example.characterservice.model.PlayerCharacter;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PlayerCharacterRepository extends JpaRepository<PlayerCharacter, Long> {
}
