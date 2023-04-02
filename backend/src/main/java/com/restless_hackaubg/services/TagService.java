package com.restless_hackaubg.services;

import com.restless_hackaubg.models.Tag;
import com.restless_hackaubg.repositories.TagRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

@Service
public class TagService {
    private final TagRepository tagRepository;

    public TagService(TagRepository tagRepository) {
        this.tagRepository = tagRepository;
    }

    public List<Tag> findAll() {
        Iterable<Tag> tags = tagRepository.findAll();
        List<Tag> tagList = StreamSupport.stream(tags.spliterator(), false)
                .collect(Collectors.toList());

        return tagList;
    }
}
