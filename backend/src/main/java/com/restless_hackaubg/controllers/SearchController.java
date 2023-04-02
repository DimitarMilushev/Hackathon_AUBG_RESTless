package com.restless_hackaubg.controllers;

import com.restless_hackaubg.models.User;
import com.restless_hackaubg.models.dtos.RequestMatchDto;
import com.restless_hackaubg.services.SearchService;
import com.restless_hackaubg.utils.Mapper;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.List;


//@AllArgsConstructor
@RestController
@RequestMapping("/search")
public class SearchController {
    private final SearchService searchServices;
    private final Mapper mapper;

    public SearchController(SearchService searchServices, Mapper mapper) {
        this.searchServices = searchServices;
        this.mapper = mapper;
    }

    @PostMapping
    public List<User> getMatching(@Valid @RequestBody RequestMatchDto requestMatchDto) {
        User user = mapper.mapRequestMatchDtoToUser(requestMatchDto);
        return searchServices.getMatches(user);
    }
}
