package org.example.compendiumclientservice;

import org.example.compendiumclientservice.client.CompendiumClient;
import org.example.compendiumclientservice.contracts.Entries;
import org.example.compendiumclientservice.contracts.Entry;
import org.example.compendiumclientservice.contracts.EntryResults;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.test.util.ReflectionTestUtils;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.List;

import static org.assertj.core.api.Assertions.fail;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;
import static org.mockito.Mockito.verify;

@SpringBootTest
class CompendiumClientServiceApplicationTests {

	@Test
	void compendiumClient_printRealResults() {
		Entries name = Entries.SPELLS;
		WebClient webClient = WebClient.create();
		IUriProvider uriProvider = () -> "www.dnd5eapi.co";
		CompendiumClient compendiumClient = new CompendiumClient(uriProvider, webClient);

		try {
			List<Entry> entries = compendiumClient.getEntries(name).block();

			System.out.println("Response for name (" + name + "):");
			entries.forEach(System.err::println);
		} catch (Exception e) {
			System.err.println("Exception occurred while fetching entries: " + e.getMessage());
			e.printStackTrace();
		}
	}

	@Test
	void uriProviderHostInjection(){
		String expectedHost = "http://awd.com";

		UriProvider uriProvider = new UriProvider(expectedHost);

		assertEquals(expectedHost, uriProvider.host(),
				"Host should be injected and match");
	}

	@Test
	void uriProviderAnnotationBinding(){
		String annotationValue = "dnd5api.host";

		UriProvider uriProvider = new UriProvider(annotationValue);

		String injectedHost = (String) ReflectionTestUtils
				.getField(uriProvider, "host");

		assertEquals(annotationValue, injectedHost,
				"Host should be injected from @Value annotation and match");
	}

	@Test
	void entriesEnumTest(){
		assertEquals("spells", Entries.SPELLS.getPath(), "The SPELLS entry path should be spells");
		assertEquals("skills", Entries.SKILLS.getPath(), "The SKILLS entry path should be skills");
	}

	/**
	 * to do
	 */
//	@Test
//	void compendiumClientTest_failure() {
//		String name = "test";
//		String mockUri = "http://example.com/test";
//		IUriProvider uriProvider = mock(IUriProvider.class);
//
//		UriComponentsBuilder uriComponentsBuilder = mock(UriComponentsBuilder.class);
//
//		when(uriProvider.builder()).thenReturn(uriComponentsBuilder);
//		when(uriComponentsBuilder.pathSegment(name)).thenReturn(uriComponentsBuilder);
//		when(uriComponentsBuilder.toUriString()).thenReturn(mockUri);
//
//		RestTemplate restTemplate = mock(RestTemplate.class);
//		when(restTemplate.getForEntity(mockUri, EntryResults.class))
//				.thenThrow(new RuntimeException("API call failed"));
//
//		CompendiumClient compendiumClient = new CompendiumClient(uriProvider, restTemplate);
//
//        try {
//            compendiumClient.getEntries(name);
//			fail("Expected RuntimeException was not thrown");
//        } catch (RuntimeException ex) {
//			assertEquals("API call failed", ex.getMessage());
//			verify(uriProvider).builder();
//			verify(restTemplate).getForEntity(mockUri, EntryResults.class);
//        }
//    }

}
