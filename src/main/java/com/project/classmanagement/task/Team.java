package com.project.classmanagement.task;

//student_ID varchar(45),
//team_Name varchar(45),

public class Team {
	public String student_ID;
	public String team_Name;
	
	public Team() {
		
	}
	public Team(String team_Name,String student_ID) {
		this.student_ID=student_ID;
		this.team_Name=team_Name;
	}
	public Team(String team_Name) {
		this.team_Name=team_Name;
	}
	public String getStudent_ID() {
		return student_ID;
	}
	public void setStudent_ID(String student_ID) {
		this.student_ID = student_ID;
	}
	public String getTeam_Name() {
		return team_Name;
	}
	public void setTeam_Name(String team_Name) {
		this.team_Name = team_Name;
	}
	
	

}
