package com.hun.TodoApplication.controller;

import com.hun.TodoApplication.model.Todo;
import com.hun.TodoApplication.model.User;
import com.hun.TodoApplication.service.TodoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class TodoController {
    private final TodoService todoService;

    public TodoController(TodoService todoService) {
        this.todoService = todoService;
    }

    @GetMapping("/todoList")
    public String gotoTodoList(ModelMap model) {
        model.addAttribute("todo", new Todo());
        User user = User.getLoggedInUser();
        List<Todo> todos = todoService.getMyTodoList(user.getUUID());
        model.addAttribute("todos", todos);
        return "todoList";
    }

    @PostMapping("/add-todo")
    public String addTodo(@ModelAttribute Todo todo) {
        todoService.createTodo(todo);
        return "redirect:/todoList";
    }

    @PostMapping("/update-todo")
    public String updateTodo(@ModelAttribute Todo todo) {
        todoService.updateTodo(todo);
        return "redirect:/todoList";
    }

    @RequestMapping("/delete-todo")
    public String deleteTodo(@RequestParam int UUID) {
        todoService.deleteByUUID(UUID);
        return "redirect:/todoList";
    }
}
