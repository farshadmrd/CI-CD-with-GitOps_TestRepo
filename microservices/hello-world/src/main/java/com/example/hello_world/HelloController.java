package com.example.hello_world;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @Value("${message:Hello default}")
    private String message;

    @GetMapping("/hello")
    public String sayHello() {
        return message;
    }
    
    @GetMapping("/hello/{name}")
    public String personalizedHello(@PathVariable String name) {
        return message + ", " + name + "!";
    }
}