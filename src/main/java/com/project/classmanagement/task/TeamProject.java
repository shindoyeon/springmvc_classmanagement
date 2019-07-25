package com.project.classmanagement.task;


public class TeamProject {
	public int project_Num;
	public String student_ID;
	public String team_Name;
	public String project_Detail;
	public String project_Title;
	
	public int getProject_Num() {
		return project_Num;
	}

	public void setProject_Num(int project_Num) {
		this.project_Num = project_Num;
	}

	
	public String getProject_Title() {
		return project_Title;
	}

	public void setProject_Title(String project_Title) {
		this.project_Title = project_Title;
	}

	public TeamProject() {
	}
	
	public TeamProject(String team_Name) {
		this.team_Name=team_Name;
	}
	public TeamProject(int project_Num, String project_Title, String student_ID, String team_Name, String project_Detail) {
		this.project_Num=project_Num;
		this.student_ID=student_ID;
		this.team_Name=team_Name;
		this.project_Detail=project_Detail;
		this.project_Title=project_Title;
	}
	public TeamProject( String project_Title, String student_ID, String team_Name, String project_Detail) {
		this.student_ID=student_ID;
		this.team_Name=team_Name;
		this.project_Detail=project_Detail;
		this.project_Title=project_Title;
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
	public String getProject_Detail() {
		return project_Detail;
	}
	public void setProject_Detail(String project_Detail) {
		this.project_Detail = project_Detail;
	}

}
