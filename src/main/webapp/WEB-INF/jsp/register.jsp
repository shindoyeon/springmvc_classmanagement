<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<meta name="description"
	content="Free Bootstrap 4 Template by uicookies.com">
<meta name="keywords"
	content="Free website templates, Free bootstrap themes, Free template, Free bootstrap, Free website template">

<link
	href="https://fonts.googleapis.com/css?family=Crimson+Text:400,400i,600|Montserrat:200,300,400"
	rel="stylesheet">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/fonts/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/fonts/law-icons/font/flaticon.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/fonts/fontawesome/css/font-awesome.min.css">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/slick.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/slick-theme.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/helpers.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/landing-2.css">
</head>
<body data-spy="scroll" data-target="#pb-navbar" data-offset="200">

<nav
		class="navbar navbar-expand-lg navbar-dark pb_navbar pb_scrolled-light"
		id="pb-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.html"></a>
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
					<h2 class="heading mb-3">Register..</h2>
					<div class="sub-heading">
					</div>
				</div>
				<div class="col-md-5 relative align-self-center">
					<form:form modelAttribute="student"
						action="/classmanagement/registerCheck" method="POST"
						accept-charset="UTF-8" class="bg-white rounded pb_form_v1">
						<h2 class="mb-4 mt-0 text-center">Sign Up for Free</h2>
						

						<div class="form-group">
							<form:input type="text" class="form-control pb_height-50 reverse"
								placeholder="student_Name " path="student_Name" />
							<form:errors cssStyle="color: red;" path="student_Name"
								cssClass="error" />
						</div>


						<div class="form-group">
							<form:input type="text" class="form-control pb_height-50 reverse"
								placeholder="student_Email " path="student_Email" />
							<form:errors cssStyle="color: red;" path="student_Email" />
						</div>

					
					    <div class="form-group">
							<form:input type="text" class="form-control pb_height-50 reverse"
								placeholder="student_ID" path="student_ID" />
							<form:errors cssStyle="color: red;" path="student_ID" />
						</div>

						<div class="form-group">
							<form:input type="password"
								class="form-control pb_height-50 reverse"
								placeholder="student_PW" path="student_PW" />
							<form:errors cssStyle="color: red;" path="student_PW" />
						</div>

						<div class="form-group">
							<form:input type="password"
								class="form-control pb_height-50 reverse"
								placeholder="student_PWCheck" path="student_PWCheck" />
							<form:errors cssStyle="color: red;" path="student_PWCheck" />
						</div>

						

						<div class="form-group">
							<input type="submit"
								class="btn btn-primary btn-lg btn-block pb_btn-pill  btn-shadow-blue"
								value="Register">
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</section>
	<!-- END section -->

	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/assets/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/slick.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.mb.YTPlayer.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.easing.1.3.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

</body>
</html>