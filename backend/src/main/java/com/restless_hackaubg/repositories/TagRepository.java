package com.restless_hackaubg.repositories;

import com.restless_hackaubg.models.Tag;
import com.restless_hackaubg.models.User;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TagRepository extends PagingAndSortingRepository<Tag, Integer> {
}
