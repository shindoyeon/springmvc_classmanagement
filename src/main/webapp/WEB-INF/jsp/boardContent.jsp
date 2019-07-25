<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">



<!-- jQuery -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>



<!-- Bootstrap CSS -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">



<title>board</title>



<script>

	$(document).on('click', '#btndelete', function(e){

		e.preventDefault();
		location.href="${pageContext.request.contextPath}/deleteboard/${num}";
		$("#form").submit();

	});

	

	$(document).on('click', '#btnList', function(e){

		e.preventDefault();
		
		location.href="${pageContext.request.contextPath}/board/getBoardList";

	});

</script>

<style>

body {

  padding-top: 70px;

  padding-bottom: 30px;

}



</style>

</head>

<body>

	<article>

		<div class="container" role="main">

			<h2>board Form</h2>

			<c:forEach var="member" items="${boardContentsList}" varStatus="status">
				<div class="mb-3">

					<label for="title">제목</label>

					<input type="text" class="form-control" name="project_Title" id="title" value="${member.project_Title}">

				</div>

				

				<div class="mb-3">

					<label for="reg_id">작성자</label>

					<input type="text" class="form-control" name="student_ID" id="reg_id" value="${member.student_ID}">

				</div>

				

				<div class="mb-3">

					<label for="content">내용</label>

					<textarea class="form-control" rows="5" name="project_Detail" id="content">${member.project_Detail}</textarea>

				</div>

	


			
			</c:forEach>
			<div >

				<button type="button" class="btn btn-sm btn-primary" id="btndelete">삭제</button>

				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>

			</div>
		</div>

	</article>

</body>

</html>

