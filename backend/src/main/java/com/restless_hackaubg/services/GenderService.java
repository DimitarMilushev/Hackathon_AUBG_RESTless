package com.restless_hackaubg.services;

import com.restless_hackaubg.exceptions.EntityNotFoundException;
import com.restless_hackaubg.models.Country;
import com.restless_hackaubg.models.Gender;
import com.restless_hackaubg.repositories.CountryRepository;
import com.restless_hackaubg.repositories.GenderRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class GenderService {
    private final GenderRepository genderRepository;

    public GenderService(GenderRepository genderRepository) {
        this.genderRepository = genderRepository;
    }

    public Gender findById(Integer id) {
        Optional<Gender> country = genderRepository.findById(id);
        if (country.isPresent()) {
            return country.get();
        }
        throw new EntityNotFoundException("Gender", id);
    }
}
