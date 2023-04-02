package com.restless_hackaubg.repositories;

import com.restless_hackaubg.models.City;
import com.restless_hackaubg.models.Gender;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface CityRepository extends PagingAndSortingRepository<City, Integer> {
}
