package com.project.classmanagement.task;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.classmanagement.RegisterValidation;
import com.project.classmanagement.course.Course;
import com.project.classmanagement.student.Student;

@Controller
public class SubjectController {
   
   @Autowired
   private SubjectDao subjectDao;
   
   @Autowired
   private TaskDao taskDao;
   
   @Autowired
   private TeamDao teamDao;
   
   @RequestMapping(value = "/subject", method = { RequestMethod.GET })
   public String subject(Model model, HttpServletRequest request, @RequestParam(value = "isTeam", required = false) boolean isTeam) {
       HttpSession sess = request.getSession();
         Student student=(Student) sess.getAttribute("loginSuccess");
         String n=student.getStudent_ID();
         
       System.out.println(n);
      List<Course> subjectList=subjectDao.selectName(n);
      List<Task> taskList=taskDao.selectTasks(n);
      List<Team> teamName=teamDao.select_TeamName(n);
      model.addAttribute("subjectList", subjectList);
      model.addAttribute("taskList", taskList);
      model.addAttribute("teamName", teamName);
       model.addAttribute("isTeam", isTeam);
      return "subject"; // Hello.jsp, jsp파일명 , View는 Hello.jsp
   }
   
   @RequestMapping(value = "/subject/{num}", method = { RequestMethod.GET})
   public String detail(@PathVariable("num") int num, Model model, Task task, HttpServletRequest request) throws Exception {
      HttpSession sess = request.getSession();
        Student student=(Student) sess.getAttribute("loginSuccess");
        String n=student.getStudent_ID();
        List<Task> taskList=taskDao.selectTasks(n);
      model.addAttribute("taskList", taskList);
        List<Task> detailtask=taskDao.selectdetail(n,num);
        model.addAttribute("detailtask",detailtask);
        return "detail";
   }
   

   
   @RequestMapping(value = "/addTeamPerson/{str}", method = { RequestMethod.GET, RequestMethod.POST})
   public String addTeamPerson(@PathVariable("str") String str, Model model, Team team,
         @RequestParam(value = "student_ID", required = false) String student_ID) throws Exception {
      
        team=new Team(str,student_ID);
      teamDao.insertPerson(team);
      return "boardList";
   }
   

   
   @RequestMapping(value = "/taskCheck", method = { RequestMethod.GET, RequestMethod.POST })
   public String taskCheck(Model model,
         HttpServletRequest request,
         // ModelAttribute 애노테이션으로 객체 등록
         @ModelAttribute("task") @Valid Task task,
         @RequestParam(value = "task_Pfname", required = false) String task_Pfname,
         @RequestParam(value = "task_Todo", required = false) String task_Todo,
         @RequestParam(value = "task_Person", required = false) String task_Person,
         @RequestParam(value = "task_Name", required = false) String task_Name) {

      HttpSession sess = request.getSession();
        Student student=(Student) sess.getAttribute("loginSuccess");
        String student_ID=student.getStudent_ID();
      // 생성자 파라미터를 통해 값을 넘겨줌
        task.task_Name=task_Name;
        task.task_Pfname=task_Pfname;
        task.task_Todo=task_Todo;
        task.task_Person=task_Person;
      task = new Task(task_Name, task_Pfname, task_Todo, task_Person,student_ID);

      // 해당정보를 db에 insert 해줌
      taskDao.insert(task);
      return "redirect:/subject";
   }
   
