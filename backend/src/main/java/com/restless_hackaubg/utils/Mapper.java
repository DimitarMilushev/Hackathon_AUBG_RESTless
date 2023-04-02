package com.restless_hackaubg.utils;

import com.restless_hackaubg.models.*;
import com.restless_hackaubg.models.dtos.RequestMatchDto;
import com.restless_hackaubg.repositories.CityRepository;
import com.restless_hackaubg.repositories.CountryRepository;
import com.restless_hackaubg.repositories.GenderRepository;
import com.restless_hackaubg.services.CityService;
import com.restless_hackaubg.services.CountryService;
import com.restless_hackaubg.services.GenderService;
import com.restless_hackaubg.services.TagService;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Component
public class Mapper {
    private final TagService tagService;
    private final GenderService genderService;
    private final CountryService countryService;
    private final CityService cityService;

    public Mapper(TagService tagService, GenderService genderService, CountryService countryService, CityService cityService) {
        this.tagService = tagService;
        this.genderService = genderService;
        this.countryService = countryService;
        this.cityService = cityService;
    }

    public User mapRequestMatchDtoToUser(RequestMatchDto requestMatchDto) {
        User user = new User();
        user.setGender(genderService.findById(requestMatchDto.getGenderId()));
        user.setCity(cityService.findById(requestMatchDto.getGenderId()));
        List<Tag> searchedInterests = new ArrayList<>();
        for (Integer id:requestMatchDto.getInterests()) {
            Tag optionalTag = tagService.findById(id);
            searchedInterests.add(optionalTag);
        }
        user.setInterests(searchedInterests);
        return user;
    }

}
