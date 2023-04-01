package com.restless_hackaubg.repositories;

import com.restless_hackaubg.models.User;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

public interface UserRepository extends PagingAndSortingRepository<User, Integer> {
    User findByUsername(String username);
//    User findByGenderName(String genderName);
}
