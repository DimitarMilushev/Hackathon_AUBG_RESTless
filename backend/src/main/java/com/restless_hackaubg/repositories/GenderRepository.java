package com.restless_hackaubg.repositories;

import com.restless_hackaubg.models.Gender;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface GenderRepository extends PagingAndSortingRepository<Gender, Integer> {
}
