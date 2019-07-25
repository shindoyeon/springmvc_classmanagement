package com.project.classmanagement.schedule;

public class Schedule {
	String schedule_Name;
	String schedule_Start;
	String schedule_End;
	String student_ID;
	String sub_Name;

	String schedule_Type;

	public Schedule() {
		super();
	}

	public Schedule(String schedule_Name, String schedule_Start, String schedule_End,
			String student_ID, String sub_Name,String schedule_Type) {
		super();
		this.schedule_Name = schedule_Name;
		this.schedule_Start = schedule_Start;
		this.schedule_End = schedule_End;
		this.student_ID = student_ID;
		this.sub_Name = sub_Name;
		this.schedule_Type = schedule_Type;

	}

	public String getSchedule_Name() {
		return schedule_Name;
	}

	public void setSchedule_Name(String schedule_Name) {
		this.schedule_Name = schedule_Name;
	}

	public String getSchedule_Start() {
		return schedule_Start;
	}

	public void setSchedule_Start(String schedule_Start) {
		this.schedule_Start = schedule_Start;
	}

	public String getSchedule_End() {
		return schedule_End;
	}

	public void setSchedule_End(String schedule_End) {
		this.schedule_End = schedule_End;
	}

	public String getStudent_ID() {
		return student_ID;
	}

	public void setStudent_ID(String student_ID) {
		this.student_ID = student_ID;
	}

	public String getSub_Name() {
		return sub_Name;
	}

	public void setSub_Name(String sub_Name) {
		this.sub_Name = sub_Name;
	}

	public String getSchedule_Type() {
		return schedule_Type;
	}

	public void setSchedule_Type(String schedule_Type) {
		this.schedule_Type = schedule_Type;
	}

	@Override
	public String toString() {
		return "Schedule [schedule_Name=" + schedule_Name + ", schedule_Start=" + schedule_Start + ", schedule_End="
				+ schedule_End + ", student_ID=" + student_ID + ", sub_Name=" + sub_Name + ", schedule_Type="
				+ schedule_Type + "]";
	}

}