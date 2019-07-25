package com.project.classmanagement.course;

import java.io.PrintWriter;
import java.util.ArrayList;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.project.classmanagement.course.Course;
import com.project.classmanagement.course.Lecture;
import com.project.classmanagement.student.Student;

@Controller
public class CourseController {
	@Autowired
	private CourseDao courseDao;
	
	
	// class 관련 부분
	// class 탭, class 조회
	@RequestMapping(value = "/class", method = { RequestMethod.GET, RequestMethod.POST })
	public String classSet(Model model, HttpServletRequest request,
			@RequestParam(value = "timetable", required = false) List<Lecture> alreadyTable) {
		String id = ((Student) request.getSession().getAttribute("loginSuccess")).getStudent_ID();
		List<Course> course = courseDao.courseAll(id);
		List<Lecture> lecture = courseDao.lectureAll();
		model.addAttribute("lecture", lecture);
		if (course != null) {
			model.addAttribute("course", course);
			List<Lecture> timetable = new ArrayList<Lecture>();
			for (Course cs : course) {
				try {
					List<Lecture> tmp = courseDao.lectureSelected(cs.getSub_Name(), cs.getSub_Pfname(), id);
					for (Lecture lct : tmp) {
						timetable.add(lct);
					}
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println("error");
				}
			}
			if (request.getSession().getAttribute("timetable") != null)
				request.getSession().removeAttribute("timetable");
			request.getSession().setAttribute("timetable", timetable);
			model.addAttribute("timetable", timetable);
			return "class";
		}
		return "class";
	}

	// course 등록
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/registclass", method = { RequestMethod.GET, RequestMethod.POST })
	public String registclass(Model model, @ModelAttribute("lecture") Lecture lecture,
			@RequestParam(value = "sub_Name", required = false) String sub_Name,
			@RequestParam(value = "sub_Pfname", required = false) String sub_Pfname,
			@RequestParam(value = "lec_Start", required = false) String lec_Start,
			@RequestParam(value = "lec_stm", required = false) String lec_stm,
			@RequestParam(value = "lec_End", required = false) String lec_End,
			@RequestParam(value = "lec_enm", required = false) String lec_enm,
			@RequestParam(value = "lec_Day", required = false) String lec_Day, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List<Lecture> timetable = null;
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		timetable = (List<Lecture>) request.getSession().getAttribute("timetable");
		for (Lecture lct : timetable) {
			String Day = lct.getLec_Day();
			if (Day.equals(lec_Day)) {
				int inputStart = (Integer.parseInt(lec_Start) * 100) + (Integer.parseInt(lec_stm));
				int inputEnd = (Integer.parseInt(lec_End) * 100) + (Integer.parseInt(lec_enm));
				int tableStart = (Integer.parseInt(lct.getLec_Start().substring(0, 2)) * 100)
						+ (Integer.parseInt(lct.getLec_Start().substring(3)));
				int tableEnd = (Integer.parseInt(lct.getLec_End().substring(0, 2)) * 100)
						+ (Integer.parseInt(lct.getLec_End().substring(3)));
				if ((inputStart < tableEnd && inputEnd > tableEnd) || (inputEnd > tableStart && inputStart < tableStart)
						|| (inputStart >= tableStart && inputEnd <= tableEnd)) { // 범위안
					out.println("<script>");
					out.println("alert('등록 불가능합니다.');");
					out.println("history.go(-1);");
					out.println("</script>");
					out.close();
					return "redirect:/class";
				} else
					break;
			}
		}

		String id = ((Student) request.getSession().getAttribute("loginSuccess")).getStudent_ID();
		response.setContentType("text/html;charset=utf-8");
		lecture.lec_Start = lec_Start + ":" + lec_stm;
		lecture.lec_End = lec_End + ":" + lec_enm;
		courseDao.insert_subject(lecture, id);
		courseDao.insert_lecture(lecture, id);
		courseDao.insert_course(lecture, id);
		return "redirect:/class";
	}

	// 강의 삭제
	@RequestMapping(value = "/delclass", method = { RequestMethod.GET, RequestMethod.POST })
	public String delclass(Model model, @RequestParam(value = "start", required = false) String lec_Start,
			@RequestParam(value = "end", required = false) String lec_End,
			@RequestParam(value = "day", required = false) String lec_Day,
			@RequestParam(value = "name", required = false) String sub_Name,
			@RequestParam(value = "pfname", required = false) String sub_Pfname, HttpServletRequest request) {
		String id = ((Student) request.getSession().getAttribute("loginSuccess")).getStudent_ID();
		Lecture lecture = new Lecture(id, lec_Start, lec_End, "", lec_Day, sub_Name, sub_Pfname);

		courseDao.delete_class(lecture, id);

		return "redirect:/class";
	}

}
