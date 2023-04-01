package com.restless_hackaubg.config;

import org.hibernate.search.FullTextSession;
import org.hibernate.search.jpa.FullTextEntityManager;
import org.hibernate.search.jpa.Search;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

@Component
@Transactional
public class SearchIndexBuild {
    private final EntityManager entityManager;

    public SearchIndexBuild(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public void indexPersistedData() throws InterruptedException {
        FullTextEntityManager fullTextEntityManager = Search.getFullTextEntityManager(entityManager);
        fullTextEntityManager.createIndexer().startAndWait();
    }
}
