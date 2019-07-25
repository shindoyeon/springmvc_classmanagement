package com.project.classmanagement.configuration;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.project.classmanagement.course.CourseDao;
import com.project.classmanagement.schedule.ScheduleDao;
import com.project.classmanagement.student.StudentDao;
import com.project.classmanagement.student.StudentService;
import com.project.classmanagement.task.SubjectDao;
import com.project.classmanagement.task.TaskDao;
import com.project.classmanagement.task.TeamDao;

@Configuration
public class JavaConfig{
	
	@Bean(destroyMethod="close")
	public DataSource dataSource() {
		DataSource ds = new DataSource();
		ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
		ds.setUrl("jdbc:mysql://localhost:3306/management?allowPublicKeyRetrieval=true&useSSL=false&characterEncoding=utf-8&serverTimezone=UTC");
		ds.setUsername("spring5");
		ds.setPassword("spring5");
		ds.setInitialSize(2);
		ds.setMaxActive(10);
		ds.setTestWhileIdle(true);
		ds.setMinEvictableIdleTimeMillis(60000*3);
		ds.setTimeBetweenEvictionRunsMillis(10*1000);
		return ds;
	}
	@Bean
	public StudentDao studentDao() {
		return new StudentDao(dataSource());	
	}
	@Bean
	public StudentService studentservice() {
		return new StudentService(dataSource());	
		
	}
	@Bean
	public SubjectDao subjectDao() {
		return new SubjectDao(dataSource());
	}
	
	@Bean
	public TaskDao taskDao() {
		return new TaskDao(dataSource());
	}
	
	@Bean
	public TeamDao teamDao() {
		return new TeamDao(dataSource());
	}
	@Bean
	public CourseDao courseDao() {
		return new CourseDao(dataSource());
	}
	@Bean
	public ScheduleDao scheduleDao() {
		return new ScheduleDao(dataSource());
	}
	
	

}
