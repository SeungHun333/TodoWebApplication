package com.hun.TodoApplication.service;

import com.hun.TodoApplication.model.User;
import com.hun.TodoApplication.repository.UserRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class CustomUserDetailsService implements UserDetailsService {
    private final UserRepository userRepository;

    public CustomUserDetailsService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
        Optional<User> optionalUser = userRepository.findByUserId(userId);

        if(optionalUser.isEmpty())
            throw  new UsernameNotFoundException(userId);

        return optionalUser.get();
    }
}
