<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/style.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
	<!-- jQuery -->

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
			integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
			crossorigin="anonymous"></script>

	<!-- Bootstrap CSS -->

	<link rel="stylesheet"
		  href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
		  integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
		  crossorigin="anonymous">

<title>아이디 찾기</title>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>아이디 찾기 검색결과</h3><br>
			</div>
			<div>
			<label>찾으시는 아이디는 ${ id } 입니다. <br>다시 로그인해주세요.</label>
				<br>
				<p class="w3-center">
					<button type="button" id=loginBtn class="btn btn-primary btn-lg btn-block pb_btn-pill  btn-shadow-blue" onclick="location.href='login'">Login</a></button>
					<button type="button" onclick="history.go(-1);" class="btn btn-primary btn-lg btn-block pb_btn-pill  btn-shadow-blue">Cancel</button>
				</p>
			</div>
		</div>
	</div>
</body>
</html>