package com.restless_hackaubg;

import com.restless_hackaubg.config.SearchIndexBuild;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class RestlessHackaubgApplication {

    public static void main(String[] args) {
        SpringApplication.run(RestlessHackaubgApplication.class, args);
    }

    @Bean
    public ApplicationRunner buildIndex(SearchIndexBuild searchIndexBuild) {
        return (ApplicationArguments args) ->
        {
            searchIndexBuild.indexPersistedData();
        };
    }

}
