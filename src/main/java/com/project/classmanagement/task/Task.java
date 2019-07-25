package com.project.classmanagement.task;


public class Task {
	public int num;
	public String task_Name;
	public String task_Pfname;
	public String task_Todo;
	public String task_Person;
	public String task_Deadline;
	public String student_ID;
	
	public Task() {
		
	}
	public Task(int num, String task_Name, String task_Pfname, String task_Todo, String task_Person, String task_Deadline, String student_ID) {
		this.num=num;
		this.task_Name=task_Name;
		this.task_Pfname=task_Pfname;
		this.task_Todo=task_Todo;
		this.task_Person=task_Person;
		this.task_Deadline=task_Deadline;
		this.student_ID=student_ID;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public Task(String task_Name, String task_Pfname, String task_Todo, String task_Person,  String student_ID) {
		this.task_Name=task_Name;
		this.task_Pfname=task_Pfname;
		this.task_Todo=task_Todo;
		this.task_Person=task_Person;
		this.student_ID=student_ID;
	}

	public Task(String task_Todo) {
		this.task_Name=task_Todo;
	}
	
	public String getTask_Name() {
		return task_Name;
	}

	public void setTask_Name(String task_Name) {
		this.task_Name = task_Name;
	}

	public String getTask_Pfname() {
		return task_Pfname;
	}

	public void setTask_Pfname(String task_Pfname) {
		this.task_Pfname = task_Pfname;
	}

	public String getTask_Todo() {
		return task_Todo;
	}

	public void setTask_Todo(String task_Todo) {
		this.task_Todo = task_Todo;
	}

	public String getTask_Person() {
		return task_Person;
	}

	public void setTask_Person(String task_Person) {
		this.task_Person = task_Person;
	}

	public String getTask_Deadline() {
		return task_Deadline;
	}

	public void setTask_Deadline(String task_Deadline) {
		this.task_Deadline = task_Deadline;
	}

	public String getStudent_ID() {
		return student_ID;
	}

	public void setStudent_ID(String student_ID) {
		this.student_ID = student_ID;
	}
}