package com.restless_hackaubg.services;

import com.restless_hackaubg.models.User;
import org.apache.lucene.search.Query;
import org.hibernate.search.jpa.FullTextEntityManager;
import org.hibernate.search.jpa.FullTextQuery;
import org.hibernate.search.jpa.Search;
import org.hibernate.search.query.dsl.BooleanJunction;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import java.util.List;

@Service
//@AllArgsConstructor
public class SearchServices {
    private final EntityManager entityManager;

    public SearchServices(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public List<User> getMatches(User requestUser){
//        Optional<User> searcher = userRepository.findById(searcherId);
//        if (!searcher.isPresent()) {
//            throw new EntityNotFoundException("User", searcherId);
//        }
//        User requestUser = searcher.get();

        FullTextEntityManager fullTextEntityManager = Search.getFullTextEntityManager(entityManager);
        QueryBuilder queryBuilder = fullTextEntityManager
                .getSearchFactory()
                .buildQueryBuilder()
                .forEntity(User.class)
                .get();
        BooleanJunction booleanJunction = queryBuilder.bool();


        Query queryCountry = generateCountryQuery(fullTextEntityManager, requestUser.getCountry().getName());
        booleanJunction.should(queryCountry);



        Query queryCity = generateCityQuery(fullTextEntityManager, requestUser.getCity().getName());
        booleanJunction.should(queryCity);


        Query queryGender = generateGenderQuery(fullTextEntityManager, requestUser.getGender().getName());
        booleanJunction.should(queryGender);

        Query finalQuery = booleanJunction.createQuery();

        FullTextQuery fullTextQuery = fullTextEntityManager.createFullTextQuery(finalQuery, User.class);
        fullTextQuery.setSort(queryBuilder.sort().byScore().createSort());
        fullTextQuery.setMaxResults(10);

        return (List<User>) fullTextQuery.getResultList();
    }

    private Query generateGenderQuery(FullTextEntityManager fullTextEntityManager, String gender) {
        QueryBuilder queryBuilder = fullTextEntityManager
                .getSearchFactory()
                .buildQueryBuilder()
                .forEntity(User.class)
                .get();

        return queryBuilder
                .keyword()
                .onField("gender.name")
                .matching(gender)
                .createQuery();
    }

    private Query generateCityQuery(FullTextEntityManager fullTextEntityManager, String city) {
        QueryBuilder queryBuilder = fullTextEntityManager
                .getSearchFactory()
                .buildQueryBuilder()
                .forEntity(User.class)
                .get();

        return queryBuilder
                .keyword()
                .onField("city")
                .matching(city)
                .createQuery();
    }

    private Query generateCountryQuery(FullTextEntityManager fullTextEntityManager, String country) {
        QueryBuilder queryBuilder = fullTextEntityManager
                .getSearchFactory()
                .buildQueryBuilder()
                .forEntity(User.class)
                .get();

        return queryBuilder
                .keyword()
                .onField("country")
                .matching(country)
                .createQuery();
    }


}
