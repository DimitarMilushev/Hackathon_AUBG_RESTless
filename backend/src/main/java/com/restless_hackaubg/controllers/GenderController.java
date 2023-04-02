package com.restless_hackaubg.controllers;

import com.restless_hackaubg.models.Gender;
import com.restless_hackaubg.services.GenderService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/genders")
public class GenderController {
    final private GenderService genderService;

    public GenderController(GenderService genderService) {
        this.genderService = genderService;
    }

    @GetMapping
    public List<Gender> findAll() {
        return genderService.findAll();
    }
}
