package com.hun.TodoApplication.repository;

import com.hun.TodoApplication.model.Todo;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface TodoRepository extends JpaRepository<Todo, Integer> {
    Optional<List<Todo>> findByUserUUID(int UUID);
    Optional<Todo> findByUUID(int UUID);
}
