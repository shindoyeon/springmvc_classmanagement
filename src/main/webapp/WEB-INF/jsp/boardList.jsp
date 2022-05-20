<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>

<head>
<!-- jQuery -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>


<!-- Bootstrap CSS -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">



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

<meta charset="UTF-8">

<title>board</title>
<style>

body {

padding-top: 70px;

padding-bottom: 30px;

}

</style>
<script>

	$(document).on('click', '#btnWriteForm', function(e) {

		e.preventDefault();

		location.href = "${pageContext.request.contextPath}/boardForm/"+"${str}";

	});

	$(document).on('click', '#btnsubject', function(e) {

		e.preventDefault();

		location.href = "${pageContext.request.contextPath}/subject";

	});
</script>



</head>

<body>
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
									<a href="#">
										<div class="logo_text">Class Management</div>
									</a>
								</div>
								<nav class="main_nav_contaner">
									<ul class="main_nav">
										<li class="active"><a href="/classmanagement/home">Home</a></li>
										<ul class="lang_list">
											<li class="hassubs"><a href="/classmanagement/class">강의</a></li>
										</ul>
										<ul class="lang_list">
											<li class="hassubs"><a href="/classmanagement/subject">과제</a></li>
										</ul>
										<ul class="lang_list">
											<li class="hassubs"><a href="#">일정</a></li>
										</ul>
										<ul class="lang_list">
											<li class="hassubs"><a href="#">자유게시판</a></li>
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
										<a href="#"><i class="fa fa-user" aria-hidden="true"></i></a>
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
							<button  id="myBtn" class="form_button_top" name="${str}">
								팀원 추가 </button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<form action="/classmanagement/addTeamPerson/${str}" method="POST"
			accept-charset="UTF-8" id="customsubjects"
			style="display: none; left: 935.333px;">	
			<a title="닫기" class="close" id=""></a>

			<div class="form-group">
				<label for="message-text" class="col-form-label">팀원 학번을 입력해주세요</label> <input
					type="text" class="form-control" name="student_ID" />
			</div>
			
			<div class="submit">
				<input type="submit" value="저장" class="button" id="move">
			</div>
		</form>
		<div class="container">
				<div class="row">
					<div class="col">
						<h2 class="section_title text-center"> 구성원 :
						<c:forEach var="list" items="${names}">
							${list.student_ID}, 
						</c:forEach>
						</h2>
					</div>
				</div>
				</div>
			
<article>
		<div class="container">

			<div class="table-responsive">

				<table class="table table-striped table-sm">

					<colgroup>

						<col style="width: 5%;" />

						<col style="width: auto;" />

						<col style="width: 15%;" />

						<col style="width: 10%;" />

						<col style="width: 10%;" />

					</colgroup>

					<thead>

						<tr>

							<th>NO</th>

							<th>글제목</th>

							<th>작성자</th>


						</tr>

					</thead>

					<tbody>

						<c:choose>

							<c:when test="${empty projectList}">

								<tr>
									<td colspan="5" align="center">데이터가 없습니다.</td>
								</tr>

							</c:when>

							<c:when test="${!empty projectList}">

								<c:forEach var="list" items="${projectList}">

									<tr>

										<td><c:out value="${list.project_Num}" /></td>

										<td><a data-toggle="modal" href="#" id="${list.project_Num}"><c:out value="${list.project_Title}" /></a></td>

										<td><c:out value="${list.student_ID}" /></td>

							

									</tr>

								</c:forEach>

							</c:when>

						</c:choose>

					</tbody>

				</table>

			</div>
			<script type="text/javascript">

			 var modal = document
	         .getElementById('customsubjects');
	         
			var btn = document.getElementById("myBtn");
			btn.onclick = function() {
				modal.style.display = "block";
				
			};

	         $(document).ready(function () {
	             $("a").each(function () {
	                 $(this).click(function () {
	                     $(this).addClass("active");                     
	                     $(this).siblings().removeClass("active");
	              });
	             });
	         });

	 		$(document).on("click", ".active", function() {
				var a = $(this).attr('id');
				url = "${pageContext.request.contextPath}/BoardContents";
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
			<div>

				<button type="button" class="btn btn-sm btn-primary"
					id="btnWriteForm">글쓰기</button>
				<button type="button" class="btn btn-sm btn-primary"
					id="btnsubject">과제</button>

			</div>


		</div>
	</article>


</body>

</html>
