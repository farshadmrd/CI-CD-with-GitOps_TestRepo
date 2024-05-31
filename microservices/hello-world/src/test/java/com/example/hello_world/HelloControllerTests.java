package com.example.hello_world;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;

@SpringBootTest
@AutoConfigureMockMvc
public class HelloControllerTests {

    @Autowired
    private MockMvc mockMvc;

     // Test for the /hello endpoint
     @Test
     public void testHello() throws Exception {
         this.mockMvc.perform(get("/hello"))
                 .andExpect(status().isOk())
                 .andExpect(content().string("Hello World!"));
     }
 
     // Test for the /hello/{name} endpoint
     @Test
     public void testPersonalizedHello() throws Exception {
         this.mockMvc.perform(get("/hello/John"))
                 .andExpect(status().isOk())
                 .andExpect(content().string("Hello, John!"));
     }
 }