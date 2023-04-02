package com.restless_hackaubg.controllers;

import com.restless_hackaubg.exceptions.EntityNotFoundException;
import com.restless_hackaubg.models.City;
import com.restless_hackaubg.models.User;
import com.restless_hackaubg.models.dtos.RegistrationDto;
import com.restless_hackaubg.services.CityService;
import com.restless_hackaubg.services.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/users")
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public List<User> findAll() {
        return userService.findAll();
    }

    @GetMapping("/{id}")
    public User getById(@PathVariable Integer id) {
        try {
            return userService.findById(id);
        } catch (EntityNotFoundException e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage());
        }
    }

//    @PostMapping("/registration")
//    public User register(@Valid @RequestBody RegistrationDto registrationDto) {
//
//    }
}
