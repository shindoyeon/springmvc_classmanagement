package com.project.classmanagement.schedule;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;

import java.util.List;
import java.util.Locale;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.project.classmanagement.course.Course;
import com.project.classmanagement.course.CourseDao;
import com.project.classmanagement.schedule.Schedule;
import com.project.classmanagement.student.Student;

@Controller
public class ScheduleController {
	@Autowired
	private ScheduleDao scheduleDao;
	@Autowired
	private CourseDao courseDao;


	// schedule 관련 부분
	//스케줄 탭, 다가오는 schedule 조회
	@RequestMapping(value = "/schedule")
	public String schedule(Model model, HttpServletRequest request) throws Exception {
		String id = ((Student) request.getSession().getAttribute("loginSuccess")).getStudent_ID();

		HashMap<Integer, Schedule> result = scheduleDao.examschedule(id);

		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
		Date currentTime = new Date();
		int mTime = Integer.parseInt(mSimpleDateFormat.format(currentTime));
		
		TreeMap<Integer,Schedule> tm =new TreeMap<Integer,Schedule>(result);
		//Set<Integer> keyset =result.keySet();
		Iterator<Integer> keyiterator = tm.keySet().iterator(); // 키값 오름차순 정렬(기본)

		List<Schedule> OffDayEvent = new ArrayList<Schedule>();
		List<Schedule> ExamEvent = new ArrayList<Schedule>();
		List<Schedule> TaskEvent = new ArrayList<Schedule>();
 
		while (keyiterator.hasNext()) {
			Integer key = keyiterator.next();
			if (key > mTime) {
				if (tm.get(key).getSchedule_Type().equals("시험")) {
					ExamEvent.add(tm.get(key));
				} else if (result.get(key).getSchedule_Type().equals("과제")) {
					TaskEvent.add(tm.get(key));
				} else if (result.get(key).getSchedule_Type().equals("휴강")) {
					OffDayEvent.add(tm.get(key));
				}
			}
		}
		model.addAttribute("ExamEvent", ExamEvent);
		model.addAttribute("TaskEvent", TaskEvent);
		model.addAttribute("OffDayEvent", OffDayEvent);
		return "schedule";
	}
	
	//schedule 등록
	@RequestMapping(value = "/in_schedule", method = { RequestMethod.GET, RequestMethod.POST })
	public String in_schedule(Model model,
			@RequestParam(value = "schedule_Name", required = false) String schedule_Name,
			@RequestParam(value = "schedule_start", required = false) String schedule_start,
			@RequestParam(value = "schedule_end", required = false) String schedule_end,
			@RequestParam(value = "sub_name", required = false) String subname,
			@RequestParam(value = "schedule_Type", required = false) String type, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String id = ((Student) request.getSession().getAttribute("loginSuccess")).getStudent_ID();
		Schedule schedule = new Schedule(schedule_Name, schedule_start, schedule_end, id, subname, type);
		int result = scheduleDao.check_schedule(schedule, id);
		if (result == 0)
			scheduleDao.insert_schedule(schedule, id);
		else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('같은 날짜에 해당 일정이 등록되어있습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}

		return "redirect:/calendar";
	}
	
	//schedule 삭제
	@RequestMapping(value = "/del_schedule", method = { RequestMethod.GET, RequestMethod.POST })
	public String del_schedule(Model model,
			@RequestParam(value = "schedule_Name", required = false) String schedule_Name,
			@RequestParam(value = "schedule_start", required = false) String schedule_start,
			@RequestParam(value = "schedule_end", required = false) String schedule_end,
			@RequestParam(value = "sub_name", required = false) String subname,
			@RequestParam(value = "schedule_Type", required = false) String type, HttpServletRequest request) {
		String id = ((Student) request.getSession().getAttribute("loginSuccess")).getStudent_ID();
		Schedule schedule = new Schedule(schedule_Name, schedule_start, schedule_end, id, subname, type);

		if (schedule_end == "null" || schedule_end == null || schedule_end.length() < 5) {
			schedule.setSchedule_End(schedule_start);
		}
		System.out.println(schedule.toString());

		scheduleDao.delete_schedule(schedule, id);

		return "redirect:/calendar";
	}
	
	//calendar 조회
	@RequestMapping(value = "/calendar")
	public String calendar(Model model, HttpServletRequest request) throws Exception {
		Student student = (Student) request.getSession().getAttribute("loginSuccess");
		List<Schedule> schedule = scheduleDao.searchSchedule_ID(student.getStudent_ID());
		List<Course> course = courseDao.courseAll(student.getStudent_ID());
		model.addAttribute("schedule", schedule);
		model.addAttribute("course", course);

		return "calendar";
	}
}