package com.project.classmanagement;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.project.classmanagement.student.Student;

public class RegisterValidation implements Validator {

	@Override
	public boolean supports(Class<?> arg0) {
		return Student.class.isAssignableFrom(arg0);
	}

	// Validation을 위한 validate함수
	@Override
	public void validate(Object obj, Errors errors) {
		Student student = (Student) obj;

		// null값 또는 공백 값이 있을 경우 error로 판단하는 메소드
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "student_Name", "required", "필수입력 사항입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "student_Email", "required", "필수입력 사항입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "student_PW", "required", "필수입력 사항입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "student_ID", "required", "필수입력 사항입니다.");

		String mPW = student.getStudent_PW();
		String mPWCheck = student.getStudent_PWCheck();

		// password 일치여부
		if (!mPW.equals(mPWCheck)) {
			errors.rejectValue("student_PWCheck", "", "password match X");
		}

		// 이름 길이 조건 설정
		String mName = student.getStudent_Name();
		if (mName.length() < 2) {
			errors.rejectValue("student_Name", "", "over 2");
		}

		// 정규식 이용해 조건 설정
		String mNum = student.getStudent_ID();
		if (!(mNum.matches("^[0-9]*$"))) {
			errors.rejectValue("student_ID", "", "only number please");

		}

		// 이메일 형식에 맞게 조건 설정
		String mEmail = student.getStudent_Email();
		if (!(mEmail.contains("@"))) {
			errors.rejectValue("student_Email", "", "email X");
		}

		

	}

}
