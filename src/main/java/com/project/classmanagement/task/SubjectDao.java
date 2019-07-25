package com.project.classmanagement.task;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.project.classmanagement.course.Course;
import com.project.classmanagement.student.Student;

public class SubjectDao {
	
	private JdbcTemplate jdbcTemplate;

	// JdbcTemplate 객체 생성
	public SubjectDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public List<Course> selectName(String n) {
		try {
			List<Course> result = jdbcTemplate.query("select * from course where student_ID=?", new Object[] {n},
					new RowMapper<Course>() {
						public Course mapRow(ResultSet rs, int rowNum) throws SQLException {
							Course course = new Course(rs.getString("student_ID"), rs.getString("sub_Name"),
									rs.getString("sub_Pfname"), rs.getString("course_Name"));
							return course;
						}
					});
			return result;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}	


	
}