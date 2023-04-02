package com.restless_hackaubg.repositories;

import com.restless_hackaubg.exceptions.EntityNotFoundException;
import com.restless_hackaubg.models.City;
import com.restless_hackaubg.models.Gender;
import com.restless_hackaubg.models.Tag;
import com.restless_hackaubg.models.User;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends PagingAndSortingRepository<User, Integer> {
    User findByUsername(String username) throws EntityNotFoundException;
    List<User> findByGenderAndCity(Gender gender, City city);
//    User findByGenderName(String genderName);
}
