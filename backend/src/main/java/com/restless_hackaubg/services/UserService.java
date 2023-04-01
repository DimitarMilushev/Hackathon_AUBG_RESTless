package com.restless_hackaubg.services;

import com.restless_hackaubg.exceptions.EntityNotFoundException;
import com.restless_hackaubg.models.User;
import com.restless_hackaubg.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    private final UserRepository repository;

    @Autowired
    public UserService(UserRepository repository) {
        this.repository = repository;
    }

    public User findUserByUsername(String username) throws EntityNotFoundException {
        User user = repository.findByUsername(username);
        if (user == null) {
            throw new EntityNotFoundException("User", "username", username);
        }
        return user;
    }
}
