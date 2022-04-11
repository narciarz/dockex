package com.example.dockex.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SomeController {

    @GetMapping("/")
    public String what() {
        return "Hello im here";
    }

    @GetMapping("/api")
    public String api() {
        return "It's api here";
    }
}
