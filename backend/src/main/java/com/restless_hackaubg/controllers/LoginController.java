package com.restless_hackaubg.controllers;

import com.restless_hackaubg.exceptions.EntityNotFoundException;
import com.restless_hackaubg.models.User;
import com.restless_hackaubg.models.dtos.LoginDto;
import com.restless_hackaubg.repositories.UserRepository;
import com.restless_hackaubg.services.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/login")
public class LoginController {
    private final UserService userService;

    public LoginController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping
    public Map<String, String> login(@Valid @RequestBody LoginDto loginDto){
        Map<String, String > result = new HashMap<>();
        User user;
        try {
            user = userService.findUserByUsername(loginDto.getUsername());
        } catch (EntityNotFoundException e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage());
        }
        if (user.getPassword().equals(loginDto.getPassword())) {
            result.put("token", "bravo vleze");
            return result;
        } else result.put("token", "typo");
        return result;
    }
}
