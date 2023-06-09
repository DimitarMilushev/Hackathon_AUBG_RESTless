package com.restless_hackaubg.controllers;

import com.restless_hackaubg.exceptions.EntityNotFoundException;
import com.restless_hackaubg.models.Tag;
import com.restless_hackaubg.models.User;
import com.restless_hackaubg.services.TagService;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("/tags")
public class TagController {
    private final TagService tagService;

    public TagController(TagService tagService) {
        this.tagService = tagService;
    }

    @GetMapping()
    public List<Tag> getAll() {
        return tagService.findAll();
    }

    @GetMapping("/{id}")
    public Tag getById(@PathVariable Integer id) {
        try {
            return tagService.findById(id);
        } catch (EntityNotFoundException e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage());
        }
    }
}
