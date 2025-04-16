package com.hun.TodoApplication.service;

import com.hun.TodoApplication.model.User;
import com.hun.TodoApplication.repository.UserRepository;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository repository) {
        this.userRepository = repository;
    }

    public void createUser(User user) {
        user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
        user.setRole("ROLE_USER");
        userRepository.save(user);
    }

    public boolean isValidUserId(String userId) {
        return !userRepository.existsByUserId(userId);
    }

    public boolean isValidEmail(String email) {
        return !userRepository.existsByEmail(email);
    }
}
