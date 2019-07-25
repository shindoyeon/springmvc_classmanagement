package com.project.classmanagement.task;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.project.classmanagement.schedule.Schedule;
import com.project.classmanagement.student.Student;

public class TeamDao {
	private JdbcTemplate jdbcTemplate;

	// JdbcTemplate 객체 생성
	public TeamDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public List<Team> select_TeamName(String n) {
		try {
			List<Team> results = jdbcTemplate.query("select * from team where student_ID=?",new Object[]{n}, (ResultSet rs, int rowNum) -> {
				Team team = new Team(rs.getString("team_Name"),rs.getString("student_ID"));
			
				return team;
		});
		return results; // 객체 하나씩 반환
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	public TeamProject select(int num) {
		try {
			TeamProject result = jdbcTemplate.queryForObject("select * from team_project where project_Num=?",
					new Object[] { num }, new RowMapper<TeamProject>() {
						public TeamProject mapRow(ResultSet rs, int rowNum) throws SQLException {
							TeamProject actor = new TeamProject(
									rs.getInt("project_Num"),rs.getString("project_Title"),
									rs.getString("student_ID")
									,rs.getString("team_Name"),rs.getString("project_detail"));
							return actor;
						}
					});
			return result;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	public List<Team> selectNames(String n) {
		try {
			List<Team> results = jdbcTemplate.query("select * from team where team_Name=?",new Object[]{n}, (ResultSet rs, int rowNum) -> {
				Team team = new Team(rs.getString("team_Name"),rs.getString("student_ID"));
			
				return team;
		});
		return results; // 객체 하나씩 반환
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	
	public int dupleCheck(String n) {
		Integer result = jdbcTemplate.queryForObject("select count(*) from team where team_Name=?",
				new Object[] { n }, Integer.class);
		return result;
	}
	
	public List<TeamProject> select_teamProjects(String n) {
		try {
			List<TeamProject> results = jdbcTemplate.query("select * from team_project where team_Name=?",new Object[]{n}, (ResultSet rs, int rowNum) -> {
				TeamProject team = new TeamProject(rs.getInt("project_Num"), rs.getString("project_Title"), rs.getString("student_ID"),rs.getString("team_Name"), rs.getString("project_detail"));
			
				return team;
		});
		return results; // 객체 하나씩 반환
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	public boolean insert(Team team) {
		try {
		jdbcTemplate.update(
				"insert into team(team_Name,student_ID) "
						+ "values(?,?)",
						team.getTeam_Name(), team.getStudent_ID());
		return true;

	}catch (EmptyResultDataAccessException e) {
		e.printStackTrace();
		return false;
	}
		
	}
	
	public boolean insert_Projects(TeamProject project) {
		try {
		jdbcTemplate.update(
				"insert into team_project(project_Title,student_ID, team_Name,project_Detail) "
						+ "values(?,?,?,?)",
						project.getProject_Title(), project.getStudent_ID(),project.getTeam_Name(), project.getProject_Detail());
		return true;

	}catch (EmptyResultDataAccessException e) {
		e.printStackTrace();
		return false;
	}
		
	}
	
	public void delete(TeamProject project, int num) {
		
		jdbcTemplate.update(
				"delete from team_project where project_Num=?",
				num);

	}
	
	public boolean insertPerson(Team team) {
		try {
		jdbcTemplate.update(
				"insert into team(team_Name,student_ID) "
						+ "values(?,?)",
						team.getTeam_Name(), team.getStudent_ID());
		return true;

	}catch (EmptyResultDataAccessException e) {
		e.printStackTrace();
		return false;
	}
		
	}
	
	public List<TeamProject> showboardContents(int n) {
		try {
			List<TeamProject> results = jdbcTemplate.query("select * from team_project where project_Num=?",new Object[]{n}, (ResultSet rs, int rowNum) -> {
				TeamProject team = new TeamProject(rs.getInt("project_Num"), rs.getString("project_Title"), rs.getString("student_ID"),rs.getString("team_Name"), rs.getString("project_Detail"));
			
				return team;
		});
		return results; // 객체 하나씩 반환
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

}
