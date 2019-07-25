package com.project.classmanagement.student;

public class Student {
	
	public String student_Num;
	public String student_Name;
	public String student_HP;
	public String student_Email;
	public String student_Grade;
	public String student_Major;
	public String student_PW;
	public String student_ID;
	public String student_PWCheck;
	
	public Student(String student_Name,  String student_Email, String student_PW, String student_ID) {
		super();
		this.student_Name = student_Name;
		this.student_Email = student_Email;
		this.student_PW = student_PW;
		this.student_ID = student_ID;
	}
	
	public Student() {
		
	}
	public Student(String student_Num, String student_Name, String student_HP, String student_Email, String student_Grade,
			String student_Major, String student_PW, String student_ID) {
		super();
		this.student_Num = student_Num;
		this.student_Name = student_Name;
		this.student_HP = student_HP;
		this.student_Email = student_Email;
		this.student_Grade = student_Grade;
		this.student_Major = student_Major;
		this.student_PW = student_PW;
		this.student_ID = student_ID;
	}
	public String getStudent_Num() {
		return student_Num;
	}
	public void setStudent_Num(String student_Num) {
		this.student_Num = student_Num;
	}
	public String getStudent_Name() {
		return student_Name;
	}
	public void setStudent_Name(String student_Name) {
		this.student_Name = student_Name;
	}
	public String getStudent_HP() {
		return student_HP;
	}
	public void setStudent_HP(String student_HP) {
		this.student_HP = student_HP;
	}
	public String getStudent_Email() {
		return student_Email;
	}
	public void setStudent_Email(String student_Email) {
		this.student_Email = student_Email;
	}
	public String getStudent_Grade() {
		return student_Grade;
	}
	public void setStudent_Grade(String student_Grade) {
		this.student_Grade = student_Grade;
	}
	public String getStudent_Major() {
		return student_Major;
	}
	public void setStudent_Major(String student_Major) {
		this.student_Major = student_Major;
	}
	public String getStudent_PW() {
		return student_PW;
	}
	public void setStudent_PW(String student_PW) {
		this.student_PW = student_PW;
	}
	public String getStudent_ID() {
		return student_ID;
	}
	public void setStudent_ID(String student_ID) {
		this.student_ID = student_ID;
	}
	public String getStudent_PWCheck() {
		return student_PWCheck;
	}
	public void setStudent_PWCheck(String student_PWCheck) {
		this.student_PWCheck = student_PWCheck;
	}
	
}
