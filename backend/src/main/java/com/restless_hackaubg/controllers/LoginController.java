package com.restless_hackaubg.controllers;

import com.restless_hackaubg.exceptions.EntityNotFoundException;
import com.restless_hackaubg.models.User;
import com.restless_hackaubg.models.dtos.LoginDto;
import com.restless_hackaubg.repositories.UserRepository;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import javax.validation.Valid;

@RestController
@RequestMapping("/login")
public class LoginController {
    private final UserRepository userRepository;

    public LoginController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping
    public String login(@Valid @RequestBody LoginDto loginDto){
        User user;
        try {
            user = userRepository.findByUsername(loginDto.getUsername());
        } catch (EntityNotFoundException e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage());
        }
        if (user.getPassword().equals(loginDto.getPassword())) {
            return "bravo";
        } else return "ne e taka brat";
    }
}
