package org.example.compendiumclientservice;

import org.example.compendiumclientservice.client.CompendiumClient;
import org.example.compendiumclientservice.contracts.Entries;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class CompendiumClientServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(CompendiumClientServiceApplication.class, args);
	}

}
