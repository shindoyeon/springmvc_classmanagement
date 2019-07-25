package com.project.classmanagement.student;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import org.apache.commons.mail.HtmlEmail;

public class StudentService {
	private JdbcTemplate jdbcTemplate;
	
	// JdbcTemplate 객체 생성
	public StudentService(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	
	//아이디찾기
	public Student find_id(String name) {
		try {
			Student result = jdbcTemplate.queryForObject("select student_ID from student where student_Email=?",
					new Object[] { name }, new RowMapper<Student>() {
						public Student mapRow(ResultSet rs, int rowNum) throws SQLException {
							Student actor = new Student();
							actor.setStudent_ID(rs.getString("student_ID"));
							return actor;
						}
					});
			return result;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
    //비밀번호찾기-이메일전송(임시비밀번호)
	public void send_mail(String id, String email, String pw, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "qjatn7312@naver.com";
		String hostSMTPpwd = "wmf75395123!";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "qjatn7312@naver.com";
		String fromName = "Spring Homepage";
		String subject = "";
		String msg = "";

		if (div.equals("find_pw")) {
			subject = "Spring Homepage 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += id + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += pw + "</p></div>";
		}
		// 받는 사람 E-Mail 주소
		String mail = email;
		try {
			HtmlEmail hemail = new HtmlEmail();
			hemail.setDebug(true);
			hemail.setCharset(charSet);
			hemail.setSSL(true);
			hemail.setHostName(hostSMTP);
			hemail.setSmtpPort(587);

			hemail.setAuthentication(hostSMTPid, hostSMTPpwd);
			hemail.setTLS(true);
			hemail.addTo(mail, charSet);
			hemail.setFrom(fromEmail, fromName, charSet);
			hemail.setSubject(subject);
			hemail.setHtmlMsg(msg);
			hemail.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	 //임시비밀번호전송
	public void update_pw(String password, String email, String id) {
		jdbcTemplate.update("UPDATE STUDENT SET student_PW = ? WHERE student_Email = ? and student_ID=?", password,
				email, id);
	}
	//아이디 조회
	public int check_id(String name) {

		Integer result = jdbcTemplate.queryForObject("select count(*) from student where student_ID=?",
				new Object[] { name }, Integer.class);
		return result;
	}
	//로그인
	public Student login(String name) {
		try {
			Student result = jdbcTemplate.queryForObject("select * from student where student_ID=?",
					new Object[] { name }, new RowMapper<Student>() {
						public Student mapRow(ResultSet rs, int rowNum) throws SQLException {
							Student actor = new Student();
							actor.setStudent_ID(rs.getString("student_ID"));
							actor.setStudent_Email(rs.getString("student_Email"));
							return actor;
						}
					});
			return result;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

}