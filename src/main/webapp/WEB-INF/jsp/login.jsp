<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>classmanagement 로그인</title>

<link
	href="https://fonts.googleapis.com/css?family=Crimson+Text:400,400i,600|Montserrat:200,300,400"
	rel="stylesheet">

	<!-- jQuery -->

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
			integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
			crossorigin="anonymous"></script>

	<!-- Bootstrap CSS -->

	<link rel="stylesheet"
		  href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
		  integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
		  crossorigin="anonymous">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/fonts/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/fonts/law-icons/font/flaticon.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/fonts/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/style.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<style>
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 30%; /* Could be more or less, depending on screen size */
}
</style>

<body data-spy="scroll" data-target="#pb-navbar" data-offset="200">

	<nav
		class="navbar navbar-expand-lg navbar-dark pb_navbar pb_scrolled-light"
		id="pb-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.html">수업관리</a>
			<button class="navbar-toggler ml-auto" type="button"
				data-toggle="collapse" data-target="#probootstrap-navbar"
				aria-controls="probootstrap-navbar" aria-expanded="false"
				aria-label="Toggle navigation">
				<span><i class="ion-navicon"></i></span>
			</button>

		</div>
	</nav>
	<!-- END nav -->

	<section
		class="pb_cover_v3 overflow-hidden cover-bg-indigo cover-bg-opacity text-left pb_gradient_v1 pb_slant-light"
		id="section-home">
		<div class="container">
			<div class="row align-items-center justify-content-center">
				<div class="col-md-6">
					<h2 class="heading mb-3">Class Management</h2>
					<div class="sub-heading">
						<p class="mb-4">로그인이 필요합니다.</p>

					</div>
				</div>
				<div class="col-md-5 relative align-self-center">
					<form accept-charset="UTF-8" role="form" method="post"
						action="${pageContext.request.contextPath}/logincheck"
						class="bg-white rounded pb_form_v1">
						<h2 class="mb-4 mt-0 text-center">Login</h2>
						<div class="form-group">
							<input type="text" name="id"
								class="form-control pb_height-50 reverse" placeholder="ID">
						</div>
						<div class="form-group">
							<input type="password" name="password"
								class="form-control pb_height-50 reverse" placeholder="Password">
						</div>
						<div class="form-group">
							<input type="submit"
								class="btn btn-primary btn-lg btn-block pb_btn-pill  btn-shadow-blue"
								value="Login">
						</div>

						<font color="black">아이디를 잊으셨나요?</font> <a href="find_id_form"><font
							color="black">아이디 찾기</font> </a></font><br> 
							<font color="black">비밀번호를
							잊으셨나요?</font> <a href="find_pw_form"><font color="black">비밀번호
								찾기</font></a><br><br> 
								회원이 아니신가요?

						<div class="form-group">
							<input type="button"
								class="btn btn-primary btn-lg btn-block pb_btn-pill  btn-shadow-blue"
								value="Sign up" onclick="location.href='register'">
						</div>

					</form>
				</div>
			</div>
		</div>
	</section>
	<c:choose>
		<c:when test="${isLogin}">
			<div id="myModal" class="modal">
				<!-- Modal content -->
				<div class="modal-content">
					<p style="text-align: center;">
						<span style="font-size: 14pt;"><b><span
								style="font-size: 14pt; color: red;">로그인 실패</span></b></span>
					</p>
					<p style="text-align: center; line-height: 1.5;">
						<br />아이디와 비밀번호를 확인해주세요.
					</p>
					<p>
						<br />
					</p>
					<div
						style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
						onClick="close_pop();">
						<span class="pop_bt" style="font-size: 13pt;"> 닫기 </span>
					</div>
				</div>
			</div>

			<script type="text/javascript">
				var isLogin = '${isLogin}';
				if (isLogin == 'true') {
					$('#myModal').show();
					function close_pop(flag) {
						$('#myModal').hide();
					}
					;
				}
			</script>
		</c:when>
		<c:otherwise>
			<!-- loader -->
			<div id="pb_loader" class="show fullscreen">
				<svg class="circular" width="48px" height="48px">
    <Circle class="path-bg" cx="24" cy="24" r="22" fill="none"
						stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
						stroke-width="4" stroke-miterlimit="10" stroke="#1d82ff" /></svg>
			</div>

		</c:otherwise>
	</c:choose>

	<!-- END section -->

	<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

</body>
</html>
