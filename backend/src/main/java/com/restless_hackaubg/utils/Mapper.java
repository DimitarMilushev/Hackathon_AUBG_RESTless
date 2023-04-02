package com.restless_hackaubg.utils;

import com.restless_hackaubg.models.*;
import com.restless_hackaubg.models.dtos.RequestMatchDto;
import com.restless_hackaubg.repositories.CityRepository;
import com.restless_hackaubg.repositories.CountryRepository;
import com.restless_hackaubg.repositories.GenderRepository;
import com.restless_hackaubg.repositories.TagRepository;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Component
public class Mapper {
    private final TagRepository tagRepository;
    private final GenderRepository genderRepository;
    private final CountryRepository countryRepository;
    private final CityRepository cityRepository;

    public Mapper(TagRepository tagRepository, GenderRepository genderRepository, CountryRepository countryRepository, CityRepository cityRepository) {
        this.tagRepository = tagRepository;
        this.genderRepository = genderRepository;
        this.countryRepository = countryRepository;
        this.cityRepository = cityRepository;
    }

    public User mapRequestMatchDtoToUser(RequestMatchDto requestMatchDto) {
        User user = new User();
        Optional<Gender> gender = genderRepository.findById(requestMatchDto.getGenderId());
        gender.ifPresent(user::setGender);
        Optional<City> city = cityRepository.findById(requestMatchDto.getCityId());
        city.ifPresent(user::setCity);
        Optional<Country> country = countryRepository.findById(requestMatchDto.getCountryId());
        country.ifPresent(value -> city.get().setCountry(value));
        List<Tag> searchedInterests = new ArrayList<>();
        for (Integer id:requestMatchDto.getInterests()) {
            Optional<Tag> optionalTag = tagRepository.findById(id);
            optionalTag.ifPresent(searchedInterests::add);
        }
        user.setInterests(searchedInterests);
        return user;
    }

}
