package com.restless_hackaubg.services;

import com.restless_hackaubg.exceptions.EntityNotFoundException;
import com.restless_hackaubg.models.City;
import com.restless_hackaubg.models.Country;
import com.restless_hackaubg.models.Tag;
import com.restless_hackaubg.repositories.CityRepository;
import com.restless_hackaubg.repositories.CountryRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

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

    public List<City> findAll() {
        Iterable<City> cities = cityRepository.findAll();
        List<City> cityList = StreamSupport.stream(cities.spliterator(), false)
                .collect(Collectors.toList());

        return cityList;
    }
}
