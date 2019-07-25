package com.project.classmanagement.task;

import java.sql.ResultSet;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import com.project.classmanagement.task.Task;

public class TaskDao {
	private JdbcTemplate jdbcTemplate;

	// JdbcTemplate 객체 생성
	public TaskDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	
	public List<Task> selectTasks(String n) {
		try {
			//task_Name=? 로 세션 넘겨서 받기 나중에!
			List<Task> results = jdbcTemplate.query("select * from task where student_ID=?",new Object[]{n}, (ResultSet rs, int rowNum) -> {
				Task task = new Task(rs.getInt("num"),rs.getString("task_Name"), rs.getString("task_Pfname"), rs.getString("task_Todo"),rs.getString("task_Person"),rs.getString("task_Deadline"), rs.getString("student_ID"));
			
				return task;
		});
		return results; // 객체 하나씩 반환
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	public List<Task> selectTaskTodos(String n, String todo) {
		try {
			//task_Name=? 로 세션 넘겨서 받기 나중에!
		List<Task> results = jdbcTemplate.query("select * from task where student_ID=? and task_Todo=?",new Object[]{n,todo}, (ResultSet rs, int rowNum) -> {
			Task task = new Task(rs.getInt("num"),rs.getString("task_Name"), rs.getString("task_Pfname"), rs.getString("task_Todo"),rs.getString("task_Person"),rs.getString("task_Deadline"), rs.getString("student_ID"));
//			Task task=new Task(rs.getString("task_Todo"));
			return task;
		});
		return results; // 객체 하나씩 반환
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	

	public boolean insert(Task task) {
		try {
		jdbcTemplate.update(
				"insert into task(task_Name, task_Pfname, task_Todo, task_Person,student_ID) "
						+ "values(?,?,?,?,?)",
						task.getTask_Name(),  task.getTask_Pfname(),task.getTask_Todo(), task.getTask_Person(), task.getStudent_ID());
		return true;

	}catch (EmptyResultDataAccessException e) {
		e.printStackTrace();
		return false;
	}
		
	}


	public List<Task> selectdetail(String n, int num) {
		try {
			//task_Name=? 로 세션 넘겨서 받기 나중에!
			List<Task> results = jdbcTemplate.query("select * from task where student_ID=? and num=?",new Object[]{n,num}, (ResultSet rs, int rowNum) -> {
				Task task = new Task(rs.getInt("num"),rs.getString("task_Name"), rs.getString("task_Pfname"), rs.getString("task_Todo"),rs.getString("task_Person"),rs.getString("task_Deadline"), rs.getString("student_ID"));
			
				return task;
		});
		return results; // 객체 하나씩 반환
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	public void update(Task task, int num) {
		jdbcTemplate.update("UPDATE task SET task_Name = ?, task_Pfname=?, task_Todo=?, task_Person=? WHERE num= ? ", task.getTask_Name(),  task.getTask_Pfname(),task.getTask_Todo(), task.getTask_Person(), num);
	}
	
}
