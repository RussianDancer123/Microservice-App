package org.example.compendiumclientservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class CompendiumClientServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(CompendiumClientServiceApplication.class, args);
	}

}
