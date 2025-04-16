package com.hun.TodoApplication.service;

import com.hun.TodoApplication.model.Todo;
import com.hun.TodoApplication.model.User;
import com.hun.TodoApplication.repository.TodoRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class TodoService {
    private final TodoRepository repository;

    public TodoService(TodoRepository repository) {
        this.repository = repository;
    }

    public List<Todo> getMyTodoList(int userUUID) {
        Optional<List<Todo>> optionalTodos = repository.findByUserUUID(userUUID);
        return optionalTodos.orElseGet(ArrayList::new);
    }

    public void createTodo(Todo todo) {
        User user = User.getLoggedInUser();
        todo.setUser(user);
        repository.save(todo);
    }

    public void updateTodo(Todo todo) {
        createTodo(todo);
    }

    public void deleteByUUID(int UUID) {
        Optional<Todo> optionalTodo = repository.findByUUID(UUID);

        if(optionalTodo.isEmpty()){
            return;
        }

        Todo todo = optionalTodo.get();
        repository.delete(todo);
    }
}
