package com.project.classmanagement.course;

public class Lecture {
   String lec_Start;
   String lec_End;
   String lec_Location;
   String lec_Day;
   /*
    * lec_stm , lec_enm 은 db에 없음.
    */
   String lec_stm;
   String lec_enm;
   
   String sub_Name;
   String sub_Pfname;
   
   String sub_Code;
   
   public Lecture() {
      super();
   }
   public Lecture(String sub_Code , String lec_Start, String lec_End,String lec_Location, String lec_Day, String sub_Name, String sub_Pfname) {
      super();
      this.sub_Code = sub_Code;
      this.lec_Start = lec_Start;
      this.lec_End = lec_End;
      this.lec_Location = lec_Location;
      this.lec_Day = lec_Day;
      this.sub_Name = sub_Name;
      this.sub_Pfname = sub_Pfname;
   }
   public String getLec_End() {
      return lec_End;
   }
   public void setLec_End(String lec_End) {
      this.lec_End = lec_End;
   }
   public String getLec_Location() {
      return lec_Location;
   }
   public void setLec_Location(String lec_Location) {
      this.lec_Location = lec_Location;
   }
   public String getLec_Day() {
      return lec_Day;
   }
   public void setLec_Day(String lec_Day) {
      this.lec_Day = lec_Day;
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
   public String getLec_stm() {
      return lec_stm;
   }
   public void setLec_stm(String lec_stm) {
      this.lec_stm = lec_stm;
   }
   public String getLec_enm() {
      return lec_enm;
   }
   public void setLec_enm(String lec_enm) {
      this.lec_enm = lec_enm;
   }
   public String getLec_Start() {
      return lec_Start;
   }
   public void setLec_Start(String lec_Start) {
      this.lec_Start = lec_Start;
   }
   public String getSub_Code() {
      return sub_Code;
   }
   public void setSub_Code(String sub_Code) {
      this.sub_Code = sub_Code;
   }
   
   

}