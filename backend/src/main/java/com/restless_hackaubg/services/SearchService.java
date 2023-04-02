package com.restless_hackaubg.services;

import com.restless_hackaubg.models.Tag;
import com.restless_hackaubg.models.User;
import com.restless_hackaubg.repositories.UserRepository;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class SearchService {
    private final UserRepository userRepository;

    public SearchService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> getMatches(User user) {
        Tag recentInterest = user.getInterests().get(user.getInterests().size()-1);
        List<User> allMatches = userRepository
                .findByGenderAndCity(user.getGender(), user.getCity());
        Map<User, Integer> matchingFieldsCounter = new HashMap<>();
        for (User match:allMatches) {
            matchingFieldsCounter.put(match, countFieldsMatched(match, user, 0, recentInterest));
        }
        List<User> closestMatches = matchingFieldsCounter.entrySet()
                .stream()
                .sorted(Map.Entry.comparingByValue(Comparator.reverseOrder()))
                .limit(5)
                .map(Map.Entry::getKey)
                .collect(Collectors.toList());
        return closestMatches;
    }

    public Integer countFieldsMatched(User match, User searcher, int count, Tag recentInterest) {
        if (match.getGender().getId() == searcher.getGender().getId()) {
            count++;
        }
        if (match.getCity().getId() == searcher.getCity().getId()) {
            count++;
        }
        if (match.getInterests().contains(recentInterest)) {
            count++;
        }
        return count;
    }
}
