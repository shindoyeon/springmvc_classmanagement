<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Class Management</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Lingua project">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- jQuery -->

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
			integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
			crossorigin="anonymous"></script>

	<!-- Bootstrap CSS -->

	<link rel="stylesheet"
		  href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
		  integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
		  crossorigin="anonymous">
<link
	href="${pageContext.request.contextPath}/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/styles/main_styles.css?ver=1">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/styles/responsive.css">
</head>
<body>
	<div class="super_container">
		<!-- Header -->
		<header class="header">
			<!-- Top Bar -->
			<div class="top_bar">
				<div class="top_bar_container">
					<div class="container">
						<div class="row">
							<div class="col">
								<div
									class="top_bar_content d-flex flex-row align-items-center justify-content-start">
									<div class="top_bar_right ml-auto">
										<!-- Social -->
										<div class="top_bar_social">
											<span class="top_bar_title social_title"><a
												href="logout">Logout</a></span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Header Content -->
			<div class="header_container">
				<div class="container">
					<div class="row">
						<div class="col">
							<div
								class="header_content d-flex flex-row align-items-center justify-content-start">
								<div class="logo_container mr-auto">
									<a href="home">
										<div class="logo_text">Class Management</div>
									</a>
								</div>
								<nav class="main_nav_contaner">
									<ul class="main_nav">
										<li class="active"><a href="#">Home</a></li>
										<ul class="lang_list">
											<li class="hassubs"><a href="class">강의</a></li>
										</ul>
										<ul class="lang_list">
											<li class="hassubs"><a href="subject">과제</a></li>
										</ul>
										<ul class="lang_list">
											<li class="hassubs"><a href="schedule">일정</a></li>
										</ul>
									</ul>
								</nav>
								<div class="header_content_right ml-auto text-right">
									<div class="header_search">
										<div class="search_form_container">
											<form action="#" id="search_form"
												class="search_form trans_400">
												<input type="search" class="header_search_input trans_400"
													placeholder="Type for Search" required="required">
												<div class="search_button">
													<i class="fa fa-search" aria-hidden="true"></i>
												</div>
											</form>
										</div>
									</div>
									<!-- Hamburger -->
									<div class="user">
										<a class="dropdown" data-toggle="dropdown"
											aria-expanded="true"> <i class="fa fa-user"
											aria-hidden="true"></i></a>

										<ul class="dropdown-menu " style="right: 0; left: auto;">
											<li>
												<div class="blog_category">

													<h5>
														&nbsp&nbsp${loginSuccess.student_ID}님 환영합니다.<br>
														<br>&nbsp&nbsp${loginSuccess.student_Email}
													</h5>
													<div class="home_button trans_200">
														<a href="class">정보수정</a>
													</div>

												</div>
											</li>
										</ul>
									</div>
									<div class="hamburger menu_mm">
										<i class="fa fa-bars menu_mm" aria-hidden="true"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
		<!-- Menu -->
		<div
			class="menu d-flex flex-column align-items-end justify-content-start text-right menu_mm trans_400">
			<div class="menu_close_container">
				<div class="menu_close">
					<div></div>
					<div></div>
				</div>
			</div>
			<div class="search">
				<form action="#" class="header_search_form menu_mm">
					<input type="search" class="search_input menu_mm"
						placeholder="Search" required="required">
					<button
						class="header_search_button d-flex flex-column align-items-center justify-content-center menu_mm">
						<i class="fa fa-search menu_mm" aria-hidden="true"></i>
					</button>
				</form>
			</div>
			<nav class="menu_nav">
				<ul class="menu_mm">
					<li class="menu_mm"><a href="#">Home</a></li>
					<li class="menu_mm"><a href="class">강의</a></li>
					<li class="menu_mm"><a href="subject">과제</a></li>
					<li class="menu_mm"><a href="schedule">일정</a></li>
				</ul>
			</nav>
		</div>

		<!-- Home -->

		<div class="home">
			<div class="home_background"
				style="background-image: url(${pageContext.request.contextPath}/resources/images/index_background.jpg);"></div>
			<div class="home_content">
				<div class="container">
					<div class="row">
						<div class="col text-center">
							<br>
							<h1 class="home_title">
								Welcome! <br><br>${loginSuccess.student_ID}</h1>

						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Events -->

		<!-- Blog -->
		<div class="col">
			<br>
			<br>
			<h2 class="section_title text-center">Upcoming Events</h2>
		</div>
		<div class="blog">
			<div class="container">
				<div class="row row-lg-eq-height">
					<!-- Blog Left -->
					<div class="col-lg-6">
						<div class="blog_left">
							<div class="blog_title">Quick Link</div>
							<div class="blog_categories">
								<div class="row categories_row">
									<!-- Category -->
									<div class="col-md-4 blog_category_col">
										<a href="class">
											<div class="blog_category">
												<div class="blog_category_image">
													<img
														src="${pageContext.request.contextPath}/resources/images/blog_1.jpg"
														alt="">
												</div>
												<div class="blog_category_title">시간표 등록</div>
											</div>
										</a>
									</div>

									<div class="col-md-4 blog_category_col">
										<a href="calendar">
											<div class="blog_category">
												<div class="blog_category_image">
													<img
														src="${pageContext.request.contextPath}/resources/images/blog_3.jpg"
														alt="">
												</div>
												<div class="blog_category_title">일정 등록</div>
											</div>
										</a>
									</div>
									<br>
									<!-- Category -->
									<div class="col-md-4 blog_category_col">
										<a href="blog.html">
											<div class="blog_category">
												<div class="blog_category_image">
													<img
														src="${pageContext.request.contextPath}/resources/images/blog_4.jpg"
														alt="">
												</div>
												<div class="blog_category_title">정보 수정</div>
											</div>
										</a>
									</div>
									<!-- Category -->
									
									<!-- Category -->
									
								</div>
							</div>
						</div>
					</div>
					<!-- Blog Right -->
					<div class="col-lg-6">
						<div class="blog_right">
							<div class="blog_image"
								style="background-image:url(${pageContext.request.contextPath}/resources/images/blog_7.jpg)"></div>
							<div class="blog_title_container">
								
								
								<div class="read_more">
									<a href="blog_single.html">Read More <img
										src="${pageContext.request.contextPath}/resources/images/right.png"
										alt=""></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer -->
		<footer class="footer">
			<div class="footer_body">
				<div class="container">
					<div class="row">
						<!-- Newsletter -->
						<div class="col-lg-3 footer_col">
							<div
								class="newsletter_container d-flex flex-column align-items-start justify-content-end">
								<div class="footer_logo mb-auto">
									<a href="#">Class Management</a>
								</div>
								<form action="#" id="newsletter_form" class="newsletter_form">
									<input type="email" class="newsletter_input"
										placeholder="Email" required="required">
									<button class="newsletter_button">
										<i class="fa fa-long-arrow-right" aria-hidden="true"></i>
									</button>
								</form>
							</div>
						</div>
						<!-- About -->
						<div class="col-lg-2 offset-lg-3 footer_col">
							<div>
								<div class="footer_title">A</div>
								<ul class="footer_list">
									<li><a href="#">Courses</a></li>
									<li><a href="#">Team</a></li>
								</ul>
							</div>
						</div>
						<!-- Help & Support -->
						<div class="col-lg-2 footer_col">
							<div class="footer_title">B &amp;</div>
							<ul class="footer_list">
								<li><a href="#">Discussions</a></li>
								<li><a href="#">Troubleshooting</a></li>
							</ul>
						</div>
						<!-- Privacy -->
						<div class="col-lg-2 footer_col clearfix">
							<div>
								<div class="footer_title">C &amp;</div>
								<ul class="footer_list">
									<li><a href="#">Community Guidelines</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="copyright">
				<div class="container">
					<div class="row">
						<div class="col">
							<div
								class="copyright_content d-flex flex-md-row flex-column align-items-md-center align-items-start justify-content-start">
								<div class="cr">
									<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
									<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								</div>
								<div class="cr_right ml-md-auto"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>
	</div>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/easing/easing.js"></script>
</body>
</html>