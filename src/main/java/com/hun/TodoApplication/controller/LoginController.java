package com.hun.TodoApplication.controller;

import com.hun.TodoApplication.model.User;
import com.hun.TodoApplication.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String gotoLogin() {
        return "login";
    }
}
