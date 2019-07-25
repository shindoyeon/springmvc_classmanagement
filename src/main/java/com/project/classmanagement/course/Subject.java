package com.project.classmanagement.course;

public class Subject {
   public String sub_Name;
   public String sub_Pfname;
   public String sub_Code;

   public Subject() {
   }

   public Subject(String sub_Name, String sub_Pfname) {
      super();
      this.sub_Name = sub_Name;
      this.sub_Pfname = sub_Pfname;
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

   public String getSub_Code() {
      return sub_Code;
   }

   public void setSub_Code(String sub_Code) {
      this.sub_Code = sub_Code;
   }
}