package com.project.classmanagement.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.project.classmanagement.student.LoginInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginInterceptor())
		.addPathPatterns("/*")
		.excludePathPatterns("/logout")				//logout
		.excludePathPatterns("/login")				//login
		.excludePathPatterns("/logincheck")			//login 검사
		.excludePathPatterns("/register")			//register 
		.excludePathPatterns("/registerCheck")	//register 검사
		.excludePathPatterns("/find_id_form")
		.excludePathPatterns("/find_id")
		.excludePathPatterns("/find_pw_form")
		.excludePathPatterns("/find_pw");
		//WebMvcConfigurer.super.addInterceptors(registry);
	}
}
