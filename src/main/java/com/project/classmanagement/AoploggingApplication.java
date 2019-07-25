package com.project.classmanagement;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@EnableAspectJAutoProxy
@SpringBootApplication
public class AoploggingApplication {
 
    public static void main(String[] args) {
        SpringApplication.run(AoploggingApplication.class, args);
    }
}

