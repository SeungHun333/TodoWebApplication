package com.hun.TodoApplication.controller;

import com.hun.TodoApplication.model.User;
import com.hun.TodoApplication.service.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RegisterController {
    private final UserService userService;

    public RegisterController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/register")
    public String gotoRegister(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute User user) {
        userService.createUser(user);
        return "login";
    }

    @GetMapping("/checkUserId")
    public ResponseEntity<Boolean> checkUsrId(@RequestParam String userId) {
        boolean result = userService.isValidUserId(userId);
        return ResponseEntity.ok(result);
    }

    @GetMapping("/checkEmail")
    public ResponseEntity<Boolean> checkEmail(@RequestParam String email) {
        boolean result = userService.isValidEmail(email);
        return ResponseEntity.ok(result);
    }
}
