package com.restless_hackaubg.utils;

import com.restless_hackaubg.models.City;
import com.restless_hackaubg.models.Country;
import com.restless_hackaubg.models.User;
import com.restless_hackaubg.models.dtos.RequestMatchDto;
import com.restless_hackaubg.models.Genders;
import org.springframework.stereotype.Component;

@Component
public class Mapper {
    public User mapRequestMatchDtoToUser(RequestMatchDto requestMatchDto) {
        User user = new User();
        Genders gender = new Genders();
        City city = new City();
        Country country = new Country();
        gender.setName(requestMatchDto.getGender());
        city.setName(requestMatchDto.getCity());
        country.setName(requestMatchDto.getCountry());
        user.setGender(gender);
        user.setCity(city);
        user.setCountry(country);
        return user;
    }

}
