package com.hun.TodoApplication.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.Data;
import lombok.NoArgsConstructor;


import java.time.LocalDate;

@Entity
@Data
@NoArgsConstructor
public class Todo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "todo_UUID",nullable = false, unique = true)
    private int UUID;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_UUID")
    private User user;

    @Size(min = 2, message = "2글자 이상 입력하세요.")
    private String description;

    private LocalDate targetDate;
    private boolean done;
}
