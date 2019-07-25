package com.project.classmanagement.course;

public class Course {
   String student_ID;
   String sub_Name;
   String sub_Pfname;
   String course_Name;
   String sub_Code;

   public Course() {
      super();
   }

   public Course(String student_ID, String sub_Name, String sub_Pfname, String course_Name) {
      super();
      this.student_ID = student_ID;
      this.sub_Name = sub_Name;
      this.sub_Pfname = sub_Pfname;
      this.course_Name = course_Name;
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

   public String getSub_Pfname() {
      return sub_Pfname;
   }

   public void setSub_Pfname(String sub_Pfname) {
      this.sub_Pfname = sub_Pfname;
   }

   public String getCourse_Name() {
      return course_Name;
   }

   public void setCourse_Name(String course_Name) {
      this.course_Name = course_Name;
   }

   public String getSub_Code() {
      return sub_Code;
   }

   public void setSub_Code(String sub_Code) {
      this.sub_Code = sub_Code;
   }

}