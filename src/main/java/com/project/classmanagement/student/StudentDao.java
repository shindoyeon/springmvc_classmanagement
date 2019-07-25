package com.project.classmanagement.student;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.*;

import com.project.classmanagement.student.Student;

public class StudentDao {
	private JdbcTemplate jdbcTemplate;

	// JdbcTemplate 객체 생성
	public StudentDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	// db에서 student table data를 전부 불러옴
	public List<Student> selectAll() {
		List<Student> results = jdbcTemplate.query("select * from student", (ResultSet rs, int rowNum) -> {
			Student student = new Student( rs.getString("student_Name"),rs.getString("student_Email"), 
					rs.getString("student_PW"), rs.getString("student_ID"));
			return student;
		});
		return results; // 객체 하나씩 반환
	}

	// 아이디 중복 체크를 위해 db에서 하나의 컬럼 객체를 리턴한다.
	public Student selectOne(String name) {
		try {
			Student result = jdbcTemplate.queryForObject("select student_ID from student where student_ID=?",
					new Object[] { name }, new RowMapper<Student>() {
						public Student mapRow(ResultSet rs, int rowNum) throws SQLException {
							Student actor = new Student();
							actor.setStudent_ID(rs.getString("student_ID"));
							return actor;
						}
					});
			return result;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	// db에 각 컬럼을 insert(삽입)한다.
	public int insert(Student member) {
		return jdbcTemplate.update(
				"insert into student(student_Name, student_Email,  student_PW, student_ID) "
						+ "values(?,?,?,?)",
				 member.getStudent_Name(),  member.getStudent_Email(),
				member.getStudent_PW(), member.getStudent_ID());

	}
}
