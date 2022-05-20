<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleft.org">
<head>
<title>Class Management</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Lingua project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
   document.getElementsByTagName("html")[0].className += " js";
</script>

<script src="http://code.jquery.com/jquery-latest.js"></script>

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
	href="${pageContext.request.contextPath}/resources/styles/main_styles2.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/styles/responsive.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/timet_assets/css/style2.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/timet_assets/css/subjects3.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/timet_assets/css/common2.css">

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
</head>
<body>

	<div class="super_container">

		<!-- Header -->

		<header class="header">

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
										<li class="hassubs"><a href="home">Home</a></li>
										<ul class="lang_list">
											<li class="hassubs"><a href="class">강의</a></li>
										</ul>
										<ul class="lang_list">
											<li class="active"><a href="#">과제</a></li>
										</ul>
										<ul class="lang_list">
											<li class="hassubs"><a href="schedule">일정</a></li>
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

		<div class="home">
			<div class="home_background"
				style="background-image: url(${pageContext.request.contextPath}/resources/images/index_background.jpg);"></div>
			<div class="home_content">
				<div class="container">
					<div class="row">
						<div class="col text-center">
							<button class="form_button_top">
								subject </button>

						</div>
					</div>
				</div>
			</div>
		</div>


		<form action="/classmanagement/taskCheck" method="POST"
			accept-charset="UTF-8" id="customsubjects"
			style="display: none; left: 935.333px;">
			<a title="닫기" class="close" id=""></a>
			<div class="form-group">
				<label for="message-text" class="col-form-label">subName:</label>
				<p>
					<select class="starthour" name="task_Name" id="check">
						<c:forEach var="member" items="${subjectList}" varStatus="status">
							<option value="${member.sub_Name}">${member.sub_Name}</option>
						</c:forEach>
					</select>
				</p>
			</div>
			<div class="form-group">
				<label for="message-text" class="col-form-label">Pfname:</label> <input
					type="text" class="form-control" name="task_Pfname" />

			</div>
			<div class="form-group">
				<label for="recipient-name" class="col-form-label">To do:</label> <input
					type="text" class="form-control" name="task_Todo" />
			</div>
			<div class="form-group">
				<label for="message-text" class="col-form-label">Participants:</label>
				<input type="text" class="form-control" name="task_Person" />
			</div>

			<div class="submit">
				<input type="submit" value="저장" class="button">
			</div>
		</form>
		
		

		<div class="events">
			<div class="container">
				<div class="blog_title">Assignments
				<button id="myBtn" type="submit" class="form_button trans_200">
								+</button>
				</div>
				<div class="row events_row">

					<c:forEach var="member" items="${taskList}" varStatus="status">
						<!-- Event -->
						<div class="col-lg-3 event_col" id="contents">
							<div class="event">
								<div class="event_image"><img
										src="${pageContext.request.contextPath}/resources/images/event_2.jpg"
										alt="">
								</div>
								<div
									class="event_body d-flex flex-row align-items-center justify-content-start">
									<div class="event_title">
										<a data-toggle="modal" href="#" id="${member.num}">
											${member.task_Todo}</a>
									</div>
								</div>
							</div>
						</div>



					</c:forEach>

				</div>
			</div>


		</div>
		<div class="blog">
			<div class="container">
				<div class="row row-lg-eq-height">

					<!-- Blog Left -->
					<div class="col-lg-6">
						<div class="blog_left">
							<div class="blog_title">Team Project
							<button id="myBtn2" type="submit" class="form_button trans_200">
								+</button>
								<form
									action="/classmanagement/insertTeamCheck" method="POST"
									accept-charset="UTF-8" id="insertTeam"
									style="display: none; left: 935.333px;">
									<a title="닫기" class="close" id=""></a>

									<div class="form-group">
										<label for="message-text" class="col-form-label">팀 이름을
											입력해주세요</label> 
											<input type="text" class="form-control"
											name="team_Name" />

									</div>

									<div class="submit">
										<input type="submit" value="저장" class="button">
									</div>
								</form>
								
							</div>
							<div class="blog_categories">
								<div class="row categories_row">
									<!-- Category -->
									<c:forEach var="name" items="${teamName}" varStatus="status">
									<div class="col-md-4 blog_category_col">
											<span class="blog_category">
												<span class="blog_category_image">
													<img
														src="${pageContext.request.contextPath}/resources/images/blog_1.jpg"
														alt="">
												</span>
												<span class="blog_category_title" id="${name.team_Name}">${name.team_Name}</span>
											</span>
									</div>
									</c:forEach>

									

								</div>
							</div>
						</div>
					</div>

					<!-- Blog Right -->

					
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
         var modal = document
         .getElementById('customsubjects');
         
         var modal2 = document
         .getElementById('insertTeam');

         var btn = document.getElementById("myBtn");
         var btn2 = document.getElementById("myBtn2");
         
        
         btn.onclick = function() {
             modal.style.display = "block";
          }

         btn2.onclick = function() {
             modal2.style.display = "block";
          }
         
         
         var spans = document
         .getElementsByClassName("close")[0];
         
      // When the user clicks on <span> (x), close the modal
         spans.onclick = function() {
            modal.style.display = "none";
         }
         $(document).ready(function () {
             $("a").each(function () {
                 $(this).click(function () {
                     $(this).addClass("active");                     
                     $(this).siblings().removeClass("active");
              });
             });
         });

         $(document).ready(function () {
             $("span").each(function () {
                 $(this).click(function () {
                     $(this).addClass("teamPJ");                     
                     $(this).siblings().removeClass("teamPJ");
              });
             });
         });


		$(document).on("click", ".active", function() {
			var a = $(this).attr('id');
			url = "${pageContext.request.contextPath}/subject";
			if (a != '')
				url = url + "/" + a;
			console.log(a);
			location.href = url;

		});

		$(document).on("click", ".teamPJ", function() {
			var a = $(this).text();
			url = "${pageContext.request.contextPath}/team";
			if (a != '')
				url = url + "/" + a;
			console.log(a);
			location.href = url;

		});

		



		// When the user clicks anywhere outside of the modal, close it

		$(document).ready(
				function() {
					$("#check").on(
							"change",
							function() {
								console.log($(this)
										.find(
												"option[value='"
														+ $(this).val() + "']")
										.text());
							});
				});
	</script>

	<script
		src="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/easing/easing.js"></script>

</body>
</html>