   @RequestMapping(value = "/insertTeamCheck", method = { RequestMethod.GET, RequestMethod.POST })
   public String insertTeamCheck(Model model,
         HttpServletRequest request,
         // ModelAttribute 애노테이션으로 객체 등록
         @ModelAttribute("team") @Valid Team team, 
         @RequestParam(value = "team_Name", required = false) String team_Name) {
      // 중복 Check
      if(teamDao.dupleCheck(team_Name)==0) {
         System.out.println("팀 등록 성공");
         HttpSession sess = request.getSession();
           Student student=(Student) sess.getAttribute("loginSuccess");
           String student_ID=student.getStudent_ID();
           team=new Team(team_Name, student_ID);
           teamDao.insert(team);
      }
      else {
         System.out.println("다른 아이디를 입력해주세요");
      }

      return "redirect:/subject";
   }
   
   
   @RequestMapping(value = "/BoardContents/{num}", method = { RequestMethod.GET, RequestMethod.POST })
   public String boardContent(@PathVariable("num") int num, Model model, TeamProject teamproject, HttpServletRequest request)
   {
      List<TeamProject> boardContentsList=teamDao.showboardContents(num);
      model.addAttribute("num",num);
        model.addAttribute("boardContentsList",boardContentsList);
      return "boardContent";
   }
   
   @RequestMapping(value = "/boardList/{str}", method = { RequestMethod.GET, RequestMethod.POST })
   public String boardList(Model model)
   {
      return "boardList";
   }
   
   @RequestMapping(value = "/deleteboard/{num}", method = { RequestMethod.GET, RequestMethod.POST })
   public String deleteboard(Model model, @PathVariable("num") int num, TeamProject teamproject,
		   RedirectAttributes redirectAttributes)
   {
      TeamProject team=teamDao.select(num);
      String tmp = team.getTeam_Name();
      redirectAttributes.addAttribute("tmp",tmp);
      System.out.println("=============");
      System.out.println(num);
      System.out.println(team);
      teamDao.delete(teamproject, num);
      System.out.println("delete 할 것..");
      return "redirect:/team/tmp";
   }
   @RequestMapping(value = "/team/{str}", method = { RequestMethod.GET})
   public String detail(@PathVariable("str") String str, Model model, TeamProject teamproject, HttpServletRequest request) throws Exception {
      HttpSession sess = request.getSession();
        Student student=(Student) sess.getAttribute("loginSuccess");
        String n=student.getStudent_ID();
      List<TeamProject> projectList=teamDao.select_teamProjects(str);
      List<Team> names=teamDao.selectNames(str);
      model.addAttribute("names",names);
      model.addAttribute("str",str);
        model.addAttribute("projectList",projectList);
        return "boardList";
   }

   @RequestMapping(value = "/boardForm/{str}", method = { RequestMethod.GET, RequestMethod.POST })
   public String boardForm(Model model,@PathVariable("str") String str)
   {
      model.addAttribute("str",str);
      return "boardForm";
   }
   @RequestMapping(value = "/boardContent", method = { RequestMethod.GET, RequestMethod.POST })
   public String boardContent(Model model)
   {
	   
      return "boardContent";
   }
   
   @RequestMapping(value = "/saveBoard/{s}", method = { RequestMethod.GET, RequestMethod.POST })
   public String saveBoard(Model model,@PathVariable("s") String s,
         HttpServletRequest request,@ModelAttribute("teamproject") @Valid TeamProject teamproject,
         @RequestParam(value = "project_Title", required = false) String project_Title,
         @RequestParam(value = "project_Detail", required = false) String project_Detail) {

      HttpSession sess = request.getSession();
        Student student=(Student) sess.getAttribute("loginSuccess");
        String student_ID=student.getStudent_ID();
      // 생성자 파라미터를 통해 값을 넘겨줌
        teamproject.project_Title=project_Title;
        teamproject.project_Detail=project_Detail;
        teamproject = new TeamProject(project_Title, student_ID, s, project_Detail);
        System.out.println("project ==> ");
        System.out.println(teamproject);
      // 해당정보를 db에 insert 해줌
      teamDao.insert_Projects(teamproject);
      return "redirect:/subject";
   }
//   project_Num int auto_increment,
//   project_Title varchar(45),
//   student_ID varchar(45),
//   team_Name varchar(45),
//   project_detail varchar(45),
}