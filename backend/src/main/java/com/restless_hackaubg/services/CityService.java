package com.restless_hackaubg.services;

import com.restless_hackaubg.exceptions.EntityNotFoundException;
import com.restless_hackaubg.models.City;
import com.restless_hackaubg.models.Country;
import com.restless_hackaubg.repositories.CityRepository;
import com.restless_hackaubg.repositories.CountryRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class CityService {
    private final CityRepository cityRepository;

    public CityService(CityRepository cityRepository) {
        this.cityRepository = cityRepository;
    }

    public City findById(Integer id) {
        Optional<City> country = cityRepository.findById(id);
        if (country.isPresent()) {
            return country.get();
        }
        throw new EntityNotFoundException("City", id);
    }
}
