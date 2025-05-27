package org.example.characterservice;

import org.example.characterservice.repositories.PlayerCharacterRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class CharacterServiceApplication implements CommandLineRunner {

	private final PlayerCharacterRepository playerCharacterRepository;

	public CharacterServiceApplication(PlayerCharacterRepository playerCharacterRepository) {
		this.playerCharacterRepository = playerCharacterRepository;
	}
	public static void main(String[] args) {
		SpringApplication.run(CharacterServiceApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		playerCharacterRepository.flush();
	}
}
