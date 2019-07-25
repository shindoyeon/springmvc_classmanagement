package com.project.classmanagement.course;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.project.classmanagement.course.Course;
import com.project.classmanagement.course.Lecture;

public class CourseDao {
	private JdbcTemplate jdbcTemplate;
	
	// JdbcTemplate 객체 생성
	public CourseDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}


	//강의탭
	//subject 테이블에 row 삽입 
	public int insert_subject(Lecture lecture, String id) {
		int result = jdbcTemplate.queryForObject(
				"select count(*) from subject where sub_Name=? and sub_Pfname=? and sub_Code=?",
				new Object[] { lecture.getSub_Name(), lecture.getSub_Pfname(), id }, Integer.class);

		if (result == 0) {
			jdbcTemplate.update("insert into subject(sub_Name,sub_Pfname,sub_Code)" + "values(?,?,?)",
					lecture.getSub_Name(), lecture.getSub_Pfname(), id);
			return 0;
		}
		return 1;
	}
	//lecture 테이블에 row 삽입
	public void insert_lecture(Lecture lecture, String id) {
		Integer result = jdbcTemplate.queryForObject(
				"select count(*) from lecture where lec_Start=? and lec_End=? and lec_Location=? and lec_Day=? and sub_Name=? and sub_Pfname=? and sub_Code=? ",
				new Object[] { lecture.getLec_Start(), lecture.getLec_End(), lecture.getLec_Location(),
						lecture.getLec_Day(), lecture.getSub_Name(), lecture.getSub_Pfname(), id },
				Integer.class);
		if (result == 0) {
			jdbcTemplate.update(
					"insert into lecture(lec_Start, lec_End, lec_Location, lec_Day, sub_Name, sub_Pfname,sub_Code)"
							+ " values(?,?,?,?,?,?,?)",
					lecture.getLec_Start(), lecture.getLec_End(), lecture.getLec_Location(), lecture.getLec_Day(),
					lecture.getSub_Name(), lecture.getSub_Pfname(), id);
		}
	}
	//course 테이블에 row 삽입
	public void insert_course(Lecture lecture, String id) {

		Integer result = jdbcTemplate.queryForObject(
				"select count(*) from course where sub_Name=? and sub_Pfname=? and student_ID=?",
				new Object[] { lecture.getSub_Name(), lecture.getSub_Pfname(), id }, Integer.class);
		System.out.println(result);
		if (result == 0) {
			jdbcTemplate.update("insert into course(student_ID, sub_Name, sub_Pfname, course_Name)" + "values(?,?,?,?)",
					id, lecture.getSub_Name(), lecture.getSub_Pfname(), "시간표");
		}
	}
	//subject, lecture, course 테이블에서 row 삭제 
	public void delete_class(Lecture lecture, String id) {
		jdbcTemplate.update("delete from lecture where Lec_Day=? and Lec_Start=? and Lec_End=? and sub_Code=?",
				lecture.getLec_Day(), lecture.getLec_Start(), lecture.getLec_End(), id);

		Integer result = jdbcTemplate.queryForObject(
				"select count(*) from lecture where sub_Name=? and sub_Pfname=? and sub_Code=?",
				new Object[] { lecture.getSub_Name(), lecture.getSub_Pfname(), id }, Integer.class);
		System.out.println(result);

		if (result == 0) {
			jdbcTemplate.update("delete from subject where sub_Name=? and sub_Pfname=? and sub_Code=?",
					lecture.getSub_Name(), lecture.getSub_Pfname(), id); // cascade
		}
	}
	
	//모든 lecture 조회 list로 반환
	public List<Lecture> lectureAll() {
		List<Lecture> results = jdbcTemplate.query("select * from lecture", (ResultSet rs, int rowNum) -> {
			Lecture lecture = new Lecture(rs.getString("lec_Start"), rs.getString("lec_End"),
					rs.getString("lec_Location"), rs.getString("lec_Day"), rs.getString("sub_Name"),
					rs.getString("sub_Pfname"), rs.getString("sub_Code"));
			return lecture;
		});
		return results; // 객체 하나씩 반환
	}
	//조건 lecture 조회
	public List<Lecture> lectureSelected(String name, String pfname, String id) {
		try {
			List<Lecture> result = jdbcTemplate.query(
					"select * from lecture where sub_Name=? and sub_Pfname = ? and sub_Code=?",
					new Object[] { name, pfname, id }, new RowMapper<Lecture>() {
						public Lecture mapRow(ResultSet rs, int rowNum) throws SQLException {
							Lecture lecture = new Lecture(rs.getString("sub_Code"), rs.getString("lec_Start"),
									rs.getString("lec_End"), rs.getString("lec_Location"), rs.getString("lec_Day"),
									rs.getString("sub_Name"), rs.getString("sub_Pfname"));
							return lecture;
						}
					});
			return result;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
   //ID에 맞는 course 조회
	public List<Course> courseAll(String id) {
		try {
			List<Course> result = jdbcTemplate.query(
					"select student_ID, sub_Name,sub_Pfname,course_Name from course where student_ID=?",
					new Object[] { id }, new RowMapper<Course>() {
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