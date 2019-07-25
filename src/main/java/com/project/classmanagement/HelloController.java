package com.project.classmanagement;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.classmanagement.student.Student;
import com.project.classmanagement.student.StudentDao;

@Controller
public class HelloController {

	@Autowired
	private StudentDao studentDao;

	// 입력중이던 정보를 날리지 않고 다시 로드해줌
	@RequestMapping(value = "/register", method = { RequestMethod.GET, RequestMethod.POST })
	public String join(Model model, @ModelAttribute Student student) {
		return "register";
	}

	@RequestMapping(value = "/registerCheck", method = { RequestMethod.GET, RequestMethod.POST })
	public String Register(Model model,

			// ModelAttribute 애노테이션으로 객체 등록
			@ModelAttribute("student") @Valid Student student, Errors errors, BindingResult bindingResult,

			// 폼에서 입력받은 파라미터 값 불러옴
			@RequestParam(value = "student_Name", required = false) String student_Name,
			@RequestParam(value = "student_Email", required = false) String student_Email,
			@RequestParam(value = "student_PW", required = false) String student_PW,
			@RequestParam(value = "student_ID", required = false) String student_ID) {

		// 중복 Check
		if ((studentDao.selectOne(student_ID)) == null) {
			System.out.println("중복 X 아이디 등록 성공");
		} else {
			System.out.println("중복된 아이디.");
			// error를 bindingResult에 추가하는 방식
			FieldError fielderror = new FieldError("student", "student_ID", "Used ID");
			bindingResult.addError(fielderror);
		}

		// bindingResult를 통해 RegisterValidation.class에서 에러가 발생하는지 알려줌
		if (bindingResult.hasErrors()) {
			System.out.println(studentDao.selectOne(student_ID));
			return "register";
		}

		// 생성자 파라미터를 통해 값을 넘겨줌
		student = new Student(student_Name, student_Email, 
				student_PW, student_ID);

		// 해당정보를 db에 insert 해줌
		studentDao.insert(student);
		return "login";
	}

	// RegisterValidation을 Binder를 통해 Validator로 설정.
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(new RegisterValidation());
	}

}
