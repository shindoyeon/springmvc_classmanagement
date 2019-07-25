package com.project.classmanagement.student;

import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.project.classmanagement.student.Student;

@Controller
public class StudentController {
	@Autowired
	private StudentDao studentDao;
	@Autowired
	private StudentService studentservice;

	// 로그인,비밀번호,아이디찾기, 홈 , 인덱스
	//인덱스
	@RequestMapping(value = "/")
	public String index(HttpServletRequest request) {
		/*
		 * index page 코드 홈페이지의 첫 화면은 login 페이지로 이동함. 만약 , 세션이 있다면 /home 으로 전송.
		 */
		return "redirect:/home";
	}
	//classmanagement home 
	@RequestMapping(value = "/home", method = { RequestMethod.GET, RequestMethod.POST })
	public String home(Model model, HttpServletRequest request) {
		/*
		 * home page 코드 주요 기능을 가지고 있는 page
		 */
		return "home";
	}

	//login, logout
	// login , logout
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, 
			@RequestParam(value = "isLogin", required = false) boolean isLogin,
			HttpServletRequest request) {
		if (request.getSession().getAttribute("loginSuccess") != null)
			return "redirect:/home";
		model.addAttribute("isLogin", isLogin);
		return "login";
	}
	//입력한 아이디와 비밀번호를 가지고 회원이 맞는지 확인
	@RequestMapping(value = "/logincheck", method = { RequestMethod.GET, RequestMethod.POST })
	public String logincheck(Model model, 
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "password", required = false) String password, 
			
			RedirectAttributes redirectAttributes,
			HttpServletRequest request) {
		List<Student> studentList = studentDao.selectAll();
		HttpSession sess = request.getSession();
		for (Student student : studentList) {
			if (id.equals(student.getStudent_ID()) && password.equals(student.getStudent_PW())) {
				sess.setAttribute("loginSuccess", student);
				return "redirect:/home";
			}
		}
		redirectAttributes.addAttribute("isLogin", true);
		return "redirect:/login";
	}
	//로그아웃
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
		/*
		 * logout 코드 loginSuccess session를 삭제한 login page로 redirect.
		 */
		request.getSession().removeAttribute("loginSuccess");
		return "redirect:/login";
	}

	
	// 아이디찾기 
	@RequestMapping(value = "/find_id", method = { RequestMethod.GET, RequestMethod.POST })
	public String find_id_form(Model model, @RequestParam(value = "email", required = false) String email,
			HttpServletResponse response) throws Exception {
		if (studentservice.find_id(email) == null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return "find_id_form";
		}
		model.addAttribute("id", studentservice.find_id(email).getStudent_ID());

		return "find_id";
	}
	//아이디 찾기 form
	@RequestMapping(value = "/find_id_form")
	public String find_id_form() throws Exception {
		return "find_id_form";
	}
	//비밀번호 찾기 form 
	@RequestMapping(value = "/find_pw_form")
	public String find_pw_form() throws Exception {
		return "find_pw_form";
	}
	//비밀번호 찾기
	@RequestMapping(value = "/find_pw", method = { RequestMethod.GET, RequestMethod.POST })
	public void find_pw(Model model, @RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "email", required = false) String email, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 아이디가 없으면
		System.out.println(id + " " + email);
		if (studentservice.check_id(id) == 0) {

			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		// 가입에 사용한 이메일이 아니면
		else if (!email.equals(studentservice.login(id).getStudent_Email())) {
			out.println("<script>");
			out.println("alert('잘못된 이메일 입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		} else {
			System.out.println("비밀번호 발송");
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			// 비밀번호 변경
			studentservice.update_pw(pw, email, id);
			// 비밀번호 변경 메일 발송
			studentservice.send_mail(id, email, pw, "find_pw");
			out.println("<script>");
			out.println("alert('이메일로 임시 비밀번호를 발송하였습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
	}

}