package com.restless_hackaubg.services;

import com.restless_hackaubg.exceptions.EntityNotFoundException;
import com.restless_hackaubg.models.Country;
import com.restless_hackaubg.repositories.CountryRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class CountryService {
    private final CountryRepository countryRepository;

    public CountryService(CountryRepository countryRepository) {
        this.countryRepository = countryRepository;
    }

    public Country findById(Integer id) {
        Optional<Country> country = countryRepository.findById(id);
        if (country.isPresent()) {
            return country.get();
        }
        throw new EntityNotFoundException("Country", id);
    }
}
