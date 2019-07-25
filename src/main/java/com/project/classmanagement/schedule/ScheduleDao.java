package com.project.classmanagement.schedule;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import javax.sql.DataSource;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.project.classmanagement.schedule.Schedule;

public class ScheduleDao {
	private JdbcTemplate jdbcTemplate;
	
	// JdbcTemplate 객체 생성
	public ScheduleDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	//스케줄 조회
	public List<Schedule> searchSchedule_ID(String id) {
		try {
			List<Schedule> result = (List<Schedule>) jdbcTemplate.query("select * from schedule where student_ID=?",
					new Object[] { id }, new RowMapper<Schedule>() {
						public Schedule mapRow(ResultSet rs, int rowNum) throws SQLException {
							Schedule actor = new Schedule(rs.getString("schedule_Name"), rs.getString("schedule_Start"),
									rs.getString("schedule_End"), rs.getString("student_ID"), rs.getString("sub_Name"),
									rs.getString("schedule_Type"));
							return actor;
						}
					});
			return result;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	public int check_schedule(Schedule schedule, String id) {

		Integer result = jdbcTemplate.queryForObject(
				"select count(*) from schedule where schedule_Name=? and schedule_Start=? and schedule_End=? and student_ID=? and sub_Name=? and schedule_Type=?",
				new Object[] { schedule.getSchedule_Name(), schedule.getSchedule_Start(), schedule.getSchedule_End(),
						schedule.getStudent_ID(), schedule.getSub_Name(), schedule.getSchedule_Type() },
				Integer.class);
		return result;
	}

	public HashMap<Integer, Schedule> examschedule(String id) {

		List<Schedule> exams = jdbcTemplate.query("select * from schedule where student_ID=?", new Object[] { id },
				(ResultSet rs, int rowNum) -> {
					Schedule schedule = new Schedule(rs.getString("schedule_Name"), rs.getString("schedule_Start"),
							rs.getString("schedule_End"), rs.getString("student_ID"), rs.getString("sub_Name"),
							rs.getString("schedule_Type"));
					return schedule;
				});
		HashMap<Integer, Schedule> schedule = new HashMap<Integer, Schedule>();
		String[] months = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };
		for (Schedule sch : exams) {
			StringTokenizer token = new StringTokenizer(sch.getSchedule_Start(), " ");
			String rs = "";
			token.nextToken();
			rs = rs + token.nextToken(); // Thu

			for (int a = 0; a < 12; a++) {
				if (rs.equals(months[a])) {
					rs = a >= 9 ? (a + 1) + "" : "0" + (a + 1);
				}
			}
			rs = rs + token.nextToken();
			rs = token.nextToken() + rs;
			schedule.put(Integer.parseInt(rs), sch);
		}

		return schedule;
	}
 
	
	//schedule 테이블에 row 삽입 
	public void insert_schedule(Schedule schedule, String id) {
		jdbcTemplate.update(
				"insert into schedule(schedule_Name, schedule_Start, schedule_End, student_ID, sub_Name,schedule_Type)"
						+ "values(?,?,?,?,?,?)",
				schedule.getSchedule_Name(), schedule.getSchedule_Start(), schedule.getSchedule_End(),
				schedule.getStudent_ID(), schedule.getSub_Name(), schedule.getSchedule_Type());
		System.out.println("삽입 성공~");
	}
   //스케줄삭제
	public void delete_schedule(Schedule schedule, String id) {

		jdbcTemplate.update(
				"delete from schedule where schedule_Name=? and schedule_Start=? and schedule_End=? and student_ID=? and sub_Name=? and schedule_Type=?",
				schedule.getSchedule_Name(), schedule.getSchedule_Start(), schedule.getSchedule_End(), id,
				schedule.getSub_Name(), schedule.getSchedule_Type());
		System.out.println("ddd");

	}

	
  
}